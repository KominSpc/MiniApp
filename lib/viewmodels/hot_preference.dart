class RecommendResult {
  final String id;
  final String title;
  final List<SubType> subTypes;

  RecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory RecommendResult.fromJSON(Map<String, dynamic> data) {
    return RecommendResult(
      id: data["id"] as String,
      title: data["title"] as String,
      subTypes: (data["subTypes"] as List<dynamic>? ?? [])
          .map((e) => SubType.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  final String id;
  final String title;
  final GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJSON(Map<String, dynamic> data) {
    return SubType(
      id: data["id"] as String,
      title: data["title"] as String,
      goodsItems: GoodsItems.fromJSON(
        data["goodsItems"] as Map<String, dynamic>,
      ),
    );
  }
}

class GoodsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJSON(Map<String, dynamic> data) {
    return GoodsItems(
      counts: data["counts"] as int,
      pageSize: data["pageSize"] as int,
      pages: data["pages"] as int,
      page: data["page"] as int,
      items: (data["items"] as List<dynamic>? ?? [])
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
  final String imgUrl; // 对应 JSON 中的 picture
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.imgUrl,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> data) {
    return GoodsItem(
      id: data["id"] as String,
      name: data["name"] as String,
      desc: data["desc"] as String?,
      price: data["price"] as String,
      imgUrl: data["picture"] as String,
      orderNum: data["orderNum"] as int,
    );
  }
}
