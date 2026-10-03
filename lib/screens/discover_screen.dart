import 'package:flutter/material.dart';
import 'package:home/theme/app_colors.dart';
import '../models/property.dart';
import '../widgets/listing_card.dart';
import '../screens/details_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String selectedType = "All";

  final List<String> types = ["All", "Apartment", "Airbnb", "Rent", "Permanent"];

  final List<Property> properties = const [
    Property(id: "1", title: "2 Bedroom Apartment", location: "Kampala", price: 800000, type: "Apartment", beds: 2, baths: 1, sqft: 850, imageUrl: 'assets/images/hero_image.jpg'),
    Property(id: "2", title: "Studio Airbnb", location: "Ntinda", price: 450000, type: "Airbnb", beds: 1, baths: 1, sqft: 400, imageUrl: 'assets/images/hero_image.jpg'),
    Property(id: "3", title: "3 Bedroom House", location: "Muyenga", price: 1500000, type: "Permanent", beds: 3, baths: 2, sqft: 1200, imageUrl: 'assets/images/hero_image.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = selectedType == "All"
        ? properties
        : properties.where((p) => p.type == selectedType).toList();

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(title: const Text("Discover")),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: types.length,
              itemBuilder: (context, index) {
                final type = types[index];
                final isSelected = type == selectedType;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) => setState(() => selectedType = type),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) => ListingCard(
                property: filtered[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen(property: filtered[index])),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}