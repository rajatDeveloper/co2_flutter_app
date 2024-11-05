import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/features/home/domain/usecases/get_intensity_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_intensity_event.dart';
part 'get_intensity_state.dart';

class GetIntensityBloc extends Bloc<GetIntensityEvent, GetIntensityState> {
  final GetIntensityDataUsecase _getIntensityDataUsecase;
  GetIntensityBloc({
    required GetIntensityDataUsecase getIntensityDataUsecase,
  })  : _getIntensityDataUsecase = getIntensityDataUsecase,
        super(GetIntensityInitial()) {
    on<GetIntensityEvent>((event, emit) {});

    //trigger the initial event to get the initial state
    on<GetIntensityDataInitialEvent>((event, emit) async {
      await _onGetInitialIntensityData(event, emit);
    });
  }

  Future<void> _onGetInitialIntensityData(GetIntensityDataInitialEvent event,
      Emitter<GetIntensityState> emit) async {
    emit(GetIntensityLoading());
    var res = await _getIntensityDataUsecase(NoParms());

    res.fold((failure) => emit(GetIntensityError(failure.message)),
        (data) => emit(GetIntensitySuccess(data.first)));
  }
}
