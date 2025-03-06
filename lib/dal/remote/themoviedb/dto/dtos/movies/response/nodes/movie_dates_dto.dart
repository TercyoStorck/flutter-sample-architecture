class MovieDatesDTO {
  final String? maximum;
  final String? minimum;

  MovieDatesDTO({
    this.maximum,
    this.minimum,
  });

  Map<String, dynamic> toMap() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  factory MovieDatesDTO.fromMap(Map<String, dynamic> map) {
    return MovieDatesDTO(
      maximum: map['maximum'],
      minimum: map['minimum'],
    );
  }
}
