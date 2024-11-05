import 'package:flutter/material.dart';

class ListagemView extends StatefulWidget {
  final Map<String, String>? novoContato; // Recebe o novo contato da tela anterior

  const ListagemView({super.key, this.novoContato});

  @override
  State<ListagemView> createState() => ListagemViewState();
}

class ListagemViewState extends State<ListagemView> {
  // Lista inicial de contatos, com 5 contatos de exemplo
  List<Map<String, String>> contatos = [
    {'nome': 'Maria', 'telefone': '1234-5678'},
    {'nome': 'João', 'telefone': '8765-4321'},
    {'nome': 'Amanda', 'telefone': '1111-2222'},
    {'nome': 'Giovanna', 'telefone': '3333-4444'},
    {'nome': 'Ana', 'telefone': '5555-6666'},
  ];

  // Função chamada quando a tela é carregada
  @override
  void initState() {
    super.initState();
    // Adiciona o novo contato recebido, se existir
    if (widget.novoContato != null) {
      contatos.add(widget.novoContato!);
    }
  }

  // Função para editar um contato específico
  void _editarContato(int index) {
    // Controladores para armazenar as edições de nome e telefone
    TextEditingController nomeController = TextEditingController(text: contatos[index]['nome']);
    TextEditingController telefoneController = TextEditingController(text: contatos[index]['telefone']);

    // Mostra um diálogo com campos para editar o contato
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Contato'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo de texto para editar o nome
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              // Campo de texto para editar o telefone
              TextField(
                controller: telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
            ],
          ),
          actions: [
            // Botão de salvar, atualiza o contato
            TextButton(
              onPressed: () {
                setState(() {
                  // Atualiza o nome e telefone na lista
                  contatos[index]['nome'] = nomeController.text;
                  contatos[index]['telefone'] = telefoneController.text;
                });
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Função para excluir um contato
  void _excluirContato(int index) {
    setState(() {
      contatos.removeAt(index); // Remove o contato da lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título da tela de listagem
        title: const Text('Listagem de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length, // Número de contatos para exibir
        itemBuilder: (context, index) {
          return ListTile(
            // Exibe o nome do contato
            title: Text(contatos[index]['nome']!),
            // Exibe o telefone do contato
            subtitle: Text(contatos[index]['telefone']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botão de editar, chama a função _editarContato
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editarContato(index),
                ),
                // Botão de excluir, chama a função _excluirContato
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _excluirContato(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
