import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final List<Color> gradientColors;
  final Alignment gradientStartPoint;
  final Alignment gradientEndPoint;
  final VoidCallback onTap;

  const GradientButton({
    Key? key,
    required this.buttonText,
    required this.gradientColors,
    required this.gradientStartPoint,
    required this.gradientEndPoint,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxButtonWidth = screenWidth > 600 ? 500.0 : double.infinity;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxButtonWidth),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: gradientStartPoint,
            end: gradientEndPoint,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
