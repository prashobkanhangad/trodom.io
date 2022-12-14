import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';
import 'package:tradom_io/screens/adminside/adminsignals/editsignalscreen.dart';

import '../adminnavbar/adminnavbar.dart';

final ImagePicker picker = ImagePicker();
XFile? signalimagefile;

class Addingsignal extends StatefulWidget {
  const Addingsignal({
    super.key,
  });

  @override
  State<Addingsignal> createState() => _AddingsignalState();
}

class _AddingsignalState extends State<Addingsignal> {
  final _signaltitlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 18),
              controller: _signaltitlecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13.0,
                  horizontal: 10.0,
                ),
                focusColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Add Title Here',
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), border: Border.all()),
              height: 200,
              width: double.maxFinite,
              child: signalimagefile == null
                  ? Center(child: Text('No Image Found'))
                  : Image(
                      fit: BoxFit.cover,
                      image: FileImage(File(signalimagefile!.path.toString()))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 34, 86, 133)),
                ),
                onPressed: () {
                  onsignalsubmitbuttonpressed();
                  setState(() {});
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminnavbarScreen(
                      passingselectedindex: 1,
                    ),
                  ));
                },
                child: Text('Submit')),
          )
        ],
      ),
    );
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
