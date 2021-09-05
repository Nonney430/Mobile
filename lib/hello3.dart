import 'dart:io';
import 'dart:math';

void main(){
  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');

  bool isCorrect = false;

  stdout.write('║ Enter max number you want to guess: ');
  var maxInput = stdin.readLineSync();
  var maxNumber= int.tryParse(maxInput!);
  var game;

  print('╟───────────────────────────────────────────────');

  if (maxNumber != null) {

    game = Game(maxRandom: maxNumber);
    do {
      stdout.write('║ Guess the number between 1 and $maxNumber: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess != null) {
        Map resultMap = game.doGuess(guess);
        isCorrect = resultMap['isCorrect'];
        stdout.write('║ ➜ $guess : ');
        print(resultMap['text']);
      }
      if(isCorrect){
        var total = game.getTotalGuesses();
        print('║ Total guess : $total');
      }

    } while (!isCorrect);
  }
  print('╟───────────────────────────────────────────────');
  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');

}


class Game {
  late int answer;
  int totalGuesses = 0;
   static const List feedback = [
    {
      'text' : 'TOO HIGH! ▲',
      'isCorrect': false,
    },
    {
      'text' : 'TOO LOW! ▼',
      'isCorrect': false,
    },
    {
      'text' : 'CORRECT! ❤',
      'isCorrect': true,
    }
  ];
  Game({var maxRandom}) {
    this.answer = Random().nextInt(maxRandom) + 1;
  }

  Map doGuess(int num) {
    totalGuesses++;
    if(num > this.answer){
      return feedback[0];
    }else if(num < this.answer){
      return feedback[1];
    }else{
      return feedback[2];
    }
  }
  getTotalGuesses(){
    return this.totalGuesses;
  }

}