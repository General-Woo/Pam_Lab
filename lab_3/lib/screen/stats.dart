import 'package:flutter/material.dart';
import 'package:lab_3/models/question.dart';

class Stats extends StatelessWidget {

  final int answeredQuestions;
  final int correctAnsweredQuestions;
  final int quizTime;

  const Stats({
    super.key,
    required this.answeredQuestions,
    required this.correctAnsweredQuestions,
    required this.quizTime
  });

  showGroupItem(BuildContext context, String title, String value) {
    return SizedBox(
        width: 100,
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.grey
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
          ],
        )
    );
  }



  String showQuizTime(int time) {
    Duration duration = Duration(milliseconds: time * 2000);

    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((part) => part.remainder(60).toString().padLeft(2, '0'))
        .join(":");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.38,
          width: MediaQuery.of(context).size.width*0.95,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                width: 0
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  showGroupItem(context, "New Rating", "${correctAnsweredQuestions / 2}"),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      showGroupItem(context, "Score", "$answeredQuestions/${getQuestions().length}"),
                      showGroupItem(context, "Correct", "$correctAnsweredQuestions/$answeredQuestions"),
                      showGroupItem(context, "Completed in", "${quizTime} s")
                    ],
                  ),
                ],
              ),
              //showLeaveButton(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(123, 123, 123, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                        child: const Text('Leave'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Start');
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Quiz()));
                        }
                    ),
                  ),
                ),
              ),
              //showNewGameButton(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.6,
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
                        child: const Text('New Game'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Quiz');
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Quiz()));
                        }
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


