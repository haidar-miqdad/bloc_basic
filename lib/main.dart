import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/bloc/sample_flutter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/sample_flutter_bloc/new_counter_page.dart';
import 'counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const NewCounterPage(),
      ),
    );
  }
}

