import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/review.dart';
import 'models/movie_model.dart';
import 'screens/home_screen.dart';
import 'screens/movie_list_screen.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/review_list_screen.dart';
import 'screens/review_detail_screen.dart';
import 'screens/write_review_screen.dart';
import 'screens/review_summary_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ReviewAdapter());
  Hive.registerAdapter(MovieAdapter());

  final reviewBox = await Hive.openBox<Review>('reviews');
  final movieBox = await Hive.openBox<Movie>('movies');

  // Add sample reviews if reviewBox is empty
  if (reviewBox.isEmpty) {
    final sampleReviews = [
      Review(
        movieTitle: 'Avengers Endgame',
        reviewerName: 'Admin',
        details: 'สุดยอดการปิดฉาก MCU Phase 3',
        performance: 5,
        proceeding: 4,
        script: 5,
        rating: 5,
      ),
      Review(
        movieTitle: 'Harry Potter',
        reviewerName: 'Admin',
        details: 'โลกเวทมนตร์สุดอลังการที่ทุกคนควรดู',
        performance: 5,
        proceeding: 4,
        script: 4,
        rating: 5,
      ),
    ];
    await reviewBox.addAll(sampleReviews);
  }

  // Add sample movies if movieBox is empty
  if (movieBox.isEmpty) {
    final sampleMovies = [
      Movie(
        title: 'Avengers Endgame',
        description: 'มหากาพย์การต่อสู้ครั้งสุดท้ายของเหล่า Avengers ที่รวมพลังกันกู้จักรวาลจาก Thanos',
        imagePath: 'assets/images/avengersendgame.jpg',
      ),
      Movie(
        title: 'Harry Potter',
        description: 'เรื่องราวของเด็กชายผู้มีแผลเป็นรูปสายฟ้า ที่ค้นพบว่าเขาคือพ่อมดและเข้าเรียนที่ฮอกวอตส์',
        imagePath: 'assets/images/harrypotter.jpg',
      ),
      Movie(
        title: 'Parasite',
        description: 'หนังเสียดสีสังคมว่าด้วยครอบครัวชนชั้นล่างที่เข้าไปพึ่งพาครอบครัวคนรวยอย่างแนบเนียน',
        imagePath: 'assets/images/parasite.jpg',
      ),
      Movie(
        title: 'Friend Zone',
        description: 'เพื่อนที่ไม่กล้าข้ามเส้นความสัมพันธ์ จะอยู่หรือจะไปแบบไหนคือคำตอบ?',
        imagePath: 'assets/images/friendzone.jpg',
      ),
      Movie(
        title: 'Interstellar',
        description: 'มหากาพย์การเดินทางข้ามจักรวาล เพื่อช่วยเหลือมนุษยชาติจากวิกฤติสิ่งแวดล้อมโลก',
        imagePath: 'assets/images/interstellar.jpg',
      ),
    ];
    await movieBox.addAll(sampleMovies);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WatchThis',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/movies': (context) => const MovieListScreen(),
        '/movie-detail': (context) => const MovieDetailScreen(),
        '/reviews': (context) => const ReviewListScreen(),
        '/review-detail': (context) => const ReviewDetailScreen(),
        '/write-review': (context) => const WriteReviewScreen(),
        '/review-summary': (context) => const ReviewSummaryScreen(),
      },
    );
  }
}