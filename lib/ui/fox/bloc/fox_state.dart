part of 'fox_bloc.dart';

@immutable
sealed class FoxState {}

final class FoxInitial extends FoxState {}

class LoadingFoxState extends FoxState{}

final class ErrorFoxState extends FoxState {}

final class LoadedFoxImageState extends FoxState{
  LoadedFoxImageState({required this.img});
  final String img;
}
