import 'package:auto_injector/auto_injector.dart';
import 'package:testeboaldo/app/data/repositories/shared_todo_respostory.dart';
import 'package:testeboaldo/app/interactor/repositories/todo_repository.dart';

final injector = AutoInjector();

void registerInstances(){
  injector.add<TodoRepository>(SharedTodoRespostory.new);
  injector.commit();
}