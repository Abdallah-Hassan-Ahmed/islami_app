import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/features/quran/presentation/view/sura_detalis_view.dart';
import 'package:islami_app/features/quran/presentation/widget/shard_prefs.dart';
import 'package:islami_app/features/quran/presentation/widget/sura_widget.dart';

class SureList extends StatelessWidget {
  const SureList({super.key, required this.filterIndex});

  final List<int> filterIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: filterIndex.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            addMostRecently(filterIndex[index]);
            Navigator.pushNamed(
              context,
              SuraDetails.routeName,
              arguments: filterIndex[index],
            );
          },
          child: SuraWidget(num: filterIndex[index]),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.01),
    );
  }
}
