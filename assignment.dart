import 'dart:io';

void main() {
  for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }

  // Get user input
  print('Enter a string:');
  String inputString = stdin.readLineSync() ?? '';

  // Reverse the string
  String reversedString = inputString.split('').reversed.join();
  print("reverse string is $reversedString");

  // Print the reversed string
  List<dynamic> primes = [];
  print('Prime numbers between 1 and 100:');

  for (int i = 2; i <= 100; i++) {
    if (isPrime(i)) {
      primes.add(i);
    }
  }

  print(primes);
  String str1 = "abcdef";
  String str2 = "zabcde";

  print("Longest Common Substring: ${longestCommonSubstring(str1, str2)}");
}

bool isPrime(int number) {
  if (number < 2) {
    return false;
  }

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

String longestCommonSubstring(String str1, String str2) {
  int len1 = str1.length;
  int len2 = str2.length;

  List<List<int>> dp =
      List.generate(len1 + 1, (index) => List<int>.filled(len2 + 1, 0));

  int maxLength = 0;
  int endIndex = 0;

  for (int i = 1; i <= len1; i++) {
    for (int j = 1; j <= len2; j++) {
      if (str1[i - 1] == str2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;

        if (dp[i][j] > maxLength) {
          maxLength = dp[i][j];
          endIndex = i - 1;
        }
      } else {
        dp[i][j] = 0;
      }
    }
  }

  return str1.substring(endIndex - maxLength + 1, endIndex + 1);
}
