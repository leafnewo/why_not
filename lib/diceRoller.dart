import 'package:flutter/material.dart';

class diceRoller extends StatelessWidget {
  final int rolledNumber;
  const diceRoller( this.rolledNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return  
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 500,
          height: 500,
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
              text: '$rolledNumber',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(174, 207, 37, 165))),
          )
        )
    );
  }
}