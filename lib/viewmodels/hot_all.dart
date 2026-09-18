class HotResultData {
  String id;
  String title;
  List<SubType> subTypes;

  HotResultData({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory HotResultData.fromJSON(Map<String, dynamic> data) {
    return HotResultData(
      id: data["id"] as String,
      title: data["title"] as String,
      subTypes: (data["subTypes"] as List<dynamic>)
          .map((e) => SubType.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

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
  int counts;
  int pageSize;
  int pages;
  int page;
  List<HotGoodsItem> items;

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
      items: (data["items"] as List<dynamic>)
          .map((e) => HotGoodsItem.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class HotGoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  HotGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory HotGoodsItem.fromJSON(Map<String, dynamic> data) {
    return HotGoodsItem(
      id: data["id"] as String,
      name: data["name"] as String,
      desc: data["desc"] as String?,
      price: data["price"] as String,
      picture: data["picture"] as String,
      orderNum: data["orderNum"] as int,
    );
  }
}
