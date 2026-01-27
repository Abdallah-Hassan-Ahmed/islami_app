import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/features/radio/presentation/manager/radio_provider.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/radio/presentation/widget/radio_contanier_widget.dart';
import 'package:provider/provider.dart';

class RadioContent extends StatelessWidget {
  const RadioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioModelProvider>(
      builder: (context, value, child) {
        // Loading
        if (value.isLoading) {
          return  Center(child: CircularProgressIndicator( color: AppColors.goldColor,));
        }

        // Error
        if (value.errorMessage != null) {
          return Center(child: Text(value.errorMessage! , style:AppStyle.bold20White ,));
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: value.radios.length,
          itemBuilder: (context, index) =>
              RadioContainer(radio: value.radios[index], index: index),
          separatorBuilder: (context, index) =>
              SizedBox(height: context.height * 0.02),
        );
      },
    );
  }
}
