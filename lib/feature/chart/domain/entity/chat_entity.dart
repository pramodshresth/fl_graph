class ChartEntity {
  String name;
  String type;
  List<String> labels;
  List<int> values;

  ChartEntity({
    required this.name,
    required this.type,
    required this.labels,
    required this.values,
  });
}
