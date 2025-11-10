import 'package:flutter/material.dart';

class TripPlanListItem extends StatelessWidget {
  final int orderNumber;
  final String title;
  final List<Map<String, dynamic>> stops;

  const TripPlanListItem({
    Key? key,
    required this.orderNumber,
    required this.title,
    required this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(
          width: 1,
          color: Colors.black.withValues(alpha: 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.teal.shade700,
                  child: Text(
                    "$orderNumber",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ...stops.map(
                        (stop) => Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: TripPlanListItemRow(
                            stopsName: stop['name'],
                            stopsIcon: stop['icon'],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "260 km - 5 Saat",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => print("Tıklandı"),
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal.shade400.withValues(alpha: 0.5),
                  ),
                  child: Center(
                    child: Text(
                      "Haritada Görüntüle",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripPlanListItemRow extends StatelessWidget {
  final String stopsName;
  final IconData stopsIcon;

  const TripPlanListItemRow({
    Key? key,
    required this.stopsName,
    required this.stopsIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(stopsIcon, color: Colors.teal.shade700, size: 18),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            stopsName,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
