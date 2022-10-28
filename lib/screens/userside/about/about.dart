import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tradom_io/screens/userside/contactus/contactus.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 122),
        title: Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'About Tradom.io',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
                'Tradom.io is the platform for aspiring traders who strungling in stock market. our vision is revolutionize stock market in india. in our app we provide daily pre-market and post market reports, news regarding indian and global stock market, one of the maojor feature in our app is we provide  advancced level tutorial videos, and we share trade ideas of proffessional P&L verified traders.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 132, 122),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactusScreen(),
                      ));
                    },
                    child: const Text(
                      'Contact Us',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
          )
        ],
      ),
    );
  }
}
