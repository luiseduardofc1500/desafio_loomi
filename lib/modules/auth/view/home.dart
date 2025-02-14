import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/profile/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: user == null
          ? const Center(child: Text('Nenhum usuário logado'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Avatar(
                    radius: 60,
                  ),
                  const SizedBox(height: 16),

                  // Display Name (se existir)
                  if (user.displayName != null)
                    Text(
                      user.displayName!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  const SizedBox(height: 8),

                  // Email (se existir)
                  if (user.email != null)
                    Text(
                      user.email!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/home/profile');
                    },
                    child: const Text('Ir para SignUp Complete'),
                  ),
                ],
              ),
            ),
    );
  }
}
