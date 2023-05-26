import 'package:amplify_flutter/amplify_flutter.dart';

import '/models/Tarefa.dart';


class TarefaRepository {
  Future<List<Tarefa>> getTarefas() async {
    try {
      final tarefas = await Amplify.DataStore.query(Tarefa.classType);
      return tarefas;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTarefa(String titulo, String infor) async {
    final newTarefa = Tarefa(titulo: titulo,infor: infor, IsComplete: false);
    try {
      await Amplify.DataStore.save(newTarefa);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTarefaIsComplete(Tarefa tarefa, bool IsComplete) async {
    final updatedTarefa = tarefa.copyWith(IsComplete: IsComplete);
    try {
      await Amplify.DataStore.save(updatedTarefa);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTarefa(Tarefa tarefa) async {
    try {
      await Amplify.DataStore.delete(tarefa);
    } catch (e) {
      throw e;
    }
  }

  Stream observeTarefas() {
    return Amplify.DataStore.observe(Tarefa.classType);
  }

}