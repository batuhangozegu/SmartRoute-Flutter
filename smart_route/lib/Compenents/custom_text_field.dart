import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController controller;
  final IconData? icon;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.placeHolder,
    required this.controller,
    this.onChanged,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.teal.shade400.withValues(alpha: 0.2),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.3),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.teal.shade400.withValues(alpha: 0.2),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: Colors.teal.shade400),
              SizedBox(width: 12),
            ],
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal.shade400.withValues(alpha: 0.95),
                ),
                decoration: InputDecoration(
                  hintText: placeHolder,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.teal.shade400.withValues(alpha: 0.5),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
