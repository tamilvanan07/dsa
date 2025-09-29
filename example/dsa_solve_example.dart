import 'dart:io';
import 'dart:math';

void main() {
  var dsa = Func.instance;
  List<int> numbers = [38, 27, 43, 10, 82, 9, 17];
  print("Original list: $numbers");
  // dsa.enterAgeFunc();
  // dsa.findPrimeNumber();
  //  dsa.findCommonElementBetweenTwoList();
  // dsa.findTheListThatHasEvenNumber();
  // dsa.buildStonePaperScissors();
  // dsa.guessNumber();
  // /dsa.mergeSort(numbers, 0, numbers.length - 1);
  // dsa.findTheLengthofLongestSubString('Tamilvanan');
  //  dsa.addTwoNumbers(ListNode(2,ListNode(4,ListNode(3))),ListNode(5,ListNode(6,ListNode(4))));
  // dsa.findLowestArray();

  // print("REVERSEDI INT: ${dsa.reverseInt(-123)}");
  var value = 200 % 2;
  print("REVERSEDI INT: $value");

  //
  //  print("ANS:${dsa.twoSum([1,3, 7,10,2],7)}");
}

class Func {
  static Func instance = Func._internal();

  factory Func() {
    return instance;
  }

  Func._internal();

  int reverse(int x) {
    String value = x.toString();

    List splitted = value.split('').reversed.toList();
    if (splitted.last == '-') {
      splitted.insert(0, splitted.removeLast());
    }

    if (splitted.length > 11 || (splitted.length == 11 && splitted[0] != '-')) {
      return 0;
    }

    String v = splitted.join();

    return int.parse(v.toString());
  }

  void enterAgeFunc() {
    while (true) {
      stdout.write("Please enter your age: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        stdout.writeln("No input detected. Please try again.");
        continue;
      }
      input = input.trim();
      final age = int.tryParse(input);
      if (age == null || age < 0) {
        stdout.writeln("Invalid age. Enter a non-negative integer.");
        continue;
      }

      final remaining = 100 - age;
      stdout.writeln("You entered: $age");
      stdout.writeln("How many years are there to get 100 = $remaining");
      break;
    }
  }

  void findPrimeNumber() {
    stdout.write("Please enter the any number to find prime number:");

    int? getNumber = int.tryParse(stdin.readLineSync() ?? "0");

    if ((getNumber ?? 0) % 2 == 0) {
      stdout.writeln("$getNumber is a Prime number");
    } else {
      stdout.writeln("$getNumber is not a Prime number");
    }
  }

  void findCommonElementBetweenTwoList() {
    List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 89];
    Set<int> commonElements = {};

    for (var i in a) {
      for (var j in b) {
        if (i == j) {
          commonElements.add(i);
        }
      }
    }

    print("The common List in ${commonElements.toList()}");
  }

  void findTheListThatHasEvenNumber() {
    List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

    int i = 0;

    List<int> b = [];

    for (var data in a) {
      // print("${++i}");
      if (data % 2 == 0) {
        b.add(data);
      }
    }

    stdout.writeln("The even list is $b");
  }

  void buildStonePaperScissors() {
    Random random = Random();
    stdout.write("Welcome to the Stone Paper Scissor\n");
    Map<String, dynamic> rules = {
      "rock": "scissors",
      "scissors": "paper",
      "paper": "rock",
    };

    List<String> options = ["rock", "paper", "scissors"];

    int userPoints = 0;
    int compPoints = 0;

    while (true) {
      String randomChoice = options[random.nextInt(options.length)];

      stdout.write("Please enter your choice: ");

      String? userChoice = (stdin.readLineSync() ?? "").toLowerCase();

      if (userChoice == "exit") {
        print("\nYou: $userPoints Computer: $compPoints\nBye Bye!");
        break;
      }

      if (!options.contains(userChoice)) {
        print("THE USER ENTERED WRONG DATA");
        continue;
      } else if (userChoice == randomChoice) {
        print("THE GAME IS TIE");
      } else if (rules[randomChoice] == userChoice) {
        compPoints++;
        print("THE COMPUTER WINS $compPoints && $userPoints");
      } else if (rules[userChoice] == randomChoice) {
        print("THE USERR WINS $compPoints && $userPoints");
        userPoints++;
      }
    }
  }

  List<int> twoSum(List<int> nums, int target) {
    final Map<int, int> numToIndex = {};

    for (int i = 0; i < nums.length; i++) {
      final complement = target - nums[i];

      if (numToIndex.containsKey(complement)) {
        return [numToIndex[complement]!, i];
      }

      numToIndex[nums[i]] = i;
    }

    return []; // No solution found
  }

  void sumTwoNumber() {}

  void guessNumber() {
    Random random = Random();

    final randomNumberGenerate = random.nextInt(100);

    int i = 0;

    while (true) {
      i += 1;
      stdout.write("Please enter your guess number: ");
      String inputNumber = stdin.readLineSync() ?? "";
      if (inputNumber.toLowerCase() == "exit") {
        stdout.write("Thank you Attempt $i");
      } else if ((int.tryParse(inputNumber) ?? 0) > 100) {
        print("Please enter your guess number under 100 digit");
        continue;
      }

      if ((int.tryParse(inputNumber) ?? 0) == randomNumberGenerate) {
        print(" Hurray guess number is correct");
        continue;
      } else if ((int.tryParse(inputNumber) ?? 0) > randomNumberGenerate) {
        print(" your guess number greater than $inputNumber");
        continue;
      } else {
        print(" your guess number lesser than $inputNumber");
        continue;
      }
    }
  }

  int lengthOfLongestSubstring(String s) {
    Set<String> seen = {};
    int left = 0, maxLength = 0;

    for (int right = 0; right < s.length; right++) {
      while (seen.contains(s[right])) {
        seen.remove(s[left]);
        left++;
      }
      seen.add(s[right]);
      maxLength = maxLength > (right - left + 1)
          ? maxLength
          : (right - left + 1);
    }

    return maxLength;
  }

  int findTheLengthofLongestSubString(String s) {
    int left = 0;
    int maxlength = 0;
    Set<String> list = {};

    for (var right = 0; right < s.length; right++) {
      while (list.contains(s[right])) {
        list.remove(s[right]);
        left++;
      }

      list.add(s[right]);

      maxlength = maxlength > (right - left + 1)
          ? maxlength
          : (right - left + 1);
    }

    return maxlength;
  }

  String splitReverseAndAddString(String data) {
    String a = data.split('').reversed.toList().join(" ");
    return a;
  }

  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode current = dummy;
    int carry = 0;

    while (l1 != null || l2 != null || carry != 0) {
      int val1 = (l1 != null) ? l1.val : 0;
      int val2 = (l2 != null) ? l2.val : 0;

      int total = val1 + val2 + carry;
      carry = total ~/ 10; // integer division
      current.next = ListNode(total % 10);

      current = current.next!;
      l1 = (l1 != null) ? l1.next : null;
      l2 = (l2 != null) ? l2.next : null;
    }

    return dummy.next;
  }

  void findLowestArray() {
    List<List<int>> arr = [
      [5, 9, 2],
      [8, 7, 3],
      [4, 6, 1],
    ];

    // Step 1: find min of each sub-array
    List<int> mins = arr
        .map((sub) => sub.reduce((a, b) => a < b ? a : b))
        .toList();
    print("Minimum of each array: $mins");

    // Step 2: find the global min
    int globalMin = mins.reduce((a, b) => a < b ? a : b);
    print("Lowest overall: $globalMin");
  }

  // The main function for Merge Sort.
  // It recursively divides the list.
  void mergeSort(List<int> list, int left, int right) {
    if (left < right) {
      // Find the middle point
      int mid = (left + right) ~/ 2;

      // Recursively sort the first and second halves
      mergeSort(list, left, mid);
      mergeSort(list, mid + 1, right);

      // Merge the sorted halves
      _merge(list, left, mid, right);
    }
  }

  // A helper function to merge two sorted subarrays.
  void _merge(List<int> list, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    // Create temporary lists
    List<int> leftList = List<int>.filled(n1, 0);
    List<int> rightList = List<int>.filled(n2, 0);

    // Copy data to temp lists
    for (int i = 0; i < n1; i++) {
      leftList[i] = list[left + i];
    }
    for (int j = 0; j < n2; j++) {
      rightList[j] = list[mid + 1 + j];
    }

    // Merge the temp lists back into the original list
    int i = 0; // Initial index of first subarray
    int j = 0; // Initial index of second subarray
    int k = left; // Initial index of merged subarray

    while (i < n1 && j < n2) {
      if (leftList[i] <= rightList[j]) {
        list[k] = leftList[i];
        i++;
      } else {
        list[k] = rightList[j];
        j++;
      }
      k++;
    }

    // Copy any remaining elements of the left list
    while (i < n1) {
      list[k] = leftList[i];
      i++;
      k++;
    }

    // Copy any remaining elements of the right list
    while (j < n2) {
      list[k] = rightList[j];
      j++;
      k++;
    }
  }

  // Reverse the int without coverting into string

  int reverseInt(int givenValue) {
    int conversionValue = 0;
    bool isNegative = givenValue < 0;
    givenValue = givenValue.abs();

    while (givenValue > 0) {
      int digit = givenValue % 10;
      print("THE DIGIT $digit");
      conversionValue = conversionValue * 10 + digit;

      givenValue ~/= 10;
    }
    return isNegative ? -conversionValue : conversionValue;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
