import 'package:hive/hive.dart';

part "movie_model.g.dart";

@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String imagePath;

  Movie({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}