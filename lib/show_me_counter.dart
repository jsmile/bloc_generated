import 'package:bloc_named/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Text(
          '${state.counter}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 52.0,
          ),
        );
      },
    );
  }
}
