import 'package:dio/dio.dart';
import 'package:untitled/data/models/todo_model.dart';

class TodoRepository {
final Dio _dio = Dio();

Future<List<TodoModel>> getTodoList()async{
  final Response response = await _dio.get('https://dummyjson.com/todos');
  List<dynamic> list = response.data['todos'];
  List<TodoModel> todoList = [];
  list.forEach((todo){
    todoList.add(TodoModel.fromJson(todo),);
  });
  return todoList;
 }
}
