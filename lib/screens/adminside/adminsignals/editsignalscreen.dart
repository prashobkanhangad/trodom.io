import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';

import '../adminnavbar/adminnavbar.dart';

final ImagePicker picker = ImagePicker();
XFile? signalimagefile;

class EditsignalScreen extends StatefulWidget {
  int id;
  String signaltitle, signalimage;
  EditsignalScreen(
      {super.key,
      required this.id,
      required this.signaltitle,
      required this.signalimage});

  @override
  State<EditsignalScreen> createState() => _AddingsignalState();
}

class _AddingsignalState extends State<EditsignalScreen> {
  @override
  final _signaltitlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: signalsnotifier,
        builder:
            (BuildContext ctx, List<signalmodel> signallist, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 34, 86, 133),
              title: Text('Tradom.io'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (value) {},
                    controller: _signaltitlecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      // hintText: 'Add Title Here',

                      hintStyle: TextStyle(fontSize: 17),
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
                            picsignalimagefromGallery();
                          },
                          icon: Icon(Icons.camera_alt)),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      // onsignalsubmitbuttonpressed();
                      // editsignal(widget.id, );

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminnavbarScreen(
                          passingselectedindex: 1,
                        ),
                      ));
                    },
                    child: Text('Submit'))
              ],
            ),
          );
        });
  }

  onsignalsubmitbuttonpressed() {
    final _signaltitle = _signaltitlecontroller.text;
    final _signalimage = signalimagefile!.path.toString();

    if (_signaltitle.isEmpty) {
      return;
    }
    final _signaldata = signalmodel(
        signaltitle: _signaltitle,
        signalimage: _signalimage,
        id: DateTime.now().millisecondsSinceEpoch);

    addsignal(_signaldata);
  }

  Future<void> picsignalimagefromGallery() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    log('${PickedFile} this picked file');

    setState(() {
      signalimagefile = PickedFile;
    });

    if (PickedFile == null) return;
  }
}
