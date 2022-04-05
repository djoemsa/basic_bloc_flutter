import 'package:basic_bloc_flutter/cubit/color_cubit.dart';
import 'package:basic_bloc_flutter/cubit/counter_cubit.dart';
import 'package:basic_bloc_flutter/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorCubit = context.watch<ColorCubit>().state;
    final _counterCubit = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('B.L.o.C Management'),
        elevation: 5,
        flexibleSpace: BlocListener<ColorCubit, ColorState>(
          listener: (context, state) {},
          child: Container(
            color: _colorCubit.colorValue,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<ColorCubit>().toGreen(),
            backgroundColor: Colors.green,
            elevation: 0,
            highlightElevation: 0,
            heroTag: 'colortag',
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => context.read<ColorCubit>().toOrange(),
            backgroundColor: Colors.orange,
            elevation: 0,
            highlightElevation: 0,
            heroTag: 'colortag1',
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => context.read<ColorCubit>().toPurple(),
            backgroundColor: Colors.purple,
            elevation: 0,
            highlightElevation: 0,
            heroTag: 'colortag2',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the First page',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                  fontSize: 40),
              textAlign: TextAlign.center,
            ),
            Builder(
              builder: (context) {
                return Text(
                  _counterCubit.CounterValue.toString(),
                  style: TextStyle(fontSize: 50, color: _colorCubit.colorValue),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: Icon(
                    Icons.add,
                    color: Colors.grey[800],
                  ),
                  onPressed: () => context.read<CounterCubit>().increment(),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  heroTag: 'add',
                ),
                SizedBox(width: 10),
                FloatingActionButton.extended(
                  label: Icon(
                    Icons.remove,
                    color: Colors.grey[800],
                  ),
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  heroTag: 'min',
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Undo / Redo Color',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: Icon(
                    Icons.undo,
                    color: Colors.grey[800],
                  ),
                  onPressed: () => context.read<ColorCubit>().undo(),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  heroTag: 'undo',
                ),
                SizedBox(width: 10),
                FloatingActionButton.extended(
                  label: Icon(
                    Icons.redo,
                    color: Colors.grey[800],
                  ),
                  onPressed: () => context.read<ColorCubit>().redo(),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  highlightElevation: 0,
                  heroTag: 'redo',
                ),
              ],
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              label: Text(
                'to Another Screen',
                style: TextStyle(color: Colors.grey[850]),
              ),
              heroTag: 'route',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(providers: [
                    BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context)),
                    BlocProvider.value(
                        value: BlocProvider.of<ColorCubit>(context)),
                  ], child: SecondPage()),
                ));
              },
              backgroundColor: Colors.white,
              elevation: 0,
              highlightElevation: 0,
              splashColor: Colors.grey[350],
            ),
          ],
        ),
      ),
    );
  }
}
