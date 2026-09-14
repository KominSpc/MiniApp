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
  int _onTapIndexNow = 0;
  CarouselSliderController _sliderController = CarouselSliderController();

  List<Widget> _createCarouselSliderItems() {
    List<Widget> lists = List.generate(widget.sliderPics.length, (index) {
      return Image.network(
        widget.sliderPics[index].imgUrl,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
      );
    });
    return lists;
  }

  CarouselSlider _createCarouselSlider() {
    return CarouselSlider(
      carouselController: _sliderController,
      items: _createCarouselSliderItems(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        onPageChanged: (index, reason) {
          _onTapIndexNow = index;
          setState(() {});
        },
      ),
    );
  }

  List<Widget> _createSliderDirector() {
    return List.generate(widget.sliderPics.length, (index) {
      return GestureDetector(
        onTap: () {
          _onTapIndexNow = index;
          _sliderController.animateToPage(_onTapIndexNow);
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 6,
          width: _onTapIndexNow == index ? 80 : 50,
          decoration: BoxDecoration(
            color: _onTapIndexNow == index ? Colors.redAccent : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _createCarouselSlider(),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _createSliderDirector(),
          ),
        ),
      ],
    );
  }
}
