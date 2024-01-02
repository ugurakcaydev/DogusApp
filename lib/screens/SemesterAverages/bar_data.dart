import 'package:dogus_app/screens/SemesterAverages/individual_bar.dart';

class BarData {
  final double semester1Amount;
  final double semester2Amount;
  final double semester3Amount;
  final double semester4Amount;
  final double semester5Amount;
  final double semester6Amount;
  final double semester7Amount;
  BarData({
    required this.semester1Amount,
    required this.semester2Amount,
    required this.semester3Amount,
    required this.semester4Amount,
    required this.semester5Amount,
    required this.semester6Amount,
    required this.semester7Amount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: semester1Amount),
      IndividualBar(x: 1, y: semester2Amount),
      IndividualBar(x: 2, y: semester3Amount),
      IndividualBar(x: 3, y: semester4Amount),
      IndividualBar(x: 4, y: semester5Amount),
      IndividualBar(x: 5, y: semester6Amount),
      IndividualBar(x: 6, y: semester7Amount),
    ];
  }
}
