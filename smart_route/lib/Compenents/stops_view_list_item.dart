import 'package:flutter/material.dart';

class StopsViewListItem extends StatelessWidget {
  final String placeName;
  final String placeCategory;
  final double rating;
  final String placeIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const StopsViewListItem({
    Key? key,
    required this.placeName,
    required this.placeCategory,
    required this.rating,
    required this.placeIcon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (_) => onTap(),
              activeColor: Color.fromARGB(255, 26, 124, 111),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(width: 4),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade200.withValues(alpha: 0.4),
                        Colors.teal.shade900.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                Center(
                  child: Icon(
                    Icons.business,
                    size: 32,
                    color: Colors.teal.shade400,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    placeName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),

                  Text(
                    placeCategory,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.teal.shade100.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                rating.toStringAsFixed(1),
                style: TextStyle(
                  color: Colors.teal.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
