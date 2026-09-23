import 'dart:math';

void printProgress(Map<String, int> progress, int last) {
  // Move cursor to the beginning of the previous output
  print('\x1B[${progress.length}A');

  for (final entry in progress.entries) {
    final name = entry.key;
    final current = entry.value;

    final filled = (current / last * 20).round();
    final empty = 20 - filled;

    final bar = '█' * filled + '░' * empty;

    print('$name [$bar] $current/$last');
  }
}

void printModern(Map<String, int> progress, [int last = 5]) {
  clearScreen();

  for (final entry in progress.entries) {
    final current = entry.value;

    final filled = (current / last * 20).round();
    final empty = 20 - filled;

    final bar = '█' * filled + '░' * empty;

    print('${entry.key} [$bar] $current/$last');
  }
}

Stream<String> counter(String name, [int times = 5]) async* {
  for (int i = 0; i < times; i++) {
    final delay = (1 + Random().nextInt(5)) * 10000;

    await Future.delayed(
      Duration(microseconds: delay),
    );

    yield '$name ${i + 1}';
  }

}

void clearScreen() {
  print('\x1B[2J\x1B[H');
}

void main() {
  final tasks = [
    (name: "A", stream: counter("A")),
    (name: "B", stream: counter("B")),
    (name: "C", stream: counter("C")),
    (name: "D", stream: counter("D")),
    (name: "F", stream: counter("F")),
  ];

final progress = <String, int>{
  'A': 0,
  'B': 0,
  'C': 0,
  'D': 0,
  'F': 0,
};

for (final name in progress.keys) {
  print('$name [${'░' * 20}] 0/5');
}

  for (final task in tasks) {
  task.stream.listen(
    (value) {
      final current = int.parse(value.split(' ').last);

      progress[task.name] = current;

      printModern(progress);
    },
    onDone: () {
      progress[task.name] = 5;
      printModern(progress);
    },
  );
}
}