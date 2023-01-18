import 'package:flutter_bloc/flutter_bloc.dart';

class RadioBloc extends Bloc<int, int> {
  RadioBloc() : super(-1) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}

class CheckBoxBloc extends Bloc<bool, bool> {
  CheckBoxBloc() : super(false) {
    on<bool>((event, emit) {
      emit(event);
    });
  }
}

class DateBloc extends Bloc<DateTime, DateTime> {
  DateBloc() : super(DateTime.now()) {
    on<DateTime>((event, emit) {
      emit(event);
    });
  }
}