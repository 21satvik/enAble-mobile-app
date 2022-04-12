import 'package:flutter/material.dart';
import 'package:ultron_5/screens/home_screen.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  bool _yeshasBeenPressed = false;
  bool _nohasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('enAble')),
      backgroundColor: Color.fromARGB(255, 255, 255, 250),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                color: Color.fromARGB(255, 253, 255, 236),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.question_answer),
                      title: Text(
                        'Are there facilites at the place visited ?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          color:
                              _yeshasBeenPressed ? Colors.green : Colors.white,
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
              ),
              Card(
                color: Color.fromARGB(255, 253, 255, 236),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.question_answer_sharp),
                      title: Text(
                        'Were there any wheelchair available ?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          color:
                              _yeshasBeenPressed ? Colors.green : Colors.white,
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
              ),
              Card(
                color: Color.fromARGB(255, 253, 255, 236),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.question_answer_sharp),
                      title: Text(
                        'Are lifts and ramps there ?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          color:
                              _yeshasBeenPressed ? Colors.green : Colors.white,
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
              ),
              Card(
                color: Color.fromARGB(255, 253, 255, 236),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.question_answer_sharp),
                      title: Text(
                        'Did you find the voice navigation useful ?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          color:
                              _yeshasBeenPressed ? Colors.green : Colors.white,
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
              ),
              const SizedBox(
                width: 20,
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Start another ride instead')),
            ],
          ),
        ),
      ),
    );
  }
}
