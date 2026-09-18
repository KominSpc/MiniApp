import 'package:flutter/material.dart';
import 'package:mini_app/viewmodels/User/guess_like.dart';

class GuessYourLikeList extends StatefulWidget {
  List<GoodsItem> products;
  GuessYourLikeList({required this.products, super.key});

  @override
  State<GuessYourLikeList> createState() => _GuessYourLikeListState();
}

class _GuessYourLikeListState extends State<GuessYourLikeList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 70,
        childAspectRatio: 1.2,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 237, 241, 239),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    widget.products[index].picture,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.products[index].name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
