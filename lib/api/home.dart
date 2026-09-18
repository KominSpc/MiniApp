import 'package:mini_app/constant/index.dart';
import 'package:mini_app/utils/dio_utils.dart';
import 'package:mini_app/viewmodels/category_head_pic.dart';
import 'package:mini_app/viewmodels/home_products.dart';
import 'package:mini_app/viewmodels/hot_all.dart';
import 'package:mini_app/viewmodels/hot_preference.dart';
import 'package:mini_app/viewmodels/slider_pic.dart';

DioUtils dio = DioUtils();

Future<List<SliderPic>> getSliderPic() async {
  return (await dio.get(HttpConstants.BANNER_LIST) as List).map((index) {
    return SliderPic.fromJSON(index as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryItems() async {
  return (await dio.get(HttpConstants.CATEGORY_LIST) as List).map((index) {
    return CategoryItem.fromJSON(index as Map<String, dynamic>);
  }).toList();
}

Future<RecommendResult> getRecommendResult() async {
  return RecommendResult.fromJSON(
    await dio.get(HttpConstants.PREFERENCE) as Map<String, dynamic>,
  );
}

Future<HotResultData> getInVogueResult() async {
  final data = await dio.get(HttpConstants.IN_VOGUE) as Map<String, dynamic>;
  return HotResultData.fromJSON(data);
}

Future<HotResultData> getOneStopResult() async {
  final data = await dio.get(HttpConstants.ONE_STOP) as Map<String, dynamic>;
  return HotResultData.fromJSON(data);
}

Future<List<Product>> getProducts(Map<String, String> params) async {
  return (await dio.get(HttpConstants.PRODUCTS, params: params) as List).map((
    index,
  ) {
    return Product.fromJSON(index as Map<String, dynamic>);
  }).toList();
}
