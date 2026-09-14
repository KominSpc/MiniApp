class SliderPic {
  String imgUrl;
  String id;
  SliderPic({required this.imgUrl, required this.id});
  factory SliderPic.fromJSON(Map<String, dynamic> data) {
    return SliderPic(imgUrl: data["imgUrl"], id: data["id"]);
  }
}
