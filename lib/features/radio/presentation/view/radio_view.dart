import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../manager/radio_provider.dart';
import '../widget/radio_content_widget.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RadioModelProvider()..getRadio(),
      child: Consumer<RadioModelProvider>(
        builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadioContent(),
          );
        },
      ),
    );
  }
}
