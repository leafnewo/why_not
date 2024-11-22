import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final races=[
  ['human','bitch'],
  ['crzy','outt'],
  ['brad','hmmm'],
  ['lol','blur'],
];
int hov=0;
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
        child: GridView.builder(
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          padding: EdgeInsets.all(8.0), // padding around the grid
          itemCount: races.length, // total number of items
          itemBuilder: (context, index) {
            return MouseRegion(
            onHover:(event) =>{
              hov=1,
            },
            child: Container(
              color: Colors.blue, // color of grid items
              child: Center(
                child: Text(
                  races[index][0+hov],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            )
            );
          },
        )
      )
                    
      
             
      );
  }
}