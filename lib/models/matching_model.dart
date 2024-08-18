class MatchingResult {
  final String message;
  final String? data;

  MatchingResult({required this.message, this.data});

  @override
  String toString() {
    return '{"message": "$message", "data": "${data ?? 'null'}"}';
  }
}
