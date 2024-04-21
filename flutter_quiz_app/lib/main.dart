import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class SingleQuestionModel{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question,this.options,this.answerIndex});
}


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionModel(
      question: "Who is founder of Microsoft ?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question: "Who is founder of Apple ?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "Who is founder of Amazon ?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Who is founder of Tesla ?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      question: "Who is founder of Google ?",
      options: ["Steve Jobs", "Larry Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
  ];

  MaterialStateProperty<Color?>? answerColor(int clickedOption) {
    if (optionindex != -1) {
      if (clickedOption == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green); // correct answer
      } else if (clickedOption == optionindex) {
        return const MaterialStatePropertyAll(Colors.red); // Incorrect answer
      }
    } else {
      return const MaterialStatePropertyAll(null); // if no option is clicked
    }
    return null;
  }

  AppBar returnAppBar(){
    return AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
    );
  }

  bool questionScreen = true;
  int questionIndex = 0;
  int optionindex = -1;
  int score=0;

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar:returnAppBar(),
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white,Colors.cyan], begin: Alignment.topLeft,end:Alignment.bottomRight),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Questions : ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${questionIndex + 1} / ${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 320,
                height: 50,
                child: Text(
                  allQuestions[questionIndex].question,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ======================ElevatedButton 1 ====================
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    optionindex = 0;
                  });
                },
                style: ButtonStyle(
                  fixedSize:const MaterialStatePropertyAll(Size(300,50)),
                  backgroundColor: answerColor(0),
                ),
                child: Text(
                  "A. ${allQuestions[questionIndex].options[0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // ======================ElevatedButton 2 ====================
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    optionindex = 1;
                  });
                },
                style: ButtonStyle(
                  fixedSize:const MaterialStatePropertyAll(Size(300,50)),
                  backgroundColor: answerColor(1),
                ),
                child: Text(
                  "B.${allQuestions[questionIndex].options[1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // ======================ElevatedButton 3 ====================
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    optionindex = 2;
                  });
                },
                style: ButtonStyle(
                  fixedSize:const MaterialStatePropertyAll(Size(300,50)),
                  backgroundColor: answerColor(2),
                ),
                child: Text(
                  "C.${allQuestions[questionIndex].options[2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // ======================ElevatedButton 4 ====================
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    optionindex = 3;
                  });
                },
                style: ButtonStyle(
                  fixedSize:const MaterialStatePropertyAll(Size(300,50)),
                  backgroundColor: answerColor(3),
                ),
                child: Text(
                  "D.${allQuestions[questionIndex].options[3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if(optionindex==allQuestions[questionIndex].answerIndex){
                score++;
              }
              questionIndex++;
              if(questionIndex==allQuestions.length){
                questionScreen=false;
              }
              if(optionindex==-1){
                questionIndex--;
              }
              optionindex=-1;
            });
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.forward_rounded, color: Colors.orange,size: 35,),
        ),
      );
    } else {
      return Scaffold(
        appBar: returnAppBar(),
        body: Center(
          child: Center(
            child:Text('Congratulation $score/${allQuestions.length}'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            questionScreen=true;
            questionIndex=0;
            optionindex=-1;
            score=0;             
            setState(() {});
          },
          child: const Text('Reset'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:isQuestionScreen(),
    );
  }
}