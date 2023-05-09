import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SalonService {
  SalonService({
    required this.name,
    required this.description,
    required this.price,
  });
  final String name;
  final String description;
  final double price;
}

class SalonServiceCard extends StatelessWidget {
  final SalonService service;

  const SalonServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColors.pinkLogo,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.name,
              style: AppTextStyles.mediumText18,
            ),
            const SizedBox(height: 6),
            Text(
              service.description,
              style: AppTextStyles.inputText.copyWith(
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Preço: R\$ ${service.price.toStringAsFixed(2)}',
              style: AppTextStyles.mediumText16,
            ),
          ],
        ),
      ),
    );
  }
}
