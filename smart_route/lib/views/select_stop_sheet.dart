import 'package:flutter/material.dart';
import 'package:smart_route/Compenents/stops_view_list_item.dart';
import 'package:smart_route/views/trip_plan_view.dart';

class SelectStopSheet extends StatefulWidget {
  const SelectStopSheet({super.key});

  @override
  State<SelectStopSheet> createState() => _SelectStopSheetState();
}

class _SelectStopSheetState extends State<SelectStopSheet> {
  List<Map<String, dynamic>> stops = [
    {
      'name': 'Starbucks',
      'category': 'Kafe',
      'rating': 4.5,
      'isSelected': false,
    },
    {
      'name': 'McDonald\'s',
      'category': 'Restoran',
      'rating': 4.2,
      'isSelected': false,
    },
    {
      'name': 'Shell',
      'category': 'Benzinlik',
      'rating': 4.0,
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Durak Seç",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),

          Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: stops.length,
              itemBuilder: (context, index) {
                return StopsViewListItem(
                  placeName: stops[index]['name'],
                  placeCategory: stops[index]['category'],
                  rating: stops[index]['rating'],
                  placeIcon: 'Icons.business',
                  isSelected: stops[index]['isSelected'],
                  onTap: () {
                    setState(() {
                      stops[index]['isSelected'] = !stops[index]['isSelected'];
                    });
                  },
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                List<String> selectedStops = stops
                    .where((stop) => stop['isSelected'])
                    .map((stop) => stop['name'] as String)
                    .toList();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TripPlanView(selectedStops: selectedStops),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color.fromARGB(255, 26, 124, 111),
              ),
              child: Text(
                "Onayla",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
