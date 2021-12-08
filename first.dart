import 'dart:io';

List<String> notes = [];
void main() {
  stdout.write('\t\t Note Application\n');
  stdout.write('1 Write Todo \n');
  stdout.write('2 show Todo \n');
  stdout.write('3 delete Todo \n');

  int choose = int.parse(stdin.readLineSync().toString());

  switch (choose) {
    case 1:
      writeNote();
      break;
    case 2:
      showNote();
      break;
    case 3:
      removeNote();
      break;
    default:
      break;
  }
}

void writeNote() {
  print('Write your note \n');
  var note =
      stdin.readLineSync().toString() + '\t' + '${DateTime.now()}' + '\n';

  File('data.txt').writeAsStringSync(note, mode: FileMode.append);
}

void showNote() {
  File('data.txt').readAsString().then((String contents) {
    print(contents);
  });
}

void removeNote() async {
  List<String> lines = await new File('data.txt').readAsLines();
  for (int i = 0; i < lines.length; i++) {
    print(i.toString() + ' ' + lines[i]);
  }

  print('Choose the number to remove');
  int number = int.parse(stdin.readLineSync().toString());
  File('data.txt').writeAsStringSync('');

  for (int i = 0; i <= lines.length; i++) {
    if (number == i) {
      continue;
    }
    File('data.txt').writeAsStringSync(lines[i] + '\n', mode: FileMode.append);
  }
}
