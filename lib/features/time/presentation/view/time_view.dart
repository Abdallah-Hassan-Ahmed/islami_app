import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/features/time/presentation/widget/list_azkar.dart';
import 'package:islami_app/features/time/presentation/widget/time_widget.dart';

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
