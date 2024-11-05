import 'package:flutter/material.dart';
import 'listagem_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  // Controladores para armazenar o texto dos campos de nome e telefone
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Função para navegar para a página de listagem e enviar o novo contato
  void _navigateToListagemView() { // Função para navegar para a listagemview usando o navigator.push
    // Adiciona o contato e navega para a página de listagem
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListagemView(
          // Passa o contato como um mapa contendo o nome e o telefone
          novoContato: {
            'nome': _nameController.text,
            'telefone': _phoneController.text,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Título da barra superior
      appBar: AppBar(
        title: const Center(child: Text('Gerenciamento de Contatos')),
      ),
      body: SingleChildScrollView(
        // Usado para permitir a rolagem da tela, útil em dispositivos menores
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Exibe a imagem central do app
                Image.asset('assets/image/contatos.png', width: 200, height: 200),
                const Text(
                  // Exibe o título "Contatos" abaixo da imagem
                  'Contatos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Campo de texto para inserir o nome do contato
                TextField(
                  controller: _nameController, // Liga o campo ao controlador de nome
                  decoration: const InputDecoration(
                    labelText: 'Nome', // Texto de instrução no campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                  ),
                ),
                const SizedBox(height: 20),
                // Campo de texto para inserir o telefone do contato
                TextField(
                  controller: _phoneController, // Liga o campo ao controlador de telefone
                  decoration: const InputDecoration(
                    labelText: 'Telefone', // Texto de instrução no campo
                    border: OutlineInputBorder(), // Borda ao redor do campo
                  ),
                  keyboardType: TextInputType.phone, // Configura o teclado para números de telefone
                ),
                const SizedBox(height: 20),
                // Botão para adicionar o contato e navegar para a página de listagem
                ElevatedButton(
                  onPressed: _navigateToListagemView, // Chama a função ao clicar no botão, 
                  // que é responsável por navegar para a listagemview e adicionar o contato
                  child: const Text('Adicionar Contato'), // Texto exibido no botão
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
