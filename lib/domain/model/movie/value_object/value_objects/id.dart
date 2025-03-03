import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class MovieId extends ValueObject<int> {
  MovieId(super.value);

  @override
  void validator() {
    if (super.value <= 0) {
      throw InvalidValueValidationException();
    }
  }
}
