class Sarees {
  String title;
  double price;
  String imageUrl;
  double size;
  String? description;

  Sarees({
    this.description,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.title,
  });
}
