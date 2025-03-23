import 'package:hive/hive.dart';

part 'review.g.dart';

@HiveType(typeId: 0)
class Review extends HiveObject {
  @HiveField(0)
  final String movieTitle;

  @HiveField(1)
  final String reviewerName;

  @HiveField(2)
  final String details;

  @HiveField(3)
  final int performance;

  @HiveField(4)
  final int proceeding;

  @HiveField(5)
  final int script;

  @HiveField(6)
  final int rating;

  Review({
    required this.movieTitle,
    required this.reviewerName,
    required this.details,
    required this.performance,
    required this.proceeding,
    required this.script,
    required this.rating,
  });
}