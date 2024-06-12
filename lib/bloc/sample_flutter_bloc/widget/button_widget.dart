import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';



class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: (){
              context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            child: const Text('Decrement')),
        const SizedBox(width: 15,),
        ElevatedButton(
            onPressed: (){
              context.read<CounterBloc>().add(CounterIncrementEvent());
            },
            child: const Text('Increment')),
      ],
    );
  }
}
