import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/property.dart';
import '../widgets/glass_container.dart';
import '../theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../state/saved_properties.dart';

class DetailsScreen extends StatelessWidget {
  final Property property;

  const DetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image + top buttons + overlapping stats pill
            Stack(
              clipBehavior: Clip.none, // allows the pill to overflow below the image
              children: [
                Image.asset(property.imageUrl, height: 320, width: double.infinity, fit: BoxFit.cover),

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
                          Consumer<SavedProperties>(
                            builder: (context, savedProperties, child) {
                              final isSaved = savedProperties.isSaved(property);
                              return GestureDetector(
                                onTap: () => savedProperties.toggle(property),
                                child: GlassContainer(
                                  borderRadius: 24,
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    isSaved ? Icons.favorite : Icons.favorite_border,
                                    color: isSaved ? Colors.redAccent : Colors.white,
                                    size: 20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GlassContainer(
                        borderRadius: 20,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: _StatPillItem(icon: Icons.favorite_border, label: "1.3K"),
                      ),
                      GlassContainer(
                        borderRadius: 20,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: _StatPillItem(icon: Icons.remove_red_eye, label: "2K"),
                      ),
                      GlassContainer(
                        borderRadius: 20,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: _StatPillItem(icon: Icons.share, label: "34"),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24), // top:40 clears the overlapping pill
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(property.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text("\$${property.price}", style: TextStyle(fontSize: 18, color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(property.location, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, height: 1.4),
                      children: [
                        const TextSpan(
                          text: "The best home and summer place for an e-commerce mobile app depend on your brand here we give you the... ",
                        ),
                        TextSpan(
                          text: "Learn More",
                          style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatTile(icon: Icons.bed, label: "${property.beds}", sublabel: "Beds"),
                      _StatTile(icon: Icons.bathtub, label: "${property.baths}", sublabel: "Bath"),
                      _StatTile(icon: Icons.local_parking, label: "1", sublabel: "Park"),
                      _StatTile(icon: Icons.square_foot, label: "${property.sqft}", sublabel: "Sqft"),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Text("Our Agent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const CircleAvatar(radius: 22, backgroundColor: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Jhon Smith", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 2),
                            Text("4.5 Rating (24 Reviews)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {}, // wired up later
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("Contact Now"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
                    child: const Center(child: Text("Map coming soon", style: TextStyle(color: Colors.grey))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatPillItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatPillItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 14),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;

  const _StatTile({required this.icon, required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(sublabel, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}