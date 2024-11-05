part of 'get_graph_bloc.dart';

@immutable
sealed class GetGraphEvent {}

// get graph data event
final class GetGraphDataEvent extends GetGraphEvent {}
