import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/review.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();
  int performance = 0;
  int proceeding = 0;
  int script = 0;
  int rating = 0;

  void _saveReview() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box<Review>('reviews');
      final review = Review(
        movieTitle: _nameController.text.trim(),
        reviewerName: 'user',
        details: _detailController.text.trim(),
        performance: performance,
        proceeding: proceeding,
        script: script,
        rating: rating,
      );
      await box.add(review);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline, size: 60, color: Colors.black),
              const SizedBox(height: 12),
              const Text("SUCCESS", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // close dialog
                  Navigator.popUntil(context, ModalRoute.withName('/reviews'));
                },
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                      const Text("Write Your Review", style: TextStyle(fontSize: 20, color: Colors.white)),
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.png"),
                        radius: 20,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกชื่อหนัง' : null,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _detailController,
                  validator: (value) => value == null || value.length < 10 ? 'กรอกรายละเอียดอย่างน้อย 10 ตัวอักษร' : null,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Details',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(height: 24),
                _buildStarRating("Performance", (val) => setState(() => performance = val), performance),
                _buildStarRating("Proceeding", (val) => setState(() => proceeding = val), proceeding),
                _buildStarRating("Script", (val) => setState(() => script = val), script),
                _buildStarRating("Rating", (val) => setState(() => rating = val), rating),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("SAVE", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(String label, Function(int) onRate, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Row(
            children: List.generate(5, (index) => IconButton(
              icon: Icon(
                index < value ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () => onRate(index + 1),
              iconSize: 28,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )),
          ),
        ],
      ),
    );
  }
}