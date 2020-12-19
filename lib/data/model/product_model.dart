class Product{
  List<ProductItem> productItem;

  Product({this.productItem});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['product_item'] != null) {
      productItem = new List<ProductItem>();
      json['product_item'].forEach((v) {
        productItem.add(new ProductItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productItem != null) {
      data['product_item'] = this.productItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItem {
  int idProduct;
  String nameProduct;
  String imageProduct;
  String priceProduct;
  bool isFavorite;
  String category;
  String rating;
  String sold;
  bool isDiscount;
  String discounPrice;

  ProductItem(
      {this.idProduct, this.nameProduct,
        this.imageProduct, this.priceProduct,
        this.isFavorite, this.category,
        this.rating, this.sold,
        this.isDiscount, this.discounPrice
      });

  ProductItem.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    nameProduct = json['name_product'];
    imageProduct = json['image_product'];
    priceProduct = json['price_product'];
    isFavorite = json['is_favorite'];
    category = json['category'];
    rating = json['rating'];
    sold = json['sold'];
    isDiscount = json['is_discount'];
    discounPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product'] = this.idProduct;
    data['name_product'] = this.nameProduct;
    data['image_product'] = this.imageProduct;
    data['price_product'] = this.priceProduct;
    data['is_favorite'] = this.isFavorite;
    data['category'] = this.rating;
    data['rating'] = this.category;
    data['sold'] = this.sold;
    data['is_discount'] = this.isDiscount;
    data['discount_price'] = this.discounPrice;
    return data;
  }
}