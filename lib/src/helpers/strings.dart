String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

/// Used when the date from the API comes like this format [12-02-2020] (dd-MM-yyyy), which cannot
/// be parsed in Flutter v1.12.13+hotfix.7, the output of it is [2020-02-12] (yyyy-MM-dd).
String reformatStringDate(String date) {
  final split = date.split('-');
  return '${split[2]}-${split[1]}-${split[0]}';
}

String extractIntegerNumber(String text) {
  final intRegex = RegExp(r'(\b|\s+)(\d+)\s+', multiLine: true);
  return intRegex.allMatches(text).map((t) => t.group(0))?.toList()?.first ?? '';
}
