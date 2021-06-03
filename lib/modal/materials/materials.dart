class Materials {
  String title;
  double price;
  String imageUrl;
  double size;
  String? description;
  DateTime date;

  Materials({
    this.description,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.title,
    required this.date,
  });
}
