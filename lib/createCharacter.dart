import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final races=[
  'human',
  'crzy',
  'brad',
  'lol',
];
class createCharacterState extends StatefulWidget {
  const createCharacterState({super.key});

  @override
  State<createCharacterState> createState() => createCharacterStateState();
}

class createCharacterStateState extends State<createCharacterState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text("death"),centerTitle: true,),
      body: Container(
        color: const Color.fromARGB(0, 0, 0, 0),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Positioned.fill(
              child:ListView.builder(
                itemCount: races.length-1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                      )
                    ],
                  )
                  );
                  
                },
              )
            )
          ],
          ),
      ),
    );
  }
}