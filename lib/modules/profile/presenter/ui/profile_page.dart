import 'package:flutter/material.dart';
import 'package:stage_up/core/theme/app_colors.dart';
import 'package:stage_up/core/theme/app_spacing.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onExplore;

  const ProfilePage({super.key, required this.onExplore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: AppColors.primary,
              ),
              Text('Entre na sua conta',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.m),
              Text('Acesse seu perfil e acompanhe seus eventos favoritos.'),
              const SizedBox(height: AppSpacing.l),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Entrar'),
              ),
              TextButton(
                onPressed: onExplore,
                child: const Text('Explorar Shows',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
