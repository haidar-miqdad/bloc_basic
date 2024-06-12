import 'dart:async';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent{}
class CounterDecrementEvent extends CounterEvent{}

class CounterBloc{
  int _value = 0;

  //event Control
  final StreamController<CounterEvent> _eventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get eventSink => _eventController.sink; //data masuk lewat sini
  Stream<CounterEvent> get eventStream => _eventController.stream; //data keluar lewat sini

  //state Control
  final StreamController<int> stateController = StreamController<int>.broadcast();

  StreamSink<int> get stateSink => stateController.sink;
  Stream<int> get stateStream => stateController.stream;

  CounterBloc(){
    // Mengirim nilai awal ke state stream
    stateSink.add(_value);
    // Mendengarkan event stream dan memperbarui state sesuai event
    eventStream.listen((event) {
      if(event is CounterIncrementEvent){
        _value++;
      }else if(event is CounterDecrementEvent){
        _value--;
      }
      stateSink.add(_value);
    });
  }

  void dispose(){
    _eventController.close();
    stateController.close();
  }
}
