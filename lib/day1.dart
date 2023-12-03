import 'package:aoc23/helper.dart';

const numbers = {
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9,
};

int day1first() => lines('inputs/day1')
    .map((s) => s.split('').map((e) => int.tryParse(e)).where((i) => i != null))
    .map((e) => int.parse('${e.first}${e.last}'))
    .fold(0, (a, b) => a + b);

int day1second() => lines('inputs/day1')
    .map((s) => s
        .split('')
        .enumerate()
        .map((en) => int.tryParse(en.val) ?? findNum(s, en.i))
        .where((i) => i != null)
        .cast<int>())
    .map((l) => int.parse('${l.first}${l.last}'))
    .fold(0, (a, b) => a + b);

int? findNum(String chars, int index) {
  for (var number in numbers.entries) {
    if (chars.substring(index).startsWith(number.key)) {
      return number.value;
    }
  }

  return null;
}
