// ignore_for_file: public_member_api_docs, sort_constructors_first
final String tableCart = "cart";

class CartFields{
static final List<String> values = [id,count,price,title,image];
static final String id = '_id';
static final String price = '_price';
static final String title = '_title';
static final String image = '_image';
static final String count = '_count'; 
}

class CartModelDatabase {
  int id;
  double price;
  String title;
  String image;
  int count;
  CartModelDatabase({
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.count,
  });

CartModelDatabase copy({
  int? id,
  double? price,
  String? title,
  String? image,
  int? count,
})=>CartModelDatabase(
  id: id??this.id,
  count: count??this.count,
  image: image??this.image,
  title: title??this.title,
  price: price??this.price
  );

static CartModelDatabase fromJson(Map<String, Object?> json)=>CartModelDatabase(
  id: json[CartFields.id]  as int,
  image: json[CartFields.image] as String,
  title: json[CartFields.title] as String,
  price: json[CartFields.price] as double,
  count: json[CartFields.count]  as int
  );
Map<String, Object?> toJson() => {
  CartFields.id : id,
  CartFields.count : count,
  CartFields.image : image,
  CartFields.title : title,
  CartFields.price : price,
};
}
