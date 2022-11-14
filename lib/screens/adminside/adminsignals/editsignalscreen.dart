import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';

import '../adminnavbar/adminnavbar.dart';

final ImagePicker picker = ImagePicker();
var signalimagefile;

class EditsignalScreen extends StatefulWidget {
  final index;
  String signaltitle, signalimage;

  EditsignalScreen(
      {super.key,
      required this.index,
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
          final signaldata = signallist[signallist.length - 1];
          final index = widget.index;
          _signaltitlecontroller.text =
              signalsnotifier.value[index].signaltitle;

          // log(signalsnotifier.value[index].signalimage);

          final signalimage = widget.signalimage;

          // log(widget.signalimage);

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
                  child: TextFormField(
                    onChanged: (value) {},
                    // initialValue: 'inititial_value',
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
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    height: 200,
                    width: double.maxFinite,
                    child: Image(
                        fit: BoxFit.cover,
                        image: index < 5
                            ? AssetImage('asset/chart.jpg') as ImageProvider
                            : FileImage(
                                File(signalimage),
                              )),
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
                      onsignalsubmitbuttonpressed(widget.index);
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

  onsignalsubmitbuttonpressed(index) async {
    final signaldb = await Hive.openBox<signalmodel>('signal_db');

    final _signaltitle = _signaltitlecontroller.text;

    if (signalimagefile == null)
      final _signalimage = signalimagefile!.path.toString();

    final _signalimage = signalimagefile;

    if (_signaltitle.isEmpty) {
      return;
    }
    final _signaldata = signalmodel(
        signaltitle: _signaltitle, signalimage: _signalimage, id: index);
    await signaldb.putAt(index, _signaldata);

    getsignal();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Updated Successfully')));
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
