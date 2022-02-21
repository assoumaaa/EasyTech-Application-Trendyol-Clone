
class discount {
  String phoneName;
  String description;
  String image;
  int oldPrice;
  int newPrice;

  discount({
    required this.phoneName,
    required this.description,
    required this.image,
    required this.oldPrice,
    required this.newPrice,
  });

  @override
  String toString() => 'Phone Name: $phoneName\nDescription: $description\nImage Link: $image\nOld Price: $oldPrice\nNew Price: $newPrice\n';
}