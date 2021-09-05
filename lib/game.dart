import 'dart:io';
import 'dart:math';

class Game {
  final int answer;
  final int maxRandom;
  int totalGuesses = 0;
  static const List feedbackList = [
    {
      'text': 'TOO HIGH! ▲',
      'isCorrect': false,
    },
    {
      'text': 'TOO LOW! ▼',
      'isCorrect': false,
    },
    {
      'text': 'CORRECT ❤',
      'isCorrect': true,
    },
  ];

  int getTotalGuesses() {
    return totalGuesses;
  }

  /*Game() {
    this.answer = Random().nextInt(100) + 1;
    print('ตัวเลขที่สุ่มคือ ${this.answer}');
  }*/

  Game({required this.maxRandom}) : this.answer = Random().nextInt(maxRandom) + 1;

  Map doGuess(int num) {
    totalGuesses++;

    if (num > this.answer) {
      return feedbackList[0];
    } else if (num < this.answer) {
      return feedbackList[1];
    } else {
      return feedbackList[2];
    }
  }
}