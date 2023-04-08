import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int index;

  const ItemCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String cardNumStr = (index + 1).toString();
    const double fontSize = 280;
    const double fontHeight =
        1.66; //RichText vertical padding, need to be calibrated every change in font or height size
    const Color borderColor = Color.fromARGB(255, 191, 191, 191);

    return SizedBox(
      width: 325,
      height: 380,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              //Card Shadow
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 8, 8, 8),
                    blurRadius: 20.0,
                    offset: Offset(30, 0),
                  ),
                ],
              ),
              width: 250,
              height: 380,
              //Image Card
              child: Card(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://picsum.photos/id/$index/250/400',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          //Number Text
          Align(
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                //Grey Border With Shadow
                Text(
                  cardNumStr,
                  style: TextStyle(
                      shadows: const [
                        Shadow(blurRadius: 12, color: borderColor),
                      ],
                      height: fontHeight,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      //www.kindacode.com/snippet/adding-a-border-to-text-in-flutter/
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6.5
                        ..color = borderColor),
                ),
                //Black Text Over White Text
                Text(
                  cardNumStr,
                  style: const TextStyle(
                    height: fontHeight,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Color.fromARGB(255, 18, 18, 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
