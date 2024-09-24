import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../domain/interactor/auth_interactor.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                appName,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton.icon(
                onPressed: AuthInteractor.instance.signInWithGoogle,
                icon: const Icon(Icons.login),
                label: const Text('Sign in with Google'),
              ),
            )
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Copyright (c) 2024 Timur Zhdikhanov'),
            ),
          ),
        ),
      );
}
