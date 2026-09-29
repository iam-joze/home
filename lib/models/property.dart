class Property {
  final String id;
  final String title;
  final String location;
  final int price;
  final String type; // e.g. "Apartment", "Airbnb", "Rent", "Permanent"
  final int beds;
  final int baths;
  final int sqft;

  const Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.type,
    required this.beds,
    required this.baths,
    required this.sqft,
  });
}