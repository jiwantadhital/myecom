// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        this.id,
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
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.subcategoryId,
        this.images,
        this.attributes,
        this.category,
        this.subcategory,
        this.unit,
    });

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
    dynamic updatedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? categoryId;
    int? subcategoryId;
    List<Image>? images;
    List<Attribute>? attributes;
    Category? category;
    Category? subcategory;
    Unit? unit;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        discount: json["discount"],
        stock: json["stock"],
        quantity: json["quantity"],
        unitId: json["unit_id"],
        shortDescription: json["short_description"],
        description: json["description"],
        recommendedProduct: json["recommended_product"],
        flashProduct: json["flash_product"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        category: Category.fromJson(json["category"]),
        subcategory: Category.fromJson(json["subcategory"]),
        unit: Unit.fromJson(json["unit"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "discount": discount,
        "stock": stock,
        "quantity": quantity,
        "unit_id": unitId,
        "short_description": shortDescription,
        "description": description,
        "recommended_product": recommendedProduct,
        "flash_product": flashProduct,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "category": category!.toJson(),
        "subcategory": subcategory!.toJson(),
        "unit": unit!.toJson(),
    };
}

class Attribute {
    Attribute({
        this.id,
        this.productId,
        this.attributeId,
        this.attributeValue,
        this.status,
    });

    int? id;
    int? productId;
    int? attributeId;
    String? attributeValue;
    int? status;

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        productId: json["product_id"],
        attributeId: json["attribute_id"],
        attributeValue: json["attribute_value"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "attribute_id": attributeId,
        "attribute_value": attributeValue,
        "status": status,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.slug,
        this.rank,
        this.description,
        this.image,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
    });

    int? id;
    String? name;
    String? slug;
    int? rank;
    String? description;
    String? image;
    int? status;
    int? createdBy;
    int? updatedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? categoryId;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        rank: json["rank"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"] == null ? null : json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "rank": rank,
        "description": description,
        "image": image,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "category_id": categoryId == null ? null : categoryId,
    };
}

class Image {
    Image({
        this.id,
        this.productId,
        this.imageName,
        this.imageTitle,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? productId;
    String? imageName;
    String? imageTitle;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        imageName: json["image_name"],
        imageTitle: json["image_title"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image_name": imageName,
        "image_title": imageTitle,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

class Unit {
    Unit({
        this.id,
        this.name,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    int? status;
    int? createdBy;
    dynamic updatedBy;
    dynamic deletedAt;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
