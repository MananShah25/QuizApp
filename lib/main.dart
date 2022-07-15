import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:quiz_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(QuizApp());

// Widget restart() {
//   return MaterialApp(
//       home: Scaffold(
//     backgroundColor: Colors.black,
//     body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 6,
//               child: Text(
//                 'Your score is ',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 color: Colors.blue,
//                 child: TextButton(
//                   onPressed: () {
//                     QuizApp();
//                   },
//                   child: Text('Restart'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ));
// }

class QuizApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  //const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];

  int quesNo = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[quesNo].questionText,
                //textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          //color: Colors.green,
          child: Container(
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                //The user chose true
                setState(() {
                  if (quizBrain.questionBank[quesNo].questionAnswer == true) {
                    score.add(
                      Icon(Icons.check, color: Colors.green),
                    );
                  } else {
                    score.add(
                      Icon(Icons.close, color: Colors.red),
                    );
                  }
                  if (quesNo == 2) {
                    quesNo = -1;
                    score = [];
                  }
                  quesNo++;
                });
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                //The user chose false
                setState(() {
                  if (quizBrain.questionBank[quesNo].questionAnswer == false) {
                    score.add(
                      Icon(Icons.check, color: Colors.green),
                    );
                  } else {
                    score.add(
                      Icon(Icons.close, color: Colors.red),
                    );
                  }
                  if (quesNo == 2) {
                    quesNo = -1;
                    score = [];
                  }
                  quesNo++;
                });
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: score,
        ),
      ],
    );
  }
}
