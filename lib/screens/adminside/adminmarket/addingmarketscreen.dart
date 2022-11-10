import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tradom_io/db/function/market/marketfunctions.dart';
import 'package:tradom_io/db/model/marketmodel/marketdatamodel.dart';
import 'package:intl/intl.dart';

import '../adminnavbar/adminnavbar.dart';

XFile? marketimagefile;

class AddingmarketScreen extends StatefulWidget {
  AddingmarketScreen({
    super.key,
  });

  @override
  State<AddingmarketScreen> createState() => _AddingmarketScreenState();
}

class _AddingmarketScreenState extends State<AddingmarketScreen> {
  final _markettitlecontroller = TextEditingController();

  final _marketnewscontroller = TextEditingController();

  final _dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 86, 133),
        title: Text('Tradom.io'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(fontSize: 18),
                controller: _markettitlecontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 10.0,
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  hintText: 'Add Title Here',
                  hintStyle: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _marketnewscontroller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 10.0,
                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    // height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                        child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: const TextStyle(fontSize: 18),
                        controller: _dateInputController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color.fromARGB(255, 34, 86, 133),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
                            // icon: const Icon(
                            //   Icons.calendar_today,
                            //   color: Color.fromARGB(255, 34, 86, 133),
                            // ),
                            hintText: "Enter Date"),
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
                      ),
                    ))),
                Spacer(),
                const Text(
                  'Upload Photo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      picmarketimagefromGallery();
                    },
                    icon: Icon(Icons.camera_alt)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                height: 200,
                width: double.maxFinite,
                child: marketimagefile == null
                    ? Center(child: Text('No Image Found'))
                    : Image(
                        fit: BoxFit.cover,
                        image:
                            FileImage(File(marketimagefile!.path.toString()))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      onmarketsubmitbuttonpressed();
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
  }

  onmarketsubmitbuttonpressed() {
    final _markettitle = _markettitlecontroller.text;
    final _marketnews = _marketnewscontroller.text;
    final _marketimage = marketimagefile!.path.toString();
    final _marketdate = _dateInputController.text;
    if (_markettitle.isEmpty || _marketnews.isEmpty || _marketdate.isEmpty) {
      return;
    }

    final _marketdata = marketmodel(
        markettitle: _markettitle,
        marketnews: _marketnews,
        marketimage: _marketimage,
        marketdate: _marketdate);

    addmarket(_marketdata);
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
