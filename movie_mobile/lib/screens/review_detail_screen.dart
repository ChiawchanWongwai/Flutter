import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/review.dart';

class ReviewDetailScreen extends StatelessWidget {
  const ReviewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieTitle = ModalRoute.of(context)!.settings.arguments as String;
    final reviews = Hive.box<Review>('reviews')
        .values
        .where((r) => r.movieTitle == movieTitle)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1F2C39), Colors.black87],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Reviews", style: TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(width: 32),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        movieTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      if (review.details.isNotEmpty)
                        Text("รายละเอียด : ${review.details}"),
                      const SizedBox(height: 12),
                      buildRating("Performance", review.performance),
                      buildRating("Proceeding", review.proceeding),
                      buildRating("Script", review.script),
                      buildRating("Rating", review.rating),
                      const Divider(height: 40),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/movie-detail', arguments: movieTitle),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text("MOVIE", style: TextStyle(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRating(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: List.generate(5, (index) => Icon(
            index < value ? Icons.star : Icons.star_border,
            color: Colors.amber,
          )),
        ),
      ],
    );
  }
}