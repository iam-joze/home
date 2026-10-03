import 'package:flutter/material.dart';
import 'package:home/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../state/saved_properties.dart';
import '../widgets/listing_card.dart';
import 'details_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedProperties = context.watch<SavedProperties>();
    final saved = savedProperties.saved;

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(title: const Text("Saved")),
      body: saved.isEmpty
          ? const Center(
        child: Text("No saved properties yet", style: TextStyle(color: Colors.grey)),
      )
          : ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: saved.length,
        itemBuilder: (context, index) => ListingCard(
          property: saved[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(property: saved[index])),
            );
          },
        ),
      ),
    );
  }
}