import 'package:flutter/material.dart';

class RateCard extends StatefulWidget {
  final String question;
  const RateCard({Key? key, required this.question}) : super(key: key);

  @override
  State<RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  bool _yeshasBeenPressed = false;
  bool _nohasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 253, 255, 236),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text(
              widget.question,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Lato',
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                color: _yeshasBeenPressed ? Colors.green : Colors.white,
                child: const Text('YES'),
                onPressed: () {
                  setState(() {
                    _yeshasBeenPressed = true;
                  });
                },
              ),
              RaisedButton(
                color: _nohasBeenPressed ? Colors.red : Colors.white,
                child: const Text('NO'),
                onPressed: () {
                  setState(() {
                    _nohasBeenPressed = true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
