import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/function/market/marketfunctions.dart';
import 'package:tradom_io/db/model/marketmodel/marketdatamodel.dart';
import 'package:intl/intl.dart';

import '../adminnavbar/adminnavbar.dart';

var marketimagefile;

class EditmarketScreen extends StatefulWidget {
  final index;
  EditmarketScreen({
    super.key,
    required this.index,
  });

  @override
  State<EditmarketScreen> createState() => _AddingmarketScreenState();
}

class _AddingmarketScreenState extends State<EditmarketScreen> {
//  final imagenews = widget.Image;

  final _markettitlecontroller = TextEditingController();

  final _marketnewscontroller = TextEditingController();

  final _dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: marketnotifier,
        builder:
            (BuildContext ctx, List<marketmodel> marketlist, Widget? child) {
          final marketdata = marketlist[marketlist.length - 1];
          final index = widget.index;

          // log(index);

          _markettitlecontroller.text = marketnotifier.value[index].markettitle;
          _marketnewscontroller.text = marketnotifier.value[index].marketnews;

          _markettitlecontroller.text = marketnotifier.value[index].markettitle;

          _dateInputController.text = marketnotifier.value[index].marketdate;
          marketimagefile = marketnotifier.value[index].marketimage;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 34, 86, 133),
              title: const Text('Tradom.io'),
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _markettitlecontroller,
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
                      controller: _marketnewscontroller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        hintText: 'Add News Here',
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
//

                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          // height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Center(
                              child: TextField(
                            controller: _dateInputController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Color.fromARGB(255, 34, 86, 133),
                                ),
                                labelText: "Enter Date"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  _dateInputController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ))),
                      Spacer()
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      child: Image(
                        fit: BoxFit.cover,
                        image: index < 1
                            ? const AssetImage('asset/chart.jpg')
                                as ImageProvider
                            : FileImage(File(marketimagefile.toString())),
                      ),
                    ),
                  ),

                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
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
                              picmarketimagefromGallery();
                            },
                            icon: Icon(Icons.camera_alt)),
                      ],
                    ),
                  ),

                  SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            onmarketsubmitbuttonpressed(widget.index);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AdminnavbarScreen(
                                passingselectedindex: 3,
                              ),
                            ));
                          },
                          child: Text('Submit')))
                ],
              ),
            ),
          );
        });
  }

  onmarketsubmitbuttonpressed(index) async {
    final marketdb = await Hive.openBox<marketmodel>('market_db');

    final _markettitle = _markettitlecontroller.text;

    final _marketnews = _marketnewscontroller.text;

    final _marketdate = _dateInputController.text;
    if (marketimagefile == null) {
      final _marketimage = marketimagefile!.path.toString();
    }
    final _marketimage = marketimagefile;

    if (_markettitle.isEmpty || _marketnews.isEmpty || _marketdate.isEmpty) {
      return;
    }

    final _marketdata = marketmodel(
        markettitle: _markettitle,
        marketnews: _marketnews,
        marketimage: _marketimage,
        marketdate: _marketdate);

    marketdb.putAt(index, _marketdata);
  }

  Future<void> picmarketimagefromGallery() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      marketimagefile = pickedfile;
    });
    if (pickedfile == null) return;
  }
}
