import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncreament>((event, emit) {

      emit(state.copyWith(count: state.count +1));
  
    });

    on<CounterDecreament>((event, emit) {

      emit(state.copyWith(count: state.count -1));
  
    });
  }
}
