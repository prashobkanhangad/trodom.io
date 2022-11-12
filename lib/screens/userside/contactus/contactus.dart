import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusScreen extends StatelessWidget {
  ContactusScreen({super.key});

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final subjectcontroller = TextEditingController();
  final messsagecontroller = TextEditingController();

  Future sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    const serviceId = 'service_ev88m6p';
    const templateId = 'template_7l5o5qi';

    const userId = 'wgLlpPyIW1ddnSbVZ';

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": namecontroller.text,
            "Subject": subjectcontroller.text,
            "message": messsagecontroller.text,
            "user_email": emailcontroller.text,
          }
        },
      ),
    );
    print('sending mail');

    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 122),
        title: Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Name',
                  hintStyle: TextStyle(fontSize: 17)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 17)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Subject',
                  hintStyle: const TextStyle(fontSize: 17)),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: TextField(
                maxLines: 5,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: 'Message',
                    hintStyle: const TextStyle(fontSize: 17)),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 132, 122),
                    ),
                    onPressed: () {
                      sendEmail();
                    },
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
          ],
        ),
      ),
    );
  }

// // ...somewhere in your Flutter app...
//   launchMailto() async {
//     final mailtoLink = Mailto(
//       to: ['to@example.com'],
//       cc: ['cc1@example.com', 'cc2@example.com'],
//       subject: 'mailto example subject',
//       body: 'mailto example body',
//     );
//     // Convert the Mailto instance into a string.
//     // Use either Dart's string interpolation
//     // or the toString() method.
//   }
}
