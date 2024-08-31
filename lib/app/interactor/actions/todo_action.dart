import 'package:asp/asp.dart';
import 'package:testeboaldo/app/interactor/atoms/todo_atom.dart';
import 'package:testeboaldo/app/interactor/models/todo_model.dart';

var _autoIncrement = 4;

final fetchTodos = atomAction((set) async {
  todoState.addListener(() {
    todoState.state;
  });
});

final putAction = atomAction1<TodoModel>((set, model) {
  final currentTodos = todoState.state;
   print('Current Todos: $currentTodos');
  if (model.id == -1) {
    final newTodo = model.copyWith(id: _autoIncrement);
    _autoIncrement++; // Incrementa o id para o próximo TodoModel

    final updatedTodos = [...currentTodos, newTodo];

    set(todoState, updatedTodos);
    
  } else {
    
    final updatedTodos = currentTodos.map((todo) {
      
      return todo.id == model.id ? model : todo;
    }).toList();

    // Atualiza o estado com a lista modificada
    set(todoState, updatedTodos);
  }
}
);

final deleteAction = atomAction1<int>((set, id) {
  final currentTodos = todoState.state;

  // Remove o TodoModel com o id especificado
  final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();

  // Atualiza o estado com a lista modificada
  set(todoState, updatedTodos);
});