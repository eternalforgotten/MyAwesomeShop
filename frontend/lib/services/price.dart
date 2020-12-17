class Price {
  static String normalize(String price){
    var temp = double.parse(price);
    return temp.toStringAsFixed(2);
  }
}