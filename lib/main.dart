import 'package:flutter/material.dart';
import 'package:why_not/mapSystem.dart';


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
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => mapSystem()));
        },),
        

        
      ),
      body: Center(
     
        child: Column(
     
        )
      )
    );
  }
}
