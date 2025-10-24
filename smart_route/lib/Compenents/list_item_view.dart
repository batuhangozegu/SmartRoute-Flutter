import 'package:flutter/material.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dış kutu dekorasyonu: gradient, gölge, border
      decoration: BoxDecoration(
        // Beyazdan hafif griye geçiş (sol üst → sağ alt)
        gradient: LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 247, 247, 247)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        // Kart gölgesi
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        // İnce kenarlık
        border: Border.all(
          width: 1.0,
          color: Colors.black.withValues(alpha: 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Üst satır: Tarih bilgisi + chevron
            Row(
              children: [
                // Takvim ikonu
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.teal.shade400,
                ),
                SizedBox(width: 8),
                // Oluşturulma tarihi
                Text(
                  "16-10-2025 Tarihinde oluşturuldu",
                  style: TextStyle(fontSize: 12, color: Colors.teal.shade400),
                ),
                Spacer(),
                // Sağ ok işareti
                Icon(
                  Icons.chevron_right,
                  size: 14,
                  color: Colors.grey.shade600,
                ),
              ],
            ),

            // Ayırıcı çizgi
            Divider(height: 24),

            // Alt satır: Konum bilgileri
            Row(
              children: [
                // Konum pin ikonu
                Icon(Icons.location_on, size: 24, color: Colors.teal.shade700),
                SizedBox(width: 8),

                // Şehir adları ve detaylar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Şehir isimleri (bold)
                      Text(
                        "İstanbul - Konya",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Süre ve mesafe bilgileri
                      Row(
                        children: [
                          // Saat ikonu
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 4),
                          // Süre
                          Text(
                            "2 gün",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(width: 12),
                          // Araba ikonu
                          Icon(
                            Icons.directions_car,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 4),
                          // Mesafe
                          Text(
                            "345 km",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
