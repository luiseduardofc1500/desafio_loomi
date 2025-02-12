import 'package:cine_loomi/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // O Obx observa as alterações no usuário atual para atualizar o título.
        title: Obx(() {
          final user = AuthController.to.firebaseUser.value;
          if (user != null) {
            return Text("Bem-vindo ${user.displayName ?? user.email}");
          } else {
            return const Text("Bem-vindo");
          }
        }),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              AuthController.to.signOut();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          // Exibe a foto do usuário, se existir.
          Obx(() {
            final user = AuthController.to.firebaseUser.value;
            if (user != null &&
                user.photoURL != null &&
                user.photoURL!.isNotEmpty) {
              return CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              );
            } else {
              // Caso não exista foto, exibe um avatar padrão.
              return const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              );
            }
          }),
          const SizedBox(height: 20),
          // Exibe o nome e o email do usuário
          Obx(() {
            final user = AuthController.to.firebaseUser.value;
            return user != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nome: ${user.displayName ?? 'Sem nome'}\nEmail: ${user.email ?? 'Sem email'}",
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container();
          }),
          const SizedBox(height: 20),
          const Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a todo title',
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ),
          const Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
