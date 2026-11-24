import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stage_up/core/theme/app_colors.dart';
import 'package:stage_up/core/theme/app_size.dart';
import 'package:stage_up/core/theme/app_spacing.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      required this.event,
      required this.onFavoritePressed,
      this.eventFavoriteIcon = false});

  final Event event;
  final bool eventFavoriteIcon;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final dates = event.dates..sort();
    final firstDate = dates.first;
    final sameMonthAndYear = dates.every(
      (date) => date.month == firstDate.month && date.year == firstDate.year,
    );

    final String formattedDate;
    if (event.isPostponed) {
      formattedDate = 'Data a ser definida';
    } else if (dates.length == 1) {
      formattedDate = DateFormat('dd/MM/yyyy').format(firstDate);
    } else if (sameMonthAndYear) {
      final days = dates.map((date) => date.day).toList();
      final previousDays = days.take(days.length - 1).join(', ');
      final monthAndYear = DateFormat('MM/yyyy').format(firstDate);

      formattedDate = '$previousDays e ${days.last}/$monthAndYear';
    } else {
      formattedDate = dates.map(DateFormat('dd/MM/yyyy').format).join(' · ');
    }
    return Container(
      height: AppSize.cardEventHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.m),
          color: AppColors.surface),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppSize.cardImagemEvent,
              height: AppSize.cardImagemEvent,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.m),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: event.imagemUrl.startsWith('assets/')
                        ? AssetImage(event.imagemUrl)
                        : NetworkImage(event.imagemUrl),
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
                          color: const Color(0xFFFF0000),
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
            SizedBox(width: AppSpacing.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(event.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(event.description,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppSpacing.s),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: AppSize.iconSmall,
                          color: AppColors.textSecondary),
                      SizedBox(width: AppSpacing.s),
                      Text(formattedDate,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: AppSize.iconSmall,
                          color: AppColors.textSecondary),
                      SizedBox(width: AppSpacing.s),
                      Expanded(
                        child: Text(event.location,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onFavoritePressed,
              icon: Icon(
                eventFavoriteIcon ? Icons.favorite : Icons.favorite_border,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
