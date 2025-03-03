import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class GenreId extends ValueObject<int> {
  GenreId(super.value);

  @override
  void validator() {
    if (super.value <= 0) {
      throw InvalidValueValidationException();
    }
  }
}
