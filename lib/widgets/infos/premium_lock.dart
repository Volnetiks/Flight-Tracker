import 'package:flutter/material.dart';

class PremiumLock extends StatelessWidget {
  const PremiumLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 236, 212),
        borderRadius: BorderRadius.circular(90),
      ),
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      child: Row(
        spacing: 5,
        children: [
          Icon(
            Icons.lock_outline_rounded,
            color: Colors.orangeAccent,
            size: 12,
          ),
          Text(
            "Premium",
            style: TextStyle(fontSize: 12, color: Colors.orangeAccent),
          ),
        ],
      ),
    );
  }
}
