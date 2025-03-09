import 'package:flight_tracker/pages/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DraggableScrollSheet extends StatefulWidget {
  final Widget previewContent;
  final Color handleColor;
  final Color backgroundColor;
  final double minHeight;
  final double borderRadius;
  final Duration animationDuration;
  final RouteTransitionsBuilder? pageTransition;

  const DraggableScrollSheet({
    super.key,
    required this.previewContent,
    this.handleColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.minHeight = 60.0,
    this.borderRadius = 16.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.pageTransition,
  });

  @override
  State<DraggableScrollSheet> createState() => _DraggableScrollSheetState();
}

class _DraggableScrollSheetState extends State<DraggableScrollSheet>
    with SingleTickerProviderStateMixin {
  double _startDragY = 0;
  double _dragDistance = 0;

  @override
  void initState() {
    super.initState();
  }

  void _navigateToFullScreen() {
    timeDilation = 3.0;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => InfoPage()),
    );
  }

  void _onDragStart(DragStartDetails details) {
    _startDragY = details.globalPosition.dy;
    _dragDistance = 0;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    double dragDelta = _startDragY - details.globalPosition.dy;
    _dragDistance += dragDelta;
    _startDragY = details.globalPosition.dy;
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dy;

    if (velocity < -500 || _dragDistance > 100) {
      _navigateToFullScreen();
    }

    _dragDistance = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      height: widget.minHeight,
      child: GestureDetector(
        onVerticalDragStart: _onDragStart,
        onVerticalDragUpdate: _onDragUpdate,
        onVerticalDragEnd: _onDragEnd,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
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
                  physics: const NeverScrollableScrollPhysics(),
                  child: widget.previewContent,
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
      onTap: _navigateToFullScreen,
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
