import 'dart:convert';

class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  int? discount;
  int? stock;
  int? quantity;
  int? unitId;
  String? shortDescription;
  String? description;
  int? recommendedProduct;
  int? flashProduct;
  int? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  int? subcategoryId;
  List<Images>? images;
  List<Attributes>? attributes;
  Category? category;
  Subcategory? subcategory;
  Unit? unit;

  ProductModel(
      {this.id,
      this.title,
      this.slug,
      this.price,
      this.discount,
      this.stock,
      this.quantity,
      this.unitId,
      this.shortDescription,
      this.description,
      this.recommendedProduct,
      this.flashProduct,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.categoryId,
      this.subcategoryId,
      this.images,
      this.attributes,
      this.category,
      this.subcategory,
      this.unit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    discount = json['discount'];
    stock = json['stock'];
    quantity = json['quantity'];
    unitId = json['unit_id'];
    shortDescription = json['short_description'];
    description = json['description'];
    recommendedProduct = json['recommended_product'];
    flashProduct = json['flash_product'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['quantity'] = this.quantity;
    data['unit_id'] = this.unitId;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['recommended_product'] = this.recommendedProduct;
    data['flash_product'] = this.flashProduct;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? imageName;
  String? imageTitle;
  int? status;
  String? createdAt;

  Images(
      {this.id,
      this.productId,
      this.imageName,
      this.imageTitle,
      this.status,
      this.createdAt,});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    imageName = json['image_name'];
    imageTitle = json['image_title'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image_name'] = this.imageName;
    data['image_title'] = this.imageTitle;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Attributes {
  int? id;
  int? productId;
  int? attributeId;
  String? attributeValue;
  int? status;

  Attributes(
      {this.id,
      this.productId,
      this.attributeId,
      this.attributeValue,
      this.status});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    attributeId = json['attribute_id'];
    attributeValue = json['attribute_value'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['attribute_id'] = this.attributeId;
    data['attribute_value'] = this.attributeValue;
    data['status'] = this.status;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  int? rank;
  String? description;
  String? image;
  int? status;
  int? createdBy;
  String? createdAt;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.rank,
      this.description,
      this.image,
      this.status,
      this.createdBy,
      this.createdAt,
    });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    rank = json['rank'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['rank'] = this.rank;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Subcategory {
  int? id;
  int? categoryId;
  String? name;
  String? slug;
  int? rank;
  String? description;
  String? image;
  int? status;
  int? createdBy;
  String? createdAt;

  Subcategory(
      {this.id,
      this.categoryId,
      this.name,
      this.slug,
      this.rank,
      this.description,
      this.image,
      this.status,
      this.createdBy,
      this.createdAt,
});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    slug = json['slug'];
    rank = json['rank'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['rank'] = this.rank;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Unit {
  int? id;
  String? name;
  int? status;
  int? createdBy;
  String? createdAt;

  Unit(
      {this.id,
      this.name,
      this.status,
      this.createdBy,
      this.createdAt,
  });

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}
