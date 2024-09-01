import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:testeboaldo/app/interactor/actions/todo_action.dart';
import 'package:testeboaldo/app/interactor/atoms/todo_atom.dart';
import 'package:testeboaldo/app/interactor/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchTodos(); // Carrega os todos, se necessário
  }

  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, title: '', check: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextFormField(
            initialValue: model?.title,
            onChanged: (value) {
              model = model!.copyWith(title: value);
            },
          ),
          actions: [
            if (model!.id != -1)
              TextButton(
                onPressed: () {
                  deleteAction(model!.id);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                putAction(model!);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(
      builder: (_, get) {
        final todos = get(todoState);
        print('Building UI with Todos: $todos');
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) {
              final todo = todos[index];
              return GestureDetector(
                onLongPress: () {
                  editTodoDialog(todo);
                },
                child: CheckboxListTile(
                  value: todo.check,
                  title: Text(todo.title),
                  onChanged: (value) {
                    putAction(
                      todo.copyWith(check: value!),
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => editTodoDialog(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
