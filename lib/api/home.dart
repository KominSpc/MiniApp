import 'package:mini_app/constant/index.dart';
import 'package:mini_app/utils/dio_utils.dart';
import 'package:mini_app/viewmodels/category_head_pic.dart';
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
