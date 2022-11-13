class ProductModel {
  late String? name, image, description, price, category;

  ProductModel(
      {this.image, this.name, this.description, this.price, this.category});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    category = map['category'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'category': category
    };
  }
}
