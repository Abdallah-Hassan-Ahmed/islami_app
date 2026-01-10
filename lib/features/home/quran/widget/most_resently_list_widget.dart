import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/features/home/quran/widget/sura_container_widget.dart';

class MostRecentlyList extends StatelessWidget {
  const MostRecentlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SuraContainer();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: context.width * 0.023);
        },
        itemCount: 10,
      ),
    );
  }
}
