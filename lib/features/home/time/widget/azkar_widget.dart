import 'package:flutter/material.dart';
import 'package:islami_app/features/home/time/widget/azkar_details_view.dart';

class AzkarCard extends StatelessWidget {
  final String title;
  final String apiKey;
  final Image image;

  const AzkarCard({super.key, required this.title, required this.apiKey, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AzkarDetailsView(
              categoryKey: apiKey, 
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amber, width: 1.2),
        ),
        child: Column(
          children: [
            image,
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
