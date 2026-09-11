import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/glass_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find the Place\nyou'll love",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const Text(
                    "Browse, save, and explore homes made for you.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const Spacer(),

                  GlassContainer(
                    borderRadius: 30,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Center(
                      child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),

                  const SizedBox(height: 12),

                  GlassContainer(
                    borderRadius: 30,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Center(
                      child: Text("Login", style: TextStyle(color:Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
