import 'package:aoc23/helper.dart';

int day2first() => lines('inputs/day2')
    .map(Game.fromLine)
    .where((g) => g.rounds.every((r) =>
        (r[Color.blue] ?? 0) <= 14 &&
        (r[Color.green] ?? 0) <= 13 &&
        (r[Color.red] ?? 0) <= 12))
    .map((g) => g.id)
    .sum()
    .toInt();

int day2second() => lines('inputs/day2')
    .map(Game.fromLine)
    .map((g) {
      final greenPower = g.rounds.map((e) => e[Color.green] ?? 0).max().toInt();
      final redPower = g.rounds.map((e) => e[Color.red] ?? 0).max().toInt();
      final bluePower = g.rounds.map((e) => e[Color.blue] ?? 0).max().toInt();
      return greenPower * redPower * bluePower;
    })
    .sum()
    .toInt();

class Game {
  const Game._(this.id, this.rounds);
  factory Game.fromLine(String s) {
    final split = s.substring(5).split(': ');
    final rounds = split.last
        .split('; ')
        .map((e) => Map.fromEntries(e.split(', ').map((s) {
              final spl = s.split(' ');
              final amount = int.parse(spl.first);
              final color = spl.last;
              return MapEntry(Color.values.byName(color), amount);
            })));
    return Game._(int.parse(split.first), rounds.toList());
  }
  final int id;
  final List<Map<Color, int>> rounds;
}

enum Color {
  green,
  red,
  blue,
}
