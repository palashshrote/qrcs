class epochComputation {
  // final String createddateString;
  final int year;
  final int month;
  final int day;
  // final int createdEpochTimeMillis;
  final int epochTimeMin;

  epochComputation(this.year, this.month, this.day, this.epochTimeMin);
}

epochComputation computefunction(String createddateString) {
  DateTime createddateTime = DateTime.parse(createddateString);
  int year = createddateTime.year;
  int month = createddateTime.month;
  int day = createddateTime.day;
  int createdEpochTimeMillis = createddateTime.millisecondsSinceEpoch;

  final now = DateTime.now();
  int currEpochTimeMillis = now.millisecondsSinceEpoch;
  int epochTimeMin = (currEpochTimeMillis - createdEpochTimeMillis) ~/ 60000;

  return epochComputation(year, month, day, epochTimeMin);
}
