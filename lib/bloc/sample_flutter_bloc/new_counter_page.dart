import 'package:flutter/material.dart';

import 'package:flutter_bloc_basic/bloc/sample_flutter_bloc/widget/button_widget.dart';
import 'package:flutter_bloc_basic/bloc/sample_flutter_bloc/widget/result_widget.dart';

class NewCounterPage extends StatefulWidget {
  const NewCounterPage({super.key});

  @override
  State<NewCounterPage> createState() => _NewCounterPageState();
}

class _NewCounterPageState extends State<NewCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Counter Page'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New Counter'),
            ],
          ),
          SizedBox(height: 15,),
          ResultWidget(),
          SizedBox(height: 15,),
          ButtonWidget(),
        ],
      ),
    );
  }
}
