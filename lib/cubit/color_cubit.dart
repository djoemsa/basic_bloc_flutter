import 'package:flutter/material.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'dart:convert';
part 'color_state.dart';

class ColorCubit extends ReplayCubit<ColorState> {
  ColorCubit() : super(ColorState(colorValue: Colors.blue));

  void toGreen() => emit(ColorState(colorValue: Colors.green));
  void toOrange() => emit(ColorState(colorValue: Colors.orange));
  void toPurple() => emit(ColorState(colorValue: Colors.purple));
}
