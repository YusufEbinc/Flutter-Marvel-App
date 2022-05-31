extension StringExtension on String {
  bool get isStringNullEmpty => isEmpty;
}

extension ListExtension on int {
  // ignore: unnecessary_null_comparison
  bool get isListNullEmpty => this == 0;
}
