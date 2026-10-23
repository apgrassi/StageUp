import 'package:flutter/material.dart';
import 'package:stage_up/core/theme/app_colors.dart';
import 'package:stage_up/core/theme/app_spacing.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';

class TrendingEventCard extends StatelessWidget {
  final Event event;

  const TrendingEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.s),
            child: SizedBox(
              width: double.infinity,
              height: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    event.imagemUrl,
                    fit: BoxFit.cover,
                  ),
                  if (event.isPostponed)
                    Positioned(
                      top: 12,
                      right: -26,
                      child: Transform.rotate(
                        angle: 0.785398,
                        child: Container(
                          width: 110,
                          color: AppColors.error,
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: const Text(
                            'ADIADO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14),
                    SizedBox(width: AppSpacing.s),
                    Text(
                      event.isPostponed
                          ? 'Data a ser definida'
                          : '${event.date.day}/${event.date.month}/${event.date.year}',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14),
                    SizedBox(width: AppSpacing.s),
                    Expanded(
                      child: Text(
                        event.location,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
