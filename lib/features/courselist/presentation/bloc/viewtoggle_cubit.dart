import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/features/courselist/presentation/bloc/viewtoggle_state.dart';

@LazySingleton()
class ViewToggleCubit extends Cubit<ViewState> {
  ViewToggleCubit() : super(GridViewState());

  void toggle() {
    if (state is GridViewState) {
      emit(ListViewState());
    } else if (state is ListViewState) {
      emit(GridViewState());
    }
  }
}
