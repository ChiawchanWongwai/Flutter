import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildMovieCard({
    required String imagePath,
    required String title,
    required String year,
    required List<String> genres,
    required String time,
    required String rating,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(year),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: genres.map((g) => Chip(label: Text(g))).toList(),
            ),
            const SizedBox(height: 8),
            Text("TIME: $time"),
            const SizedBox(height: 4),
            Text("RATING : $rating", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "WATCHTHIS",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(210, 0, 0, 0), Color.fromARGB(255, 58, 57, 57)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                const SizedBox(height: 20),

                // Movie 1
                buildMovieCard(
                  imagePath: 'assets/images/endgame.jpg',
                  title: 'Avengers Endgame',
                  year: '2019',
                  genres: ['Action', 'Superhero', 'Sci-Fi'],
                  time: '3h 1m',
                  rating: '4.8/5',
                ),

                // Movie 2
                buildMovieCard(
                  imagePath: 'assets/images/friendzone.jpg',
                  title: 'Friend Zone',
                  year: '2019',
                  genres: ['Comedy', 'Romance'],
                  time: '1h 58m',
                  rating: '4.9/5',
                ),

                const SizedBox(height: 4),

                // View more
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/movies'),
                    child: const Text(
                      "View more",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/reviews'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Review", style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/review-summary'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Movie reviews", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}