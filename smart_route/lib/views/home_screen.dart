import 'package:flutter/material.dart';
import 'package:smart_route/Compenents/custom_text_field.dart';
import 'package:smart_route/Compenents/gradient_button.dart';
import 'package:smart_route/Compenents/list_item_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Rota Sistemi"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              children: [
                GradientButton(
                  buttonText: "Yeni Rota Oluştur",
                  gradientColors: [Color(0xFF40E0D0), Color(0xFF2DD4BF)],
                  gradientStartPoint: Alignment.centerLeft,
                  gradientEndPoint: Alignment.centerRight,
                  onTap: () {
                    print("Tiklandı");
                  },
                ),

                const SizedBox(height: 20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kayıtlı Rotalar",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                ListItemView(),

                const SizedBox(height: 30),
                CustomTextField(
                  placeHolder: "Başlangıç Şehri",
                  controller: _controller,
                  icon: Icons.location_on,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
