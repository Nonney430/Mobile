import 'dart:io';
import 'dart:math';

void _main() {
  const MAX_RANDOM = 100;

  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');

  var r = Random();
  var answer = r.nextInt(MAX_RANDOM) + 1;

  var guess, isCorrect = false, totalGuesses = 0;
  do {
    stdout.write('║ Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync();

    guess = int.tryParse(input!);
    if (guess != null) {
      totalGuesses++;
      if (answer == guess) {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $totalGuesses');
        isCorrect = true;
      } else if (answer < guess) {
        print('║ ➜ $guess is TOO HIGH! ▲');
      } else {
        print('║ ➜ $guess is TOO LOW! ▼');
      }
      print('╟───────────────────────────────────────────────');
    }
  } while (!isCorrect);

  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');
}