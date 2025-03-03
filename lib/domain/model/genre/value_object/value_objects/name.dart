import 'package:flutter_sample_architecture/domain/model/value_object.dart';

class GenreName extends ValueObject<String> {
  GenreName(super.value);

  @override
  void validator() {
    if (super.value.isEmpty) {
      throw InvalidValueValidationException();
    }
  }
}