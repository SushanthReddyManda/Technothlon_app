import 'dart:collection';

// /// Example event class.
class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}

bool isSameDay(DateTime a, DateTime b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

popEventSource(List list) {
  Map<DateTime, List<Event>> _kEventSource = Map.fromIterable(
    list,
    key: (item) => DateTime.utc(item[0], item[1], item[2]),
    value: (item) => List.generate(
      item[3],
      (index) => Event(item[4 + index]),
    ),
  );
  return LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_kEventSource);
}
