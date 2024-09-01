import 'package:testeboaldo/app/interactor/models/todo_model.dart';

abstract class TodoRepository{
  Future<List<TodoModel>> getAll();
  Future<TodoModel> inset(TodoModel model);
  Future<TodoModel> update(TodoModel model);
  Future<bool> delete(int id);

}