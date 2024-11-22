import 'package:flutter/material.dart';
import 'package:why_not/charectorScreen.dart';
import 'package:why_not/mapSystem.dart';
import 'createCharacter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kill me',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Death'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Death"), centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const charectorScreen()));
        },),
      ),
      body: const Center(/*
     
        child: Column(
          children:[
            Stack(
              children: <Widget>[
                Positioned(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Color.fromARGB(138, 185, 35, 35),
                  ),

                ),
              ),
            ],
            )
          ],*/
     
        )
      );
  }
}
