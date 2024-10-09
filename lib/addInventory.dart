import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:why_not/itemDes.dart';

String itemsPicked = 'Tents';
var items =[
  [//weapons
    ['Sword',0,0,0,0,0,0,
    0,
    ],
    ['Long Sword',0,0,0,0,0,0,
    
    ],
    ['Spear',0,0,0,0,0,0,
    
    ],
    ['Staff',0,0,0,0,0,0,
    
    ],
    ['Gun',0,0,0,0,0,0,
    
    ],
  ],
  [
    ['Steel plate',0,0,0,0,0,0,
    
    ],
    ['Maile',0,0,0,0,0,0,
    
    ],
    ['Hardened leather',0,0,0,0,0,0,
    
    ],
    ['Gambeson',0,0,0,0,0,0,
    
    ],
    ['Bronze plate',0,0,0,0,0,0,
    
    ],
  ],
  [//tools
    ['Tents',0,0,0,0,0,0,
    
    ],
    ['Tinder set',0,0,0,0,0,0,
    
    ],
    ['Medic set',0,0,0,0,0,0,
    
    ],
    ['Cooking set',0,0,0,0,0,0,
    
    ],
    ['Rope',0,0,0,0,0,0,
    
    ],
    ['Sleeping bags',0,0,0,0,0,0,
    
    ]
    
    ,
  ],
  [//Consumables
    ['Bandage',0,0,0,0,0,0,
    
    ],
    ['Fire kit',0,0,0,0,0,0,
    
    ],
    ['Bag of salt',0,0,0,0,0,0,
    
    ],
    ['Beeswax',0,0,0,0,0,0,
    
    ],
    ['Sewing/suture kit',0,0,0,0,0,0,
    
    ],
  ],
  [//Materials
    ['Leather strip',0,0,0,0,0,0,
    
    ],
    ['Iron ingot',0,0,0,0,0,0,
    
    ],
    ['Copper ingot',0,0,0,0,0,0,
    
    ],
    ['Twine',0,0,0,0,0,0,
    
    ],
    ['Pot of ink',0,0,0,0,0,0,
    
    ],
  ],
  [//Miscellaneous
    ['Quill/pen',0,0,0,0,0,0,
    
    ],
    ['Paper/parchment',0,0,0,0,0,0,
    
    ],
    ['Water skin',0,0,0,0,0,0,
    
    ],
    ['Cookware ',0,0,0,0,0,0,
    
    ],
    ['Bundle of rope',0,0,0,0,0,0,
    
    ],
  ],
  ];

var itemOrganization=[
  'Weapons',
  'Armor',
  'Tools',
  'Consumables',
  'Materials',
  'Miscellaneous' ,
];
var itemToPick=[];
var allItems=[];
var numSkip=[];
//search bar
String itemSearch = '';


class addInventory extends StatefulWidget {
  const addInventory({super.key});
  
  @override
  State<addInventory> createState() => _addInventoryState();
}

class _addInventoryState extends State<addInventory> {
  final conItemSearch =TextEditingController();
 
  void makeList (){
    allItems=[];
    for (var cat =0; cat<items.length;cat++){
      for (var ite = 0; ite <items[cat].length;ite++){
        if (numSkip.contains(cat)){
          break;
        }
        allItems.add(items[cat][ite]);
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeList();
    conItemSearch.addListener(queryListener);
  }
  @override
  void dispose() {
    conItemSearch.removeListener(queryListener);
    conItemSearch.dispose();
    super.dispose();
  }

  void queryListener(){
    search(conItemSearch.text);
  }
  void search(String query){
    if (query.isEmpty){
      setState(() {
        itemToPick = allItems;
      });
    }
    else{
      setState(() {
        itemToPick = allItems.where((e)=>e[0].toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }
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
                color: Color.fromARGB(255, 0, 170, 255),
                borderRadius: BorderRadius.circular(10),
                //shape: BoxShape.circle,
              ),
            ),
            Positioned(
              child: Container(
                width: 500,
                height: 100,
                color: Color.fromARGB(255, 9, 6, 61),                                                        
                child: TextField(                        
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: const Color.fromARGB(174, 207, 37, 165)),
                  controller: conItemSearch, 
                  onSubmitted: (val){
                    setState(() {
                      itemSearch= conItemSearch.text;  
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: '',
                  ),                                                        
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                  width: 1000,
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 110, 18),
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(0)){
                            numSkip.remove(0);
                          }
                          else{
                            numSkip.add(0);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(1)){
                            numSkip.remove(1);
                          }
                          else{
                            numSkip.add(1);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 37, 37),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(2)){
                            numSkip.remove(2);
                          }
                          else{
                            numSkip.add(2);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 88, 88),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(3)){
                            numSkip.remove(3);
                          }
                          else{
                            numSkip.add(3);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 143, 143),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 400,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(4)){
                            numSkip.remove(4);
                          }
                          else{
                            numSkip.add(4);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 228, 186, 186),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 500,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(5)){
                            numSkip.remove(5);
                          }
                          else{
                            numSkip.add(5);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                   Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (numSkip.contains(0)&&numSkip.contains(1)&&numSkip.contains(2)&&numSkip.contains(3)&&numSkip.contains(4)&&numSkip.contains(5)){
                            numSkip.clear();
                          }
                          else{
                            numSkip.clear();
                            numSkip.add(0);
                            numSkip.add(1);
                            numSkip.add(2);
                            numSkip.add(3);
                            numSkip.add(4);
                            numSkip.add(5);
                          }
                          makeList();
                        });
                      },
                      child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ]
              )
            ),
            Positioned(
              top: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                  width: 1000,
                  height: 700,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 0, 255),
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned.fill(
                    child: ListView.builder(                         
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: itemToPick.isEmpty?allItems.length:itemToPick.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        final item = itemToPick.isEmpty? allItems[index]: itemToPick [index];
                        return Padding(
                          padding: const EdgeInsets.only(top:15),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                showDialog(context: context, builder: (_) => ItemDes(item));
                              });
                            },
                            child:  Card(
                              child: Column(
                                children: [
                                  Text(item[0]),
                                  const SizedBox(height: 8.0,),
                                ],
                              ),
                            )
                          )
                        );
                      }
                    )
                  )
                ]
              )
            ),
          ] 
        )
    );
  }
}
