
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'file_page.dart';

var image_;
class mapSystem extends StatefulWidget {
  const mapSystem({super.key});

  @override
  State<mapSystem> createState() => _mapSystemState();
}
File file = File("");
class _mapSystemState extends State<mapSystem> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Death"), centerTitle: true,),
      body: Container(
        color: const Color.fromARGB(237, 53, 40, 65),
        child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: [
              Stack(                
                children:<Widget> [
                  Container(
                    width: 1000,
                    height: 1000,
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    alignment: Alignment.center,

                  ),
                  Container(
                    width: 1000,
                    height: 1000,
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 90, 61, 61), 
                    child: ElevatedButton(
                      child: const Text('pick File'),
                      onPressed: () async{
                        final result = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['png','jpg'],);
                        if(result==null) return;

                       
                        openFiles(result.files);
                       
                      },
                    ),
                  ),
                  
                  
                   
                      
                      
                  
            
                ],
              )
            ],
          )
      ),
    );
  }
  
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
  
  saveFilePermanently(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path); 
  }
  
  void openFiles(List<PlatformFile> files) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context)=>FilesPage(
        files:files,
        onOpenedFile:openFile,
     ),
    ));
  }
  
