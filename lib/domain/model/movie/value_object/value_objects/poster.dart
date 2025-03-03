import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class MoviePoster extends ValueObject<String> {
  MoviePoster(super.value);

  @override
  void validator() {
    /* if (super.value.isEmpty) {
      throw InvalidValueValidationException();
    } */
  }
}