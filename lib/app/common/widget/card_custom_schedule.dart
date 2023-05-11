import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.clientName,
    required this.serviceName,
    required this.date,
    required this.time,
  });

  final String clientName;
  final String date;
  final String serviceName;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: const BoxDecoration(color: AppColors.darkGrey),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          leading: Container(
            padding: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1, color: AppColors.iceWhite)),
            ),
            child: const Icon(Icons.person, color: AppColors.iceWhite),
          ),
          title: Text(clientName,
              style:
                  AppTextStyles.mediumText18.apply(color: AppColors.iceWhite)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5),
              Text(
                serviceName,
                style: AppTextStyles.smallText.apply(color: AppColors.iceWhite),
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const Icon(Icons.calendar_today,
                      color: AppColors.iceWhite, size: 16),
                  const SizedBox(width: 5),
                  Text(date,
                      style: AppTextStyles.smallText
                          .apply(color: AppColors.iceWhite)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const Icon(Icons.access_time, color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text(time,
                      style: AppTextStyles.smallText
                          .apply(color: AppColors.iceWhite)),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
