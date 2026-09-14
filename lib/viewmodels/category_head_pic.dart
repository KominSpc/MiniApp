class CategoryItem {
  String imgUrl;
  String id;
  String name;
  List<CategoryItem>? children;
  dynamic goods;

  CategoryItem({
    required this.imgUrl,
    required this.id,
    required this.name,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> data) {
    return CategoryItem(
      imgUrl: data["picture"] as String,
      id: data["id"] as String,
      name: data["name"] as String,
      children: (data["children"] as List<dynamic>?)
          ?.map((e) => CategoryItem.fromJSON(e as Map<String, dynamic>))
          .toList(),
      goods: data["goods"],
    );
  }
}
