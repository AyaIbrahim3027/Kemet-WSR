import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/statue_model.dart';
import '../../../data/statue_service/statue_service.dart';
part 'statue_state.dart';

class StatueCubit extends Cubit<StatueState> {
  StatueCubit(this.statueService) : super(StatueInitial());

  final StatueService statueService;

  Future<void> fetchStatues() async {
    emit(StatueLoading());
    try {
      final statues = await statueService.fetchStatues();
      emit(StatueSuccess(statues: statues));
    } catch (e) {
      emit(StatueFailure(errorMsg: e.toString()));
    }
  }
}
