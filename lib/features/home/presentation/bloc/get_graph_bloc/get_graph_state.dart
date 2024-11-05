part of 'get_graph_bloc.dart';

@immutable
sealed class GetGraphState {}

final class GetGraphInitial extends GetGraphState {}

//loading state
final class GetGraphLoading extends GetGraphState {}

//Success state
final class GetGraphSuccess extends GetGraphState {
  final List<NationalIntensityModel> data;

  GetGraphSuccess(this.data);
}

//error state
final class GetGraphError extends GetGraphState {
  final String message;

  GetGraphError(this.message);
}
