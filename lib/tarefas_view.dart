import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc2/tarefa_cubit.dart';


import 'loading_view.dart';
import 'models/Tarefa.dart';

class TarefasView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  final _titleController = TextEditingController();
  final _inforController = TextEditingController();
  final playeradd = AudioPlayer();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      floatingActionButton: _floatingActionButton(),
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('images/fun_watches.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: BlocBuilder<TarefasCubit, TarefasState>(
          builder: (context, state) {
            if (state is ListTarefasSuccess) {
              return state.tarefas.isEmpty
                  ? _emptyTarefasView()
                  : _tarefaListView(state.tarefas);
            } else if (state is ListTarefasFailure) {
              return _exceptionView(state.exception);
            } else {
              return LoadingView();
            }
          },
        ),
      ),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  AppBar _navBar() {
    return AppBar(
      title: Text('Tarefas'),
    );
  }

  Widget _newTarefasView() {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Nome da tarefa'),
        ),
        TextField(
          controller: _inforController,
          decoration: InputDecoration(hintText: 'Informação da tarefa'),
        ),
        ElevatedButton(
          onPressed: () {
            // adiciona a validação para não salvar tarefas em branco
            if (_titleController.text.trim().isEmpty || _inforController.text.trim().isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Erro"),
                    content: Text("Preencha os campos antes de salvar a tarefa."),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              BlocProvider.of<TarefasCubit>(context).createTarefas(_titleController.text, _inforController.text);
              _titleController.text = '';
              _inforController.text = '';
              playeradd.play(AssetSource('sound.wav'));

              Navigator.of(context).pop();
            }
          },
          child: Text('Salvar Tarefa'),
        ),
      ],
    );
  }



  Widget _floatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.add, ),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => _newTarefasView());
        });
  }

  Widget _emptyTarefasView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sem tarefas para fazer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Comece adicionando uma nova tarefa',
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }


  Widget _tarefaListView(List<Tarefa> tarefas) {
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        final tarefa = tarefas[index];
        return Dismissible(
          key: Key(tarefa.id.toString()),
          confirmDismiss: (direction) async {
            if (!tarefa.IsComplete) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Erro"),
                    content: Text("Esta tarefa não pode ser excluída porque não está concluída."),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
              return false;
            } else {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmação"),
                    content: Text("Deseja excluir este item?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Excluir"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          onDismissed: (direction) {
            BlocProvider.of<TarefasCubit>(context).deleteTarefas(tarefa);
          },
          child: Card(
            child: CheckboxListTile(
              title: Text(tarefa.titulo),
              subtitle: Text(tarefa.infor),
              value: tarefa.IsComplete,
              onChanged: (newValue) {
                BlocProvider.of<TarefasCubit>(context).updateTarefasIsComplete(tarefa, newValue!);
              },
            ),
          ),
        );
      },
    );
  }

}
