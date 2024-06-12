import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';


class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {

          //success
          if (state is CounterSuccess) {
            return Text('${state.value}');
          }

          //loading
          if(state is CounterLoading){
            return const CircularProgressIndicator();
          }

          //failure
          if(state is CounterFailure){
            return Text('${state.message}');
          }

          return const Text('');
        }
    );
  }
}
