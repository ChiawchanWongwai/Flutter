import 'package:flutter/material.dart';

class ReviewSuccessDialog extends StatelessWidget {
  final VoidCallback onClose;

  const ReviewSuccessDialog({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline, size: 60, color: Colors.black),
          const SizedBox(height: 12),
          const Text("SUCCESS", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}