import 'package:basic_bloc_flutter/cubit/counter_cubit.dart';
import 'package:basic_bloc_flutter/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/color_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider<ColorCubit>(
          create: (BuildContext context) => ColorCubit(),
        )
      ],
      child: FirstPage(),
    );
  }
}
