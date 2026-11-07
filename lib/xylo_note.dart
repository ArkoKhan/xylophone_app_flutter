import 'package:flutter/material.dart';

class XyloNote extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  const XyloNote({
    super.key,
    this.backgroundColor = Colors.red,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,
          ),

          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
      ),
    );
  }
}
