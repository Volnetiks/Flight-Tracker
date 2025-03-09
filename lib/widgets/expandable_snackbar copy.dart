import 'package:flight_tracker/pages/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DraggableScrollSheet extends StatefulWidget {
  final Widget previewContent;
  final Widget detailedContent;
  final Widget fullScreenContent;
  final Color handleColor;
  final Color backgroundColor;
  final double minHeight;
  final double midHeight;
  final double borderRadius;
  final Duration animationDuration;
  final RouteTransitionsBuilder? pageTransition;

  const DraggableScrollSheet({
    Key? key,
    required this.previewContent,
    required this.detailedContent,
    required this.fullScreenContent,
    this.handleColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.minHeight = 60.0,
    this.midHeight = 300.0,
    this.borderRadius = 16.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.pageTransition,
  }) : super(key: key);

  @override
  _DraggableScrollSheetState createState() => _DraggableScrollSheetState();
}

enum SheetState { collapsed, expanded, fullScreen }

class _DraggableScrollSheetState extends State<DraggableScrollSheet>
    with SingleTickerProviderStateMixin {
  SheetState _currentState = SheetState.collapsed;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  double _startDragY = 0;
  double _currentHeight = 0;
  double _dragDistance = 0;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.minHeight;

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _heightAnimation = Tween<double>(
      begin: widget.minHeight,
      end: widget.midHeight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _heightAnimation.addListener(() {
      setState(() {
        _currentHeight = _heightAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSheetState() {
    switch (_currentState) {
      case SheetState.collapsed:
        _expandToMiddle();
        break;
      case SheetState.expanded:
        timeDilation = 5.0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => InfoPage()),
        );
        break;
      default:
        break;
    }
  }

  void _expandToMiddle() {
    _controller.forward();
    setState(() {
      _currentState = SheetState.expanded;
    });
  }

  void _collapseToBottom() {
    _controller.reverse();
    setState(() {
      _currentState = SheetState.collapsed;
    });
  }

  void _onDragStart(DragStartDetails details) {
    _startDragY = details.globalPosition.dy;
    _dragDistance = 0;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    double dragDelta = _startDragY - details.globalPosition.dy;
    _dragDistance += dragDelta;

    double newHeight = _currentHeight + dragDelta;

    // Limit the height between min and mid height
    if (newHeight >= widget.minHeight && newHeight <= widget.midHeight) {
      setState(() {
        _currentHeight = newHeight;
        _controller.value =
            (_currentHeight - widget.minHeight) /
            (widget.midHeight - widget.minHeight);
      });
    }

    _startDragY = details.globalPosition.dy;
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dy;

    // Determine which state to snap to based on drag distance, current position and velocity
    if (velocity < -500 || _dragDistance > 100) {
      // Fast upward swipe or significant upward drag
      if (_currentState == SheetState.collapsed) {
        _expandToMiddle();
      } else if (_currentState == SheetState.expanded) {
        timeDilation = 5.0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => InfoPage()),
        );
      }
    } else if (velocity > 500 || _dragDistance < -100) {
      // Fast downward swipe or significant downward drag
      if (_currentState == SheetState.expanded) {
        _collapseToBottom();
      }
    } else {
      // No significant velocity or distance, snap based on position
      if (_controller.value > 0.5) {
        _expandToMiddle();
      } else {
        _collapseToBottom();
      }
    }

    _dragDistance = 0;
  }

  @override
  Widget build(BuildContext context) {
    // Collapsed or expanded mode
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      height: _currentHeight,
      child: GestureDetector(
        onVerticalDragStart: _onDragStart,
        onVerticalDragUpdate: _onDragUpdate,
        onVerticalDragEnd: _onDragEnd,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHandle(),
              Expanded(
                child: SingleChildScrollView(
                  physics:
                      _currentState == SheetState.expanded
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                  child:
                      _currentState == SheetState.collapsed
                          ? widget.previewContent
                          : widget.detailedContent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return GestureDetector(
      onTap: _toggleSheetState,
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.borderRadius),
            topRight: Radius.circular(widget.borderRadius),
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: widget.handleColor,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }
}
