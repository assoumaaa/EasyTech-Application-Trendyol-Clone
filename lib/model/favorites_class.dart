
class favorites {
  String itemName;
  String manufacturers;
  String image;
  String Price;

  favorites({
    required this.itemName,
    required this.manufacturers,
    required this.image,
    required this.Price,
  });

  @override
  String toString() => 'Phone Name: $itemName\nDescription: $manufacturers\nImage Link: $image\n Price: $Price\n';
}