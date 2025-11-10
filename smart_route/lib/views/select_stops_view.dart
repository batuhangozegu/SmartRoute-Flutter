import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart_route/views/select_stop_sheet.dart';

class SelectStopsView extends StatefulWidget {
  const SelectStopsView({super.key});

  @override
  State<SelectStopsView> createState() => _SelectStopsViewState();
}

class _SelectStopsViewState extends State<SelectStopsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
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
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.teal.shade400.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        "Durak Seç",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    IconButton(
                      icon: Icon(Icons.add_location, size: 32),
                      onPressed: () async {
                        final selectedStops = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => SelectStopSheet(),
                        );

                        if (selectedStops != null) {
                          print("Seçili duraklar : $selectedStops");
                        }
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
