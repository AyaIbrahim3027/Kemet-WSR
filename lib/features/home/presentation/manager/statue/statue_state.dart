part of 'statue_cubit.dart';

sealed class StatueState extends Equatable {
  const StatueState();
  @override
  List<Object> get props => [];
}

final class StatueInitial extends StatueState {}

final class StatueLoading extends StatueState {}

final class StatueSuccess extends StatueState {
  final List<StatueModel> statues;
  const StatueSuccess({required this.statues});
  @override
  List<Object> get props => [statues];
}

final class StatueFailure extends StatueState {
  final String errorMsg;
  const StatueFailure({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
