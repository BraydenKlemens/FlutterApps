class Attraction {
  final String title;
  final String address;
  final String imageURL;
  final bool isFree;
  final List<String> categories;
  final String description;

  Attraction({
    required this.title,
    required this.address,
    required this.imageURL,
    required this.categories,
    this.isFree = true,
    required this.description,
  });
  
}
