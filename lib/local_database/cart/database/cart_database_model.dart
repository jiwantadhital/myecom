// ignore_for_file: public_member_api_docs, sort_constructors_first
final String tableCart = "cart";

class CartFields{
static final List<String> values = [id,count];
static final String id = '_id';
static final String count = '_count'; 
}

class CartModelDatabase {
  int id;
  int count;
  CartModelDatabase({
    required this.id,
    required this.count,
  });

CartModelDatabase copy({
  int? id,
  int? count,
})=>CartModelDatabase(
  id: id??this.id,
  count: count??this.count
  );

static CartModelDatabase fromJson(Map<String, Object?> json)=>CartModelDatabase(
  id: json[CartFields.id]  as int,
  count: json[CartFields.count]  as int);
Map<String, Object?> toJson() => {
  CartFields.id : id,
  CartFields.count : count,
};
}