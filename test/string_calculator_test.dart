import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(""), equals(0));
  });

  test('Single number should return the number itself', () {
    expect(calculator.add("1"), equals(1));
  });

  test('Two numbers should return their sum', () {
    expect(calculator.add("1,5"), equals(6));
  });

  test('Newline should be treated as a delimiter', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  test('Custom single-character delimiter should be supported', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  test('Custom multi-character delimiter should be supported', () {
    expect(calculator.add("//[***]\n1***2***3"), equals(6));
  });

  test('Negative numbers should throw an exception', () {
    expect(
        () => calculator.add("-1,2"),
        throwsA(isA<FormatException>().having((e) => e.message, 'message',
            contains("negative numbers not allowed -1"))));
  });

  test('Multiple negative numbers should be shown in exception', () {
    expect(
        () => calculator.add("-1,-2,3"),
        throwsA(isA<FormatException>().having((e) => e.message, 'message',
            contains("negative numbers not allowed -1,-2"))));
  });
}
