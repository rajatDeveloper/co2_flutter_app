import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/features/home/domain/usecases/get_graph_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_graph_event.dart';
part 'get_graph_state.dart';

class GetGraphBloc extends Bloc<GetGraphEvent, GetGraphState> {
  final GetGraphDataUsecase _getGraphDataUsecase;

  GetGraphBloc({
    required GetGraphDataUsecase getGraphDataUsecase,
  })  : _getGraphDataUsecase = getGraphDataUsecase,
        super(GetGraphInitial()) {
    on<GetGraphEvent>((event, emit) {});

    // triggering the getGraphDataEvent

    on<GetGraphDataEvent>((event, emit) async {
      await _onGetGraphDataEvent(event, emit);
    });
  }

  String getCurrentDateFormatted() {
    final now = DateTime.now();
    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  Future<void> _onGetGraphDataEvent(
      GetGraphDataEvent event, Emitter<GetGraphState> emit) async {
    emit(GetGraphLoading());
    final res = await _getGraphDataUsecase(
        GraphParams(date: getCurrentDateFormatted()));

    res.fold((failure) => emit(GetGraphError(failure.message)),
        (data) => emit(GetGraphSuccess(data)));
  }
}
