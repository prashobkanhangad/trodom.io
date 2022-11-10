import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/db/model/learn/learndatamodel.dart';

import '../adminnavbar/adminnavbar.dart';

class AddinglaernScreen extends StatefulWidget {
  AddinglaernScreen({
    super.key,
  });

  @override
  State<AddinglaernScreen> createState() => _AddinglaernScreenState();
}

class _AddinglaernScreenState extends State<AddinglaernScreen> {
  final _learntitlecontroller = TextEditingController();

  final _learncontentcontroller = TextEditingController();

  XFile? learnimagefile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              style: TextStyle(fontSize: 18),
              controller: _learntitlecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                focusColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Add Title Here',
                hintStyle: const TextStyle(fontSize: 17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: TextStyle(fontSize: 18),
              controller: _learncontentcontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                focusColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Add Content Here',
                hintStyle: const TextStyle(fontSize: 17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), border: Border.all()),
              height: 200,
              width: double.maxFinite,
              child: learnimagefile == null
                  ? Center(child: Text('No Image Found'))
                  : Image(
                      fit: BoxFit.cover,
                      image: FileImage(File(learnimagefile!.path.toString()))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Text(
                  'Upload Photo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {
                  onlearnsubmitbuttonpressed();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminnavbarScreen(
                      passingselectedindex: 4,
                    ),
                  ));
                },
                child: Text('Submit')),
          )
        ],
      ),
    );
  }

  onlearnsubmitbuttonpressed() {
    final _learntitle = _learntitlecontroller.text;
    final _learncontent = _learncontentcontroller.text;
    final _learnimage = learnimagefile!.path.toString();

    // log(_learnimage);

    if (_learntitle.isEmpty || _learncontent.isEmpty) {
      return;
    }

    final _learndata = learnmodel(
        learntitle: _learntitle,
        learncontent: _learncontent,
        learnimage: _learnimage);

    addlearn(_learndata);
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
