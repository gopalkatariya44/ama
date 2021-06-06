class SareesDistribute {
  String? imageUrl;
  String name;
  double price;
  double size;
  DateTime? date;
  String? description;

  SareesDistribute({
    this.imageUrl,
    required this.name,
    required this.price,
    required this.size,
    this.date,
    this.description,
  });
}
