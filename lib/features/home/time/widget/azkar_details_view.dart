import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/core/providers/azkar_provider.dart';

class AzkarDetailsView extends StatelessWidget {
  static const String routeName = 'azkaDetails';
  final String categoryKey;

  const AzkarDetailsView({super.key, required this.categoryKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.goldColor,
        centerTitle: true,
        title: Text(categoryKey, style: AppStyle.bold20Black),
      ),
      body: Consumer<AzkarProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.goldColor),
            );
          }

          final azkar = provider
              .getAzkarByCategory(categoryKey)
              .where(
                (z) =>
                    z.content.trim().toLowerCase() != 'stop' &&
                    z.count.trim().toLowerCase() != 'stop',
              )
              .toList();

          if (azkar.isEmpty) {
            return Center(
              child: Text('لا يوجد أذكار', style: AppStyle.bold20Black),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: azkar.length,
            itemBuilder: (context, index) {
              final z = azkar[index];

              return Card(
                color: AppColors.blackColor,
                margin: const EdgeInsets.only(bottom: 12),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: AppColors.goldColor, width: 1.2),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        z.content,
                        textAlign: TextAlign.right,
                        style: AppStyle.bold16WhiteJN,
                      ),

                      SizedBox(height: context.width * 0.04),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.goldColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '× ${z.count}',
                              style: AppStyle.bold12Black.copyWith(
                                color: AppColors.goldColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (z.description.isNotEmpty) ...[
                        SizedBox(height: context.width * 0.03),
                        Text(
                          z.description,
                          textAlign: TextAlign.right,
                          style: AppStyle.bold12Black.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
