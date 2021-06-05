class SareesDistribute {
  String imageUrl;
  String name;
  double price;
  double size;
  DateTime date;
  String? description;

  SareesDistribute({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.size,
    required this.date,
    this.description,
  });
}