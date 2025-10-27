import 'package:flutter/material.dart';
import 'package:smart_route/Compenents/custom_text_field.dart';
import 'package:smart_route/Compenents/gradient_button.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  final TextEditingController _startCityController = TextEditingController();
  final TextEditingController _endCityController = TextEditingController();

  @override
  void dispose() {
    _startCityController.dispose();
    _endCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Rota Oluştur"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF40E0D0).withValues(alpha: 0.1),
              Color(0xFF2DD4BF).withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  icon: Icons.location_on,
                  placeHolder: "Başlangıç Şehri",
                  controller: _startCityController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.location_on,
                  placeHolder: "Bitiş Şehri",
                  controller: _endCityController,
                ),
                Spacer(),
                GradientButton(
                  buttonText: "Turistik Yerleri Bul",
                  gradientColors: [Color(0xFF40E0D0), Color(0xFF2DD4BF)],
                  gradientStartPoint: Alignment.centerLeft,
                  gradientEndPoint: Alignment.centerRight,
                  onTap: () {
                    print("Tiklandı");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
