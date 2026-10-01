import 'package:flutter/material.dart';
import '../models/property.dart';
import 'package:provider/provider.dart';
import '../state/saved_properties.dart';

class ListingCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onTap;

  const ListingCard({super.key, required this.property, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 150, width: double.infinity, color: Colors.blue[200]),
            Positioned(
                top: 10,
                right: 10,
                child: Consumer<SavedProperties>(
                  builder: (context, savedProperties, child) {
                    final isSaved = savedProperties.isSaved(property);
                    return GestureDetector(
                      onTap: () => savedProperties.toggle(property),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        radius: 16,
                        child: Icon(
                          isSaved ? Icons.favorite : Icons.favorite_border,
                          color: isSaved ? Colors.redAccent : Colors.black54,
                          size: 16,
                        ),
                      ),
                    );
                  }
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("UGX ${property.price} · ${property.location}", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}