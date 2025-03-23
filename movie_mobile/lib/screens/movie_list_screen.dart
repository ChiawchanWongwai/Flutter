import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  String query = '';

  final List<Map<String, String>> movies = const [
    {
      "title": "Harry Potter",
      "image": "assets/images/harry.jpg",
      "description":
          "แฮร์รี่อาศัยอยู่กับบ้านลุงกับป้าและลูกพี่ลูกน้องของ เขามาเป็นเวลา 10 ปี วันหนึ่งได้เกิดเหตุการณ์ประหลาด เกิดขึ้นกับเขา เขาเผลอปล่อยงูใส่ลูกพี่ลูกน้องขณะไป เที่ยวสวนสัตว์ หลังจากนั้นเขาได้รับจดหมายฉบับหนึ่ง แต่ลูกกับป้าเห็นเข้าเลยเอาไปทำลาย แต่จดหมายก็ถูก ส่งมาเรี่อยๆ จนพวกเขาต้องย้ายไปอยู่ในกระท่อม กลางเกาะ ในคืนวันเกิดแฮร์รี่"
    },
    {
      "title": "Avengers Endgame",
      "image": "assets/images/Endgame_poster.jpg",
      "description":
          "หนัง Avengers Endgame หรือชื่อไทยว่า อเวนเจอร์ส เผด็จศึก Avengers: ENDGAME เรื่องราวการปิด จักรวาลมาร์เวลเฟส 3 เหตุการณ์ภายหลังจากที่ธานอส ดีดนิ้วล้างครึ่งจักรวาล เหล่าฮีโร่ที่เหลือรอดจะหาทาง กอบกู้จักรวาลนี้คืนมาได้อย่างไรโดยในภาคนี้จะมีตัวเด็ดอย่าง กัปตันมาร์เวลมาร่วมเสริมทัพด้วย"
    },
    {
      "title": "Friend Zone",
      "image": "assets/images/friendzone.jpg",
      "description":
          "FRIEND ZONE ระวัง..สิ้นสุดทางเพื่อน คำเตือน! ที่เพื่อนทุกคนพึงระวัง เขตกักกันความสัมพันธ์ ที่ห้ามรักกันเกินกว่าเพื่อน บนโลกใบนี้ คงมีชายหญิงอีกหลายคู่ที่กำลังไต่อยู่บนตะเข็บชายแดนแห่งความสัมพันธ์ของความเป็น “เพื่อน” กับ “แฟน” ซึ่งพื้นที่เล็กๆริมชายแดนตรงนี้มีชื่อเรียกแบบสากลว่า FRIEND ZONE"
    },
    {
      "title": "Parasite",
      "image": "assets/images/endgame.jpg",
      "description":
          "เป็นภาพยนตร์ตลกร้ายที่ว่าด้วยเรื่องราวเกี่ยวกับครอบครัวฐานะยากจนในมหานครโซลที่พ่อและแม่ ไม่มีงานทำลูกชายคนโตให้น้องสาว ช่วยปลอมตัวตนเพื่อ สวมรอยเป็นนักเรียนนอก โดยหวังจะได้งานติวหนังสือ ให้กับลูกสาวของเศรษฐีและภรรยาจนเป็นเหตุให้ทั้งสอง ครอบครัวที่ฐานะแตกต่างกันสุดขั้วนี้ต้องมาเกี่ยวพันกัน  ในเหตุการณ์อลวนเกินคาดเดา"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) =>
      movie['title']!.toLowerCase().contains(query.toLowerCase())
    ).toList();

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
                  const Text("Movies", style: TextStyle(fontSize: 20, color: Colors.white)),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo.png"),
                    radius: 20,
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                onChanged: (value) => setState(() => query = value),
                decoration: InputDecoration(
                  hintText: 'Search movie...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),

            // Movie List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/movie-detail',
                          arguments: movie,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                movie['image']!,
                                width: 100,
                                height: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 60),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie['title']!,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    movie['description']!,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}