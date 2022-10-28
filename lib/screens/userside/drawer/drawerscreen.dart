import 'package:flutter/material.dart';

import '../loginscreen/loginscreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _SideScreenState();
}

class _SideScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Column(
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 31, 132, 122),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.camera_alt)),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 238, 238),
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 31, 132, 122)),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Mobile_No',
                        style: TextStyle(
                          fontSize: 22,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              //
              const Divider(
                thickness: 2,
              ),
              //
              const SizedBox(
                height: 350,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.privacy_tip,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Privacy Policy',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.newspaper,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Terms of use',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.share,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Share to friends',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            title: Text('Are you sure you want to Delete?'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      ),
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('No'))
                            ],
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Delete Account',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            title: Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      ),
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('No'))
                            ],
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Logout',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
