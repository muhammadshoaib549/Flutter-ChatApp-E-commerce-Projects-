// This is the Class For the Food
class Food {
  /*
  The Class Food is Going to have the Following Functionalities 
  Name
  PRICE
  image path
  Rating 
  */
  final String name;
  final String price;
  final String ImagePath;
  final String Rating;
  final String Discription;

  // Constructor for the Food Class
  Food({
    required this.name,
    required this.price,
    required this.ImagePath,
    required this.Rating,
    required this.Discription,
  });
  // Getters for them
  String get _name => name;
  String get _price => price;
  String get _ImagePath => ImagePath;
  String get _Rating => Rating;

  String get _Discription => Discription;
}
