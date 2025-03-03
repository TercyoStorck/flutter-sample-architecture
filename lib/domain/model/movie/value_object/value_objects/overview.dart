import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class MovieOverview extends ValueObject<String> {
  MovieOverview(super.value);

  @override
  void validator() {
    /* if (super.value.isEmpty) {
      throw InvalidValueValidationException();
    } */
  }
}