import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc2/tarefa_repository.dart';

import 'models/Tarefa.dart';

abstract class TarefasState {}

class LoadingTarefas extends TarefasState {}

class ListTarefasSuccess extends TarefasState {
  final List<Tarefa> tarefas;

  ListTarefasSuccess({required this.tarefas});
}

class ListTarefasFailure extends TarefasState {
  final Exception exception;

  ListTarefasFailure({required this.exception});
}

class TarefasCubit extends Cubit<TarefasState> {
  final _tarefasRepo = TarefaRepository();

  TarefasCubit() : super(LoadingTarefas());

  void getTarefas() async {
    if (state is ListTarefasSuccess == false) {
      emit(LoadingTarefas());
    }

    try {
      final tarefas = await _tarefasRepo.getTarefas();
      emit(ListTarefasSuccess(tarefas: tarefas));
    } catch (e) {
      emit(ListTarefasFailure(exception: Exception()));
    }
  }

  void createTarefas(String titulo, String infor) async {
    await _tarefasRepo.createTarefa(titulo, infor);
  }

  void updateTarefasIsComplete(Tarefa tarefa, bool IsComplete) async {
    await _tarefasRepo.updateTarefaIsComplete(tarefa, IsComplete);
  }

  void observeTarefa() {
    final tarefasStream = _tarefasRepo.observeTarefas();
    tarefasStream.listen((_) => getTarefas());
  }


  void deleteTarefas(Tarefa tarefa) async {
    await _tarefasRepo.deleteTarefa(tarefa);
  }
}
