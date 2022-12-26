import 'package:flutter/material.dart';
import 'package:lab_3/models/question.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart' show StopWatchMode, StopWatchTimer;
import 'package:lab_3/screen/stats.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => QuizPage();
}

class QuizPage extends State<Quiz> {

  int totalQuizTime = 10;
  Answer? selectedAnswer;
  int answeredQuestions = 0;
  int questionElapsedTime = 0;
  int currentQuestionIndex = 0;
  final maxTimePerQuestion = 11;
  int correctAnsweredQuestions = 0;
  List<Question> questionList = getQuestions();

  final stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:  11 * 1000
  );

  @override
  void initState() {
    super.initState();
    stopWatchTimer.secondTime.listen((value) {
      setState(() {
        questionElapsedTime = value;
      });

      if (value == 0) {
        handleNext();
      }
    });
    stopWatchTimer.onStartTimer();
  }

  showTimer(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.access_time,
              color: Color.fromRGBO(123, 123, 123, 1),
              size: 30,
            ),
            Text(" ${questionElapsedTime}",
              style: const TextStyle(
                color: Color.fromRGBO(123, 123, 123, 1),
                fontSize: 20,
                fontFamily: 'SF Pro Text',
              ),
            ),
            const Text("s",
              style: TextStyle(
                color: Color.fromRGBO(123, 123, 123, 1),
                fontSize: 20,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ],
        ),
      ),
    );
  }

  showQuestionIndex(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 20,
        ),
        child:
        Text("Question ${currentQuestionIndex + 1} of ${questionList.length}",
          style: const TextStyle(
            color: Color.fromRGBO(123, 123, 123, 1),
            fontSize: 20,
            fontFamily: 'SF Pro Text',
          ),
        ),
      ),
    );
  }

  showQuestion(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 40,
        ),
        child: Text(questionList[currentQuestionIndex].questionText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
              ),
            ),

      ),
    );
  }

  showAnswerList() {
    return Column(
      children: questionList[currentQuestionIndex].answersList.map((e) => showAnswerButton(e),).toList(),
    );
  }

  Widget showAnswerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SF Pro Text',
          ),

          backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              correctAnsweredQuestions++;
              answeredQuestions ++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  isLastQuestion() => currentQuestionIndex == questionList.length - 1;

  handleNext() {
    totalQuizTime += maxTimePerQuestion - stopWatchTimer.secondTime.value;



    if (isLastQuestion()) {
      stopWatchTimer.onResetTimer();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Stats(
              answeredQuestions: answeredQuestions,
              correctAnsweredQuestions: correctAnsweredQuestions,
              quizTime: totalQuizTime
          ))
      );

      //ScoreStats(answeredQuestions,correctAnsweredQuestions, totalQuizTime);
    } else {
      stopWatchTimer.onResetTimer();
      stopWatchTimer.onStartTimer();
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();
  }

  showNextButton(){
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*0.8,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'SF Pro Text',
                ),
              ),
              child: Text(isLastQuestion() ? "Submit" : "Next"),
              onPressed: () {
                handleNext();
              }
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body:Column(
        children: [
          showTimer(),
          showQuestionIndex(),
          showQuestion(),
          showAnswerList(),
          showNextButton(),
        ],
      ),
    );
  }
}