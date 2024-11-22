import 'package:flutter/material.dart';
int count=0;
class ItemDes extends StatelessWidget {
  
  final List theItem;
  const ItemDes( this.theItem, {super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: 1000,
              height: 1000,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 170, 255),
                borderRadius: BorderRadius.circular(10),
                //shape: BoxShape.circle,
              ),
              child: RichText(
              text: TextSpan(
                text: '${theItem[0]}',
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(174, 207, 37, 165))),
              )
            ),
            Positioned(
              bottom: 100,
              child: Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 170, 255),
                  borderRadius: BorderRadius.circular(10),
                  //shape: BoxShape.circle,
                ),
                child: RichText(
                text: TextSpan(
                  text: '$count',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(174, 207, 37, 165))),
                )
              ),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: (){
                  count=count+1;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 116, 235, 5),
                    borderRadius: BorderRadius.circular(10),
                    //shape: BoxShape.circle,
                  ),
                  
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: GestureDetector(
                onTap: (){
                  count = count-1;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                    //shape: BoxShape.circle,
                  ),
                  
                ),
              ),
            ),
          ]
        )
    );
  }
}