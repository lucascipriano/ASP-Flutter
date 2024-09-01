import 'package:asp/asp.dart';
import 'package:testeboaldo/app/injector.dart';
import 'package:testeboaldo/app/interactor/atoms/todo_atom.dart';
import 'package:testeboaldo/app/interactor/models/todo_model.dart';
import 'package:testeboaldo/app/interactor/repositories/todo_repository.dart';

final fetchTodos = atomAction((set) async {
  final repository = injector.get<TodoRepository>();
  final todos = await repository.getAll();
  set(todoState, todos);
});

final putAction = atomAction1<TodoModel>((set, model) async {
  final repository = injector.get<TodoRepository>();

  // final currentTodos = todoState.state;
  if (model.id == -1) {
    await repository.inset(model);
    
  } else {
    await repository.update(model);
  }
  // reload list
  fetchTodos();
}
);

final deleteAction = atomAction1<int>((set, id) async{
  final repository = injector.get<TodoRepository>();
  await repository.delete(id);
  // reload list
  fetchTodos();
});