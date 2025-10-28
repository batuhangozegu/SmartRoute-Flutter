import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPlaceHolder extends StatelessWidget {
  final bool showMap;

  const MapPlaceHolder({Key? key, this.showMap = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.teal.shade400.withValues(alpha: 0.4),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.6),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.teal.shade200.withValues(alpha: 0.3),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: showMap ? _buildMap() : _buildMapPlaceHolder(),
      ),
    );
  }

  Widget _buildMapPlaceHolder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map,
            size: 50,
            color: Colors.teal.shade400.withValues(alpha: 0.4),
          ),
          SizedBox(height: 12),
          Text(
            "Lütfen Şehirleri Giriniz.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(39.9334, 32.8597),
        initialZoom: 6.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.smart_route',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(41.022, 27.4225),
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}
