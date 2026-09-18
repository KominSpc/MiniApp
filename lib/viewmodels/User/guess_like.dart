class UserGuessLikeResult {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  UserGuessLikeResult({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory UserGuessLikeResult.fromJSON(Map<String, dynamic> data) {
    return UserGuessLikeResult(
      counts: data["counts"] as int,
      pageSize: data["pageSize"] as int,
      pages: data["pages"] as int,
      page: data["page"] as int,
      items: (data["items"] as List<dynamic>)
          .map((e) => GoodsItem.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GoodsItem {
  final String id;
  final String name;
  final String? desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> data) {
    return GoodsItem(
      id: data["id"] as String,
      name: data["name"] as String,
      desc: data["desc"] as String?,
      price: data["price"] as String,
      picture: data["picture"] as String,
      orderNum: data["orderNum"] as int,
    );
  }
}
