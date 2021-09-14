import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses;
  List _numberGuesses;

  Game() : _answer = Random().nextInt(100) + 1, _totalGuesses = 0, _numberGuesses = [] {
    print("The answer is: $_answer");
  }

  int get totalGuesses {
    return _totalGuesses;
  }

  int get answer {
    return _answer;
  }

  List get numberGuesses {
    return _numberGuesses;
  }

  int doGuess(int num) {
    _totalGuesses++;
    _numberGuesses.add(num);
    if(num > _answer) {
      return 1;
    } else if(num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }

}