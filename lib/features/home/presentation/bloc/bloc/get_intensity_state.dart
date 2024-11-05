part of 'get_intensity_bloc.dart';

@immutable
sealed class GetIntensityState {}

final class GetIntensityInitial extends GetIntensityState {}

//Loding state

final class GetIntensityLoading extends GetIntensityState {}

//Error state

final class GetIntensityError extends GetIntensityState {
  final String message;
  GetIntensityError(this.message);
}

//Success state

final class GetIntensitySuccess extends GetIntensityState {
  final NationalIntensityModel intensity;
  GetIntensitySuccess(this.intensity);
}
