String parseSchedule(String schedule) {
  // Define mappings for days and time slots
  Map<String, String> dayMap = {
    'M': 'Monday',
    'T': 'Tuesday',
    'W': 'Wednesday',
    'R': 'Thursday',
    'F': 'Friday',
    'S': 'Saturday',
    'U': 'Sunday',
  };

  Map<String, String> timeMap = {
    '1': '08:00 - 08:50',
    '2': '09:00 - 09:50',
    '3': '10:10 - 11:00',
    '4': '11:10 - 12:00',
    'n': '12:10 - 13:00',
    '5': '13:20 - 14:10',
    '6': '14:20 - 15:10',
    '7': '15:30 - 16:20',
    '8': '16:30 - 17:20',
    '9': '17:30 - 18:20',
    'a': '18:30 - 19:20',
    'b': '19:30 - 20:20',
    'c': '20:30 - 21:20',
  };

  String result = '';
  String currentDay = '';

  for (int i = 0; i < schedule.length; i++) {
    String char = schedule[i];

    if (dayMap.containsKey(char)) {
      currentDay = dayMap[char]!;
    } else if (timeMap.containsKey(char) && currentDay.isNotEmpty) {
      result += '$currentDay ${timeMap[char]!}, ';
    }
  }

  if (result.endsWith(', ')) {
    result = result.substring(0, result.length - 2);
  }

  return result;
}
