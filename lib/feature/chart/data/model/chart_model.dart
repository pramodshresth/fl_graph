import 'dart:convert';

import 'package:velorana/feature/chart/domain/entity/chat_entity.dart';

class ChartModel extends ChartEntity {
  ChartModel(
      {required super.name, required super.type, required super.labels, required super.values});

  ChartModel copyWith({
    String? name,
    String? type,
    List<String>? labels,
    List<int>? values,
  }) =>
      ChartModel(
        name: name ?? this.name,
        type: type ?? this.type,
        labels: labels ?? this.labels,
        values: values ?? this.values,
      );

  factory ChartModel.fromRawJson(String str) => ChartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
    name: json["name"],
    type: json["type"],
    labels: List<String>.from(json["labels"].map((x) => x)),
    values: List<int>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "labels": List<dynamic>.from(labels.map((x) => x)),
    "values": List<dynamic>.from(values.map((x) => x)),
  };
}
