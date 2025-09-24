import 'package:depi_task/utils/app_colors.dart';
import 'package:depi_task/utils/app_images.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.name,
    required this.description,
  });
  final String? name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.0),
              child: Image.asset(AppImages.person, width: 150),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'no name',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description ?? 'no description',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
