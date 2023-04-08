import 'package:flutter/material.dart';
import './item_card.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    //Runs only after all widgets builded
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd(context));
  }

//Scroll to the start, because list is reversed
  void _scrollToEnd(BuildContext context) {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    List<ItemCard> cards = [];

    stackedList() {
      for (int i = 0; i < 9; i++) {
        cards.add(ItemCard(index: i));
      }
      //Reversed to make up on the reverse boolean in listview
      cards = cards.reversed.toList();
    }

//generate array, should get array from state management / API
    stackedList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      body: ListView.builder(
        controller: controller,
        //Reverse is set to make right card is stacked over the left card
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            widthFactor: 0.94, //Cuts the card (Cutting the number)
            child: cards[index],
          );
        },
        itemCount: cards.length,
      ),
    );
  }
}
