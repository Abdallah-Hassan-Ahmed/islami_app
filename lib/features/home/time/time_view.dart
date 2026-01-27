import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/features/home/time/widget/list_azkar.dart';
import 'package:islami_app/features/home/time/widget/time_widget.dart';

class TimeView extends StatelessWidget {
  TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.height * 0.015),
      child: Column(
        children:  [TimeWidget(), SizedBox(height: 12), AzkarList()],
      ),
    );
  }
}
