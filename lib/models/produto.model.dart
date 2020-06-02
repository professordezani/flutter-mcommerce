class ProdutoModel
{
  String name;
  String brand;
  int stars;
  double price;
  String imageUrl;

  ProdutoModel(this.name, this.brand, this.stars, this.price, this.imageUrl);

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.brand = json['brand'];
    this.stars = json['stars'];
    this.price = json['price'];
    this.imageUrl = json['image_url'];
  }
}