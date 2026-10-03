import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/property.dart';
import '../state/saved_properties.dart';
import 'glass_container.dart';

class ListingCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onTap;

  const ListingCard({super.key, required this.property, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 240,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(property.imageUrl, fit: BoxFit.cover),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
                  stops: const [0.4, 1.0],
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 12,
              child: Consumer<SavedProperties>(
                builder: (context, savedProperties, child) {
                  final isSaved = savedProperties.isSaved(property);
                  return GestureDetector(
                    onTap: () => savedProperties.toggle(property),
                    child: GlassContainer(
                      borderRadius: 20,
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        isSaved ? Icons.favorite : Icons.favorite_border,
                        color: isSaved ? Colors.redAccent : Colors.white,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              left: 16,
              right: 16,
              bottom: 56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "UGX ${property.price} · ${property.location}",
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 16,
              right: 16,
              bottom: 12,
              child: Row(
                children: [
                  _StatTab(icon: Icons.bed, label: "${property.beds}"),
                  const SizedBox(width: 8),
                  _StatTab(icon: Icons.bathtub, label: "${property.baths}"),
                  const SizedBox(width: 8),
                  _StatTab(icon: Icons.square_foot, label: "${property.sqft}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}