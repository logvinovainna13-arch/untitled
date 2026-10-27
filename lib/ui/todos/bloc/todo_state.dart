part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState{}

final class ErrorTodoState extends TodoState{}

final class LoadedTodosState extends TodoState{
  final List<TodoModel> list;
  LoadedTodosState({required this.list});
}

