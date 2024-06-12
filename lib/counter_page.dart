import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter'),
            ],
          ),
          const SizedBox(height: 15,),
          StreamBuilder<int>(
            stream: counterBloc.stateStream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            }
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    counterBloc.eventSink.add(CounterDecrementEvent());
                  },
                  child: const Text('decrement')),
              const SizedBox(width: 15,),
              ElevatedButton(
                  onPressed: (){
                    counterBloc.eventSink.add(CounterIncrementEvent());
                  },
                  child: const Text('increment')),
            ],
          )
        ],
      ),
    );
  }
}
