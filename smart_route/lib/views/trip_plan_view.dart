import 'package:flutter/material.dart';
import 'package:smart_route/Compenents/trip_plan_list_item.dart';

class TripPlanView extends StatelessWidget {
  final List<String> selectedStops;

  const TripPlanView({Key? key, required this.selectedStops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gezi Planı")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: selectedStops.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TripPlanListItem(
                orderNumber: index + 1,
                title: selectedStops[index],
                stops: [
                  {'name': 'Sapanca Gölü', 'icon': Icons.water},
                  {'name': 'Yedi Göller', 'icon': Icons.water},
                  {'name': 'Abant Gölü', 'icon': Icons.landscape},
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
