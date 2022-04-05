part of 'counter_cubit.dart';

class CounterState {
  int CounterValue;

  CounterState({required this.CounterValue});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'CounterValue': CounterValue});

    return result;
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      CounterValue: map['CounterValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
