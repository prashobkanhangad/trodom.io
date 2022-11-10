import 'package:flutter/material.dart';
import 'package:tradom_io/screens/adminside/admindrawer/useremanagement.dart';
import 'package:tradom_io/screens/adminside/adminlogin/adminloginscreen.dart';

class AdmindrawerScreen extends StatefulWidget {
  const AdmindrawerScreen({super.key});

  @override
  State<AdmindrawerScreen> createState() => _SideScreenState();
}

class _SideScreenState extends State<AdmindrawerScreen> {
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
                    color: Color.fromARGB(255, 34, 86, 133),
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
                        child: Image(
                            image: NetworkImage(
                                'https://www.pngmart.com/files/21/Admin-Profile-Vector-PNG-Image.png')),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 238, 238),
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 34, 86, 133)),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Admin',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Text('Mobile_No',
                    //     style: TextStyle(
                    //       fontSize: 22,
                    //     )),
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
                height: 480,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    // GestureDetector(
                    //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => UserManagement(),
                    //   )),
                    //   child: Row(
                    //     children: const [
                    //       Icon(
                    //         Icons.account_box_rounded,
                    //         size: 20,
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text('User Management',
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold))
                    //     ],
                    //   ),
                    // ),
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
                                                AdminloginScreen()),
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
