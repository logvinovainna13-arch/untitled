import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/todo_model.dart';
import 'package:untitled/data/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();

  TodoBloc() : super(TodoInitial()) {
    on<GetTodoListEvent>((event, emit) async {
    try{
      emit (LoadingTodoState());
      final List<TodoModel> todoList = await _repository.getTodoList();
      emit (LoadedTodosState(list: todoList));
    }catch(e){
      emit (ErrorTodoState());
    }
    });
  }
}
