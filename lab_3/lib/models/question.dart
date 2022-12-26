class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
      Question("1 + 1 = ?",
          [
            Answer("A. 1", false),
            Answer("B. -1", false),
            Answer("C. 0", false),
            Answer("D. 2", true),
          ]
      )
  );

  list.add(
      Question("2 + 2 = ?",
          [
            Answer("A. 0", false),
            Answer("B. 1", false),
            Answer("C. 12", false),
            Answer("D. 4", true),
          ]
      )
  );
  list.add(
      Question("3 + 3 = ?",
          [
            Answer("A. 6", true),
            Answer("B. 60", false),
            Answer("C. 6", false),
            Answer("D. 0", false),
          ]
      )
  );
  list.add(
      Question("4 + 4 = ?",
          [
            Answer("A. 8", true),
            Answer("B. 10", false),
            Answer("C. 6", false),
            Answer("D. -12", false),
          ]
      )
  );
  list.add(
      Question("5 + 5 = ?",
          [
            Answer("A. 25", false),
            Answer("B. 10", true),
            Answer("C. 26", false),
            Answer("D. 37", false),
          ]
      )
  );

  list.add(
      Question("6 + ?  = 12 ",
          [
            Answer("A.  9", false),
            Answer("B. 70",  false),
            Answer("C. 6", true),
            Answer("D. 50", false),
          ]
      )
  );

  list.add(
      Question("7 + 7 = ? ",
          [
            Answer("A.  600", false),
            Answer("B. 14",  true),
            Answer("C. 200", false),
            Answer("D. 5", false),
          ]
      )
  );

  list.add(
      Question("8 + 8 = ?",
          [
            Answer("A. 16", true),
            Answer("B. 31", false),
            Answer("C. 30", false),
            Answer("D. 24", false),
          ]
      )
  );

  list.add(
      Question("9 + 9 = ?",
          [
            Answer("A. 19", false),
            Answer("B. 15", false),
            Answer("C. 76", false),
            Answer("D. 18", true),
          ]
      )
  );

  list.add(
      Question("10 + 10 = ? ",
          [
            Answer("A. -20", false),
            Answer("B. -21", false),
            Answer("C. 21", false),
            Answer("D. 20", true),
          ]
      )
  );

  return list;
}