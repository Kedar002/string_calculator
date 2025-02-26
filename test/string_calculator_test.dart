import 'package:test/test.dart';
import '../lib/string_calculator.dart'; // This file doesn't exist yet, but we'll create it later

void main() {
  test('Single number should return the number itself', () {
    final calculator = StringCalculator();
    expect(calculator.add("1"), equals(1));
  });
}
