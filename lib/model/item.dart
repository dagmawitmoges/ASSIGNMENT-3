// class item {
//   int id;
//   String category;
//   String name;
//   bool inStock;

//   item({required this.id, required this.category, required this.name, required this.inStock});

//   factory item.fromJson(Map<String, dynamic> json) {
//     return item(
//     id :json['id'],
//     category : json['category'],
//     name : json['name'],
//     inStock: json['inStock'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category'] = this.category;
//     data['name'] = this.name;
//     data['inStock'] = this.inStock;
//     return data;
//   }
// }
class item {
  num id;
  String title;
  num price;
  String description;
  String category;
  String image;
  // String rating;
  // num count;

  item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating,
    // required this.count
  });

  factory item.fromJson(Map<String, dynamic> parsedjson) {
    return item(
      id: parsedjson['id'],
      title: parsedjson['title'],
      price: parsedjson['price'],
      description: parsedjson['description'],
      category: parsedjson['category'],
      image: parsedjson['image'],
      // rating: parsedjson['rating'],
      // count: parsedjson['count'],
    );
  }
  factory item.historyfromJson(Map<String, dynamic> parsedJson) {
    return item(
      id: parsedJson['id'],
      title: parsedJson['title'],
      price: parsedJson['price'],
      description: parsedJson['description'],
      category: parsedJson['category'],
      image: parsedJson['image'],
      // quantity: parsedJson["quantity"],
      // itemAdded: parsedJson["itemAdded"],
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['description'] = description;
    json['category'] = category;
    json['category'] = image;
    // json['quantity'] = quantity;
    // json['itemAdded'] = itemAdded;
    return json;
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.fromJson(asbeza[i]));
    }
    return asbezas;
  }

  static List historyList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.historyfromJson(asbeza[i]));
    }
    return asbezas;
  }
}
