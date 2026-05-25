extension StringExtensions on String {
  String get ar => this;
  String get en => this;
}

extension DateTimeExtensions on DateTime {
  String toFormattedDate() {
    return '${year}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
