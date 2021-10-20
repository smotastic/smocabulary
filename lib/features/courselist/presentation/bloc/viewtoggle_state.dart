import 'package:equatable/equatable.dart';

abstract class ViewState extends Equatable {}

class ListViewState extends ViewState {
  @override
  List<Object?> get props => [];
}

class GridViewState extends ViewState {
  @override
  List<Object?> get props => [];
}
