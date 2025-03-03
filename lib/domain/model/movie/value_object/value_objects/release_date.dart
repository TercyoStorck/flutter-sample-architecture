import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class MovieReleaseDate extends ValueObject<DateTime> {
  MovieReleaseDate(super.value);

  factory MovieReleaseDate.fromTimeStamp(int timeStamp) {
    return MovieReleaseDate(
      DateTime.fromMillisecondsSinceEpoch(timeStamp),
    );
  }

  factory MovieReleaseDate.fromISO8601(String iso8601date) {
    if (iso8601date.isEmpty) {
      throw InvalidValueValidationException();
    }

    return MovieReleaseDate(
      DateTime.parse(iso8601date),
    );
  }

  int get timeStamp => super.value.millisecondsSinceEpoch;

  @override
  String toString() {
    return super.value.toIso8601String().split('T')[0];
  }
}
