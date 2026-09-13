import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/viewmodels/slider_pic.dart';

class SearchPageSlider extends StatefulWidget {
  List<SliderPic> sliderPics = [];
  SearchPageSlider({required this.sliderPics, super.key});

  @override
  State<SearchPageSlider> createState() => _SearchPageSliderState();
}

class _SearchPageSliderState extends State<SearchPageSlider> {
  List<Widget> _createCarouselSliderItems() {
    List<Widget> lists = List.generate(widget.sliderPics.length, (index) {
      return Image.network(
        widget.sliderPics[index].imgUrl,
        fit: BoxFit.cover,
        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
      );
    });
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _createCarouselSliderItems(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
      ),
    );
  }
}
