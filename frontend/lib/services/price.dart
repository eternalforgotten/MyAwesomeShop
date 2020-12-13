class Price {
  static String normalize(String price){
    var temp = price.split(".");
    return temp[1].length == 1 ? price + "0" : price;
  }
}