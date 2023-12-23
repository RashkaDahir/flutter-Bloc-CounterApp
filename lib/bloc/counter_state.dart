// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
 class CounterState {
  int  count = 0;
  CounterState({
     this.count = 0,
  });

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

}

final class CounterInitial extends CounterState {}
