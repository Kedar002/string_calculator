class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ",";
    if (numbers.startsWith("//")) {
      final delimiterSection = numbers.substring(2, numbers.indexOf("\n"));
      numbers = numbers.substring(numbers.indexOf("\n") + 1);

      if (delimiterSection.startsWith("[") && delimiterSection.endsWith("]")) {
        // Handle multi-character delimiters
        delimiter = delimiterSection.substring(1, delimiterSection.length - 1);
      } else {
        // Handle Single-character delimiter
        delimiter = delimiterSection;
      }
    }

    // Replace newlines with the current delimiter
    numbers = numbers.replaceAll("\n", delimiter);

    // Split numbers using RegExp to handle any delimiters safely
    List<int> parsedNumbers = numbers
        .split(RegExp(RegExp.escape(delimiter)))
        .map((n) => int.tryParse(n) ?? 0)
        .toList();

    // Find negatives
    List<int> negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    return parsedNumbers.fold(0, (sum, num) => sum + num);
  }
}
