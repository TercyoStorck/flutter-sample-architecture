import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class MovieTitle extends ValueObject<String> {
  MovieTitle(super.value);

  @override
  void validator() {
    if (super.value.isEmpty) {
      throw InvalidValueValidationException();
    }
  }
}