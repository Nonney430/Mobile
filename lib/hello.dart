import 'dart:io';
import 'dart:math';
void main(){
  const MAX_RANDOM = 100;
  Random r = Random();
  var answer = r.nextInt(MAX_RANDOM)+1;

  var guess;
  var count = 0;

  print('──────────────────────────────────\n║       GUESS THE NUMBER         ║\n──────────────────────────────────');
  do {
    stdout.write('Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync();

    if (input == null) {
      return;
    }
    guess = int.tryParse(input);
    if(guess == null) {
      count++;

      if (answer == guess) {
        print('➜ $guess Correct 𒆙, total guesses: $count');
      } else if (answer < guess) {
        print('➜ $guess TOO HIGH! ▲');
        print('──────────────────────────────────');
      } else {
        print('➜ $guess TOO LOW! ▼');
        print('──────────────────────────────────');
      }
    }
  }while(guess != answer);
  print('──────────────────────────────────\n║            THE END             ║\n──────────────────────────────────');
}