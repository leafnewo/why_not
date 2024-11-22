import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class FilesPage extends StatefulWidget {
  final List<PlatformFile>files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilesPage({
    super.key,
    required this.files,
    required this.onOpenedFile,
    });

  @override
  State<FilesPage> createState() =>  _FilesPageState();
}

class  _FilesPageState extends State <FilesPage> {
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: const Text('all files'),
      centerTitle: true,
    ),
    body: Center(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: widget.files.length,
        itemBuilder: (context, index){
          final file = widget.files[index];
          return buildFile(file);
        },
      )
      ),
  ); 
  Widget buildFile(PlatformFile file){
    final kb = file.size/1024;
    final mb =kb/1024;
    final fileSize=
      mb>=1?'${mb.toStringAsFixed(2)}MB':'${kb.toStringAsFixed(2)}KB';
    final extension = file.extension??'none';
    final color = const Color.fromARGB(0, 214, 18, 18);
    return InkWell(
      onTap: ()=> widget.onOpenedFile(file),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '.$extension',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              file.name,
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              fileSize,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}