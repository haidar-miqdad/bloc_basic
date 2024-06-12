import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int value = 0;

  CounterBloc() : super(CounterSuccess(0)) {
    on<CounterIncrementEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(const Duration(seconds: 2));
      value++;
      emit(CounterSuccess(value));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterLoading());
      value--;
      if (value < -10) {
        value++;
        emit(CounterFailure('Value cannot be less than -10'));
      } else {
        emit(CounterSuccess(value));
      }
    });
  }
}
