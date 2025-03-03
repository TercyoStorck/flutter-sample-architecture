import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/entity.dart';

abstract class MoviesRequestInformationsEntityContract extends EntityContract {
  final int minimumDate;
  final int maximumDate;
  final int totalPages;

  MoviesRequestInformationsEntityContract({
    required this.minimumDate,
    required this.maximumDate,
    required this.totalPages,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'minimumDate': minimumDate,
      'maximumDate': maximumDate,
      'totalPages': totalPages,
    };
  }

  MoviesRequestInformationsEntityContract.fromMap(Map<String, dynamic> map)
      : minimumDate = map['minimumDate']?.toInt() ?? 0,
        maximumDate = map['maximumDate']?.toInt() ?? 0,
        totalPages = map['totalPages']?.toInt() ?? 0;
}
