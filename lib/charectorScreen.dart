

// ignore_for_file: unrelated_type_equality_checks,, unused_local_variable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:why_not/addInventory.dart';
import 'package:why_not/diceRoller.dart';


//basic information
double rowhigh1=100;
double rowwith1=450;
double rowtext1=50;
//attack stat
double rowhigh2=100;
double rowwith2=300;
// Actual stat
int strength = 1;
int agility = 1;
int arcana = 1;
int endurance = 1;
int mind = 1;
int speech = 1;
int defence = 1;
final conStrength =TextEditingController();
final conAgility =TextEditingController();
final conArcana =TextEditingController();
final conEndurance =TextEditingController();
final conMind =TextEditingController();
final conSpeech =TextEditingController();
double statnumhigh=100;
double statnumwith=400;
double stattextnum=40;
double statnumnum=40;
//what is deaming you overtime
double hurtinghigh=710;
double hurtingwith=450;

final damagetypes=[
  'Broken bone',
  'Burn',
  'Poison',
  'Hemorrhage',
  'Drunk',
  'High',
  'Paralyzed',
];
var damageType=[];
List<TextEditingController> damagePerRound = [TextEditingController()];
List<TextEditingController> numOfRound = [TextEditingController()];
//inventory stuff
double inventoryspacehigh=410;
double inventoryspacewith=800;
//dice control
double dicehigh=710;
double dicewith=150;
//races
String races_picked = 'Álfar';
final races =[
  'Human',
  'Álfar',
  'Myrkálfar',
  'Hollowed',
  'Gobo',
  'Shroomkin',
  'Gerbler',
  'Krunk',
  'Dwarf',
  'Lunæ',
];


class charectorScreen extends StatefulWidget {
  charectorScreen({super.key,});
  


  @override
  State<charectorScreen> createState() => _charectorScreenState();
  
}

class _charectorScreenState extends State<charectorScreen> {
  @override
  void initState(){
    loadData();
    super.initState();
  }
 

  void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    

    setState(() {
      strength = prefs.getInt('StrengthStat')??1;
      agility = prefs.getInt('AgilityStat')??1;
      arcana = prefs.getInt('ArcanaStat')??1;
      endurance = prefs.getInt('EnduranceStat')??1;
      mind =  prefs.getInt('MindStat')??1;
      speech = prefs.getInt('SpeechStat')??1;
      defence = prefs.getInt('DefenceStat')??1;
    });
  }
  
  void updateStats () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('StrengthStat', int.parse(conStrength.text));
      prefs.setInt('AgilityStat', int.parse(conAgility.text));
      prefs.setInt('ArcanaStat', int.parse(conArcana.text));
      prefs.setInt('EnduranceStat', int.parse(conEndurance.text));
      prefs.setInt('MindStat', int.parse(conMind.text));
      prefs.setInt('SpeechStat', int.parse(conSpeech.text));
    });
  }


  @override
  Widget build(BuildContext context) {
    final conStrength =TextEditingController(text: '$strength');
    final conAgility =TextEditingController(text: '$agility');
    final conArcana =TextEditingController(text: '$arcana');
    final conEndurance =TextEditingController(text: '$endurance');
    final conMind =TextEditingController(text: '$mind');
    final conSpeech =TextEditingController(text: '$speech');
    return Scaffold( 
      appBar: AppBar(title: const Text("Death"), centerTitle: true,),
      body: Container(
        
        color: const Color.fromARGB(237, 53, 40, 65),
        child:
         Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: rowwith1,
                  height: rowhigh1,
                  padding: const EdgeInsets.all(00),
                  margin: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ),        
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                    decoration: const InputDecoration(
                      hintText: 'character name',
                    ),
                  ),
                ),
                Container(
                  width: rowwith1,
                  height: rowhigh1,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                  child: Center(
                    child: DropdownButton(
                      itemHeight: 100,
                      isExpanded: true,
                      items: races.map((item){
                        return DropdownMenuItem(
                          alignment: Alignment.center,
                          value: item,                      
                          child: Text(item)                        
                        );
                      },).toList(),
                      onChanged: (newValue){
                        setState(() {
                            races_picked = newValue!;
                        });
                      },
                      value: races_picked,
                      borderRadius: BorderRadius.circular(40),
                      style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                      underline: Container(),
                    ),
                    
                  )
                ),
                Container(
                  width: rowwith1,
                  height: rowhigh1,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                    decoration: const InputDecoration(
                      hintText: 'Infamy',
                    ),
                  ),
                ),
                Container(
                  width: rowwith1,
                  height: rowhigh1,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                    decoration: const InputDecoration(
                      hintText: 'real name',
                    ),
                  ),
                ),
             ]            
            ),
            Row(
              children: [
                Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                  child: RichText(
                    text: TextSpan(
                      text: 'Hp: ${endurance*8}',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
                Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                  child: RichText(
                    text: TextSpan(
                      text: 'Dg: $agility',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
                Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                   child: RichText(
                    text: TextSpan(
                      text: 'Sp: ${15+((agility/5).floor())*5}',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
                Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                   child: RichText(
                    text: TextSpan(
                      text: 'Ad: $endurance',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
                Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                   child: RichText(
                    text: TextSpan(
                      text: 'Hg: ${endurance*6} hours',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
                 Container(
                  width: rowwith2,
                  height: rowhigh2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 6),
                    //shape: BoxShape.circle,
                  ), 
                   child: RichText(
                    text: TextSpan(
                      text: 'Df: $defence',
                      style: TextStyle(
                        fontSize: stattextnum,
                        fontWeight: FontWeight.bold, 
                        color: const Color.fromARGB(174, 207, 37, 165))),
                  ),
                ),
              ],

            ),
            Row(    
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,         
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: statnumwith,
                      height: 650,
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      color: Color.fromARGB(255, 90, 61, 61),                           
                    ), 
                    Positioned(
                      top: 0,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Strength', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:0,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                        
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conStrength, 
                          onSubmitted: (val){
                            setState(() {
                              strength= int.parse(conStrength.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),
                    Positioned(
                      top: 110,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Agility', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:110,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                              
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conAgility, 
                          onSubmitted: (val){
                            setState(() {
                              agility = int.parse(conAgility.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),
                    Positioned(
                      top: 220,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Arcana', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:220,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                              
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conArcana, 
                          onSubmitted: (val){
                            setState(() {
                              arcana = int.parse(conArcana.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),
                    Positioned(
                      top: 330,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Endurance', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:330,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                              
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conEndurance, 
                          onSubmitted: (val){
                            setState(() {
                              endurance = int.parse(conEndurance.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),
                    Positioned(
                      top: 440,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Mind', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:440,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                              
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conMind, 
                          onSubmitted: (val){
                            setState(() {
                              mind = int.parse(conMind.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),
                    Positioned(
                      top: 550,
                      child: Container(
                        width: statnumwith,
                        height: statnumhigh,
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Color.fromARGB(255, 28, 155, 81),
                        child: RichText(                            
                          text: TextSpan(
                            text: 'Speech', style: TextStyle(
                              fontSize: stattextnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165))),
                        )
                      ),
                    ),
                    Positioned(
                      top:550,
                      right: 10,                          
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 90,
                        height: 90,
                        color: Color.fromARGB(255, 9, 6, 61),                                                        
                        child: TextField(                              
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: statnumnum,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                          controller: conSpeech, 
                          onSubmitted: (val){
                            setState(() {
                              speech = int.parse(conSpeech.text);  
                              updateStats();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                          ),                                                        
                        ),
                      )
                    ),                  
                  ]            
                ),                   
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: hurtingwith,
                          height: hurtinghigh,
                          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          color: Color.fromARGB(255, 90, 61, 61),                           
                        ),                         
                        Positioned.fill(
                          child: 
                            ListView.builder(                         
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              itemCount: damagePerRound.length-1,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return Padding(  
                                  padding: const EdgeInsets.only(top:15),
                                  child: Row(
                                    children: [
                                      Container(                                  
                                        width: 100,
                                        height: 100,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey, width: 6),
                                          //shape: BoxShape.circle,
                                        ), 
                                        child: Center(
                                          child: DropdownButton(
                                            value: damageType[index],
                                            itemHeight: 100,
                                            isExpanded: true,
                                             onChanged: (newValue){
                                              setState(() {
                                                  damageType[index] = newValue;
                                              });
                                            },
                                            items: damagetypes.map((item){
                                              return DropdownMenuItem<String>(
                                                alignment: Alignment.center,
                                                value: item,                      
                                                child: Text(item)                        
                                              );
                                            },).toList(),
                                            borderRadius: BorderRadius.circular(40),
                                            style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                                            underline: Container(),
                                          ),                           
                                        )
                                      ),
                                      Container(
                                        width: 50,
                                        height: 100,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey, width: 6),
                                          //shape: BoxShape.circle,
                                        ), 
                                        child: TextField(
                                          controller: damagePerRound[index],
                                          style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                                          decoration: const InputDecoration(
                                            hintText: '',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 100,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey, width: 6),
                                          //shape: BoxShape.circle,
                                        ), 
                                        child: TextField(
                                          controller: numOfRound[index],
                                          style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                                          decoration: const InputDecoration(
                                            hintText: '',
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            damagePerRound[index].clear();
                                            damagePerRound[index].dispose();
                                            damagePerRound.removeAt(index);
                                            numOfRound[index].clear();
                                            numOfRound[index].dispose();
                                            numOfRound.removeAt(index);
                                            damageType.removeAt(index);                    
                                          });
                                        },
                                        child: Container(
                                        width: 100,
                                        height: 100,
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: const Color.fromARGB(255, 255, 0, 0), width: 6),
                                          //shape: BoxShape.circle,
                                        ), 
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                        ),
                        Positioned(
                          child:GestureDetector(
                            onTap: (){
                              setState(() {
                                damagePerRound.add(TextEditingController());
                                numOfRound.add(TextEditingController());
                                damageType.add('Burn');                   
                              });                        
                            },
                            
                              child: Container(
                                width: 100,
                                height: 100,
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                alignment: Alignment.centerLeft,
                                color: Color.fromARGB(255, 28, 155, 81),
                                
                              ),
                            
                          ),  
                        ),
                        Positioned(
                          right: 100,
                          child:GestureDetector(
                            onTap: (){
                              setState(() {
                                damageType=[];
                                damagePerRound = [TextEditingController()];
                                numOfRound = [TextEditingController()];  
                              });                        
                            },
                            
                              child: Container(
                                width: 100,
                                height: 100,
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                alignment: Alignment.centerLeft,
                                color: Color.fromARGB(255, 255, 0, 0),
                                
                              ),
                            
                          ),  
                        ) ,                      
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: inventoryspacewith,
                          height: inventoryspacehigh,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 6),
                            //shape: BoxShape.circle,
                          ), 
                        ),  
                        Positioned(
                          child:GestureDetector(
                            onTap: (){
                              setState(() {
                                showDialog(context: context, builder: (_) => addInventory());
                              });                        
                            },
                            
                              child: Container(
                                width: 100,
                                height: 100,
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                alignment: Alignment.centerLeft,
                                color: Color.fromARGB(255, 28, 155, 81),
                                
                              ),
                          ),  
                        )  
                      ]
                    ),
                    Container(
                      width: inventoryspacewith,
                      height: 250,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 6),
                        //shape: BoxShape.circle,
                      ),
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        style: TextStyle(fontSize: rowtext1,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                        
                      ), 
                    ),                             
                  ],
                ),
                Column(
                  
                  children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            width: dicewith,
                            height: dicehigh,
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            color: Color.fromARGB(255, 90, 61, 61),                           
                          ), 
                          
                          Positioned(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(100)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 155, 28, 28),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(20)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 251, 255, 0),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 200,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(12)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 0, 255, 55),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 300,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(10)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 0, 247, 255),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 400,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(8)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 17, 0, 255),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 500,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(6)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 255, 0, 234),
                                  
                                ),
                              
                            ),
                          ),
                          Positioned(
                            top: 600,
                            child: GestureDetector(
                              onTap: (){

                                setState(() {
                                  var rng = Random();
                                  for (var i = 0; i < 1; i++) {
                                    int rolledNubmer =rng.nextInt(4)+1;
                                    showDialog(context: context, builder: (_) => diceRoller(rolledNubmer));
                                  }
                                });                        
                              },                       
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromARGB(255, 255, 0, 149),
                                  
                                ),
                            ),
                          ),
                        ]
                      )                    
                    ],
                  )
                ]
              ),
              ],
            )
        )
    );
  }
}


