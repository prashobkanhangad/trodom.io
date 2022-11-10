// import 'dart:developer';

// import 'package:flutter/material.dart';

// enum SingingCharacter { intraday, positional }

// class TradeScreenmRadiobutton extends StatefulWidget {
//   const TradeScreenmRadiobutton({super.key, required super.character});

//   @override
//   State<TradeScreenmRadiobutton> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<TradeScreenmRadiobutton> {
//   SingingCharacter? character = SingingCharacter.intraday;

//   @override
//   Widget build(BuildContext context) {
//     // log(character.toString());

//     return 
    
//     Row(
//       children: [
//         Container(
//           width: 180,
//           child: ListTile(
//             title: const Text('Intraday'),
//             leading: Radio<SingingCharacter>(
//               value: SingingCharacter.intraday,
//               groupValue: character,
//               onChanged: (SingingCharacter? value) {
//                 setState(() {
//                   character = value;
//                 });
//               },
//             ),
//           ),
//         ),
//         Container(
//           width: 180,
//           child: ListTile(
//             title: const Text('Positional'),
//             leading: Radio<SingingCharacter>(
//               value: SingingCharacter.positional,
//               groupValue: character,
//               onChanged: (SingingCharacter? value) {
//                 setState(() {
//                   character = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
