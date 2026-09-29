//import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/property.dart';
import '../widgets/glass_container.dart';

class DetailsScreen extends StatelessWidget {
  final Property property;

  const DetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*Image.asset(
            'assets/images/hero_image.jpg',
            //height: 820,
            width: double.infinity,
            fit: BoxFit.cover,
          ),*/
          // Hero image with gradient
          Container(
            //height: 820,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
              ),
            ),
          ),

          // Back / share / heart glass buttons
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const GlassContainer(
                    borderRadius: 24,
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                ),
                Row(
                  children: [
                    const GlassContainer(
                      borderRadius: 24,
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.share, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8),
                    const GlassContainer(
                      borderRadius: 24,
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Scrollable content sheet
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(property.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text("UGX ${property.price}", style: const TextStyle(fontSize: 18, color: Colors.blue)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(property.location, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _StatTile(icon: Icons.bed, label: "${property.beds} Beds"),
                        _StatTile(icon: Icons.bathtub, label: "${property.baths} Bath"),
                        _StatTile(icon: Icons.square_foot, label: "${property.sqft} Sqft"),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      "A modern home with great access to the city, close to schools and shopping.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 100), // clears space if a bottom bar is added later
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

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}