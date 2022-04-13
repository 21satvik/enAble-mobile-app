import 'package:flutter/material.dart';
import 'package:ultron_5/screens/home_screen.dart';
import 'package:ultron_5/widgets/utility/rate_card.dart';

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
      appBar: AppBar(title: Text('MisMatch')),
      backgroundColor: Color.fromARGB(255, 255, 255, 250),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const RateCard(question: 'Are facilities available there ?'),
              const RateCard(question: 'Were there any wheelchair available ?'),
              const RateCard(question: 'Are there ramps and lifts?'),
              const RateCard(question: 'Did you find the voice navigation useful ?'),
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
