import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key, required this.name, required this.description});
  final String? name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2),
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
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                AppImages.person,
                width: 130,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 2.0),
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
