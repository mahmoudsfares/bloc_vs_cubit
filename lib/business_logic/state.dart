import 'package:equatable/equatable.dart';

sealed class MySearchState extends Equatable {
  const MySearchState();

  @override
  List<Object> get props => [];
}

final class SearchStateInit extends MySearchState {}

final class SearchStateEmpty extends MySearchState {}

final class SearchStateLoading extends MySearchState {}