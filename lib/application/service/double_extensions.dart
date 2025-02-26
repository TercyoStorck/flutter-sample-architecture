extension DoubleExtensions on double {
  double decimalPlaces(int decimalLength) => double.parse(
        this.toStringAsFixed(5),
      );
}
