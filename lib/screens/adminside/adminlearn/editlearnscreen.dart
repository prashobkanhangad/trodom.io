import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/db/model/learn/learndatamodel.dart';

import '../adminnavbar/adminnavbar.dart';

class EditlearnScreen extends StatefulWidget {
  final index;
  EditlearnScreen({super.key, required this.index});

  @override
  State<EditlearnScreen> createState() => _EditlearnScreenState();
}

class _EditlearnScreenState extends State<EditlearnScreen> {
  final _learntitlecontroller = TextEditingController();

  final _learncontentcontroller = TextEditingController();

  var learnimagefile;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: learnnotifier,
        builder: (BuildContext ctx, List<learnmodel> learnlist, Widget? child) {
          final learndata = learnlist[learnlist.length - 1];
          final index = widget.index;

          _learntitlecontroller.text = learnnotifier.value[index].learntitle;
          _learncontentcontroller.text =
              learnnotifier.value[index].learncontent;

          learnimagefile = learnnotifier.value[index].learnimage;

          // log(index);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 34, 86, 133),
              title: const Text('Tradom.io'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _learntitlecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      hintText: 'Add Title Here',
                      hintStyle: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _learncontentcontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      hintText: 'Add Content Here',
                      hintStyle: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      const Text(
                        'Upload Photo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            piclearnimagefromGallery();
                          },
                          icon: const Icon(Icons.camera_alt)),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      onlearnsubmitbuttonpressed(widget.index);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminnavbarScreen(
                          passingselectedindex: 4,
                        ),
                      ));
                    },
                    child: Text('Submit'))
              ],
            ),
          );
        });
  }

  onlearnsubmitbuttonpressed(index) async {
    final learndb = await Hive.openBox<learnmodel>('learn_db');

    final _learntitle = _learntitlecontroller.text;
    final _learncontent = _learncontentcontroller.text;

    if (learnimagefile == null) {
      final _learnimage = learnimagefile!.path.toString();
    }
    final _learnimage = learnimagefile;

    if (_learntitle.isEmpty || _learncontent.isEmpty) {
      return;
    }

    final _learndata = learnmodel(
        learntitle: _learntitle,
        learncontent: _learncontent,
        learnimage: _learnimage);

    await learndb.putAt(index, _learndata);

    getlearn();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Updated Successfully')));
  }

  Future<void> piclearnimagefromGallery() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      learnimagefile = pickedfile;
    });
    if (pickedfile == null) return;
  }
}
