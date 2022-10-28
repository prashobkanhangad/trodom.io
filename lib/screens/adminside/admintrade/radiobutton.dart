import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class TradeScreenmRadiobutton extends StatefulWidget {
  const TradeScreenmRadiobutton({super.key});

  @override
  State<TradeScreenmRadiobutton> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<TradeScreenmRadiobutton> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          child: ListTile(
            title: const Text('Intraday'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
        Container(
          width: 180,
          child: ListTile(
            title: const Text('Positional'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
