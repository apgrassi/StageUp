import 'package:flutter/material.dart';
import 'package:stage_up/core/theme/app_spacing.dart';

class ExploreEmptyState extends StatelessWidget {
  final VoidCallback onClearFilters;

  const ExploreEmptyState({super.key, required this.onClearFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nenhum evento encontrado',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: AppSpacing.s),
          Text(
            'Não encontramos shows para o filtro selecionado.\n Que tal explorar outro estilo ?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.l),
          ElevatedButton(
            onPressed: onClearFilters,
            child: const Text('Limpar filtros'),
          ),
        ],
      ),
    ));
  }
}
