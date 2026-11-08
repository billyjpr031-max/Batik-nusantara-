import 'package:flutter/material.dart';

void main() {
  runApp(const BatikNusantaraApp());
}

class BatikColors {
  static const darkBrown = Color(0xFF3B1D0D);
  static const brown = Color(0xFF713B1B);
  static const caramel = Color(0xFFC47A32);
  static const gold = Color(0xFFE8B86D);
  static const cream = Color(0xFFFFF8EF);
  static const grey = Color(0xFF777777);
}

class Batik {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String philosophy;
  final String image;

  const Batik({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.philosophy,
    required this.image,
  });
}

final List<Batik> batikList = [
  Batik(
    id: '1',
    name: 'Batik Kawung',
    origin: 'Yogyakarta',
    description:
        'Batik Kawung merupakan motif tradisional yang memiliki '
        'pola geometris menyerupai buah aren yang disusun secara teratur.',
    philosophy:
        'Motif Kawung melambangkan kesucian, keadilan, '
        'kesederhanaan, dan pengendalian diri.',
    image: 'images/Batik Kawung.jpeg',
  ),
  Batik(
    id: '2',
    name: 'Batik Mega Mendung',
    origin: 'Cirebon',
    description:
        'Batik Mega Mendung merupakan motif khas Cirebon '
        'yang memiliki bentuk menyerupai awan berlapis.',
    philosophy:
        'Motif Mega Mendung melambangkan kesabaran, ketenangan, '
        'dan kemampuan mengendalikan emosi.',
    image: 'images/Batik Mega Mendung.jpeg',
  ),
  Batik(
    id: '3',
    name: 'Batik Sidoluhur',
    origin: 'Surakarta',
    description:
        'Batik Sidoluhur merupakan salah satu motif batik '
        'tradisional yang dikenal dalam budaya Jawa.',
    philosophy:
        'Motif Sidoluhur mengandung harapan agar seseorang '
        'memiliki kehidupan yang baik dan berbudi luhur.',
    image: 'images/Batik Sidoluhur.jpeg',
  ),
  Batik(
    id: '4',
    name: 'Batik Sidomukti',
    origin: 'Surakarta',
    description:
        'Batik Sidomukti merupakan motif batik tradisional '
        'yang sering digunakan dalam acara adat dan pernikahan.',
    philosophy:
        'Motif Sidomukti melambangkan harapan memperoleh '
        'kebahagiaan, kemakmuran, dan kesejahteraan.',
    image: 'images/Batik Sidomukti.jpeg',
  ),
  Batik(
    id: '5',
    name: 'Batik Truntum',
    origin: 'Surakarta',
    description:
        'Batik Truntum memiliki motif berupa bentuk bunga '
        'kecil yang tersusun secara berulang pada kain.',
    philosophy:
        'Motif Truntum melambangkan cinta yang tumbuh kembali, '
        'ketulusan, dan kasih sayang.',
    image: 'images/Batik Truntum.jpeg',
  ),
];

final ValueNotifier<Set<String>> favoriteNotifier =
    ValueNotifier<Set<String>>({});

class BatikNusantaraApp extends StatelessWidget {
  const BatikNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batik Nusantara',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BatikColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BatikColors.brown,
          primary: BatikColors.brown,
          secondary: BatikColors.gold,
        ),
        fontFamily: 'Roboto',
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BatikColors.darkBrown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.local_florist,
              size: 90,
              color: BatikColors.gold,
            ),
            SizedBox(height: 20),
            Text(
              'BATIK NUSANTARA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Warisan Budaya Indonesia',
              style: TextStyle(
                color: BatikColors.gold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 35),
            CircularProgressIndicator(
              color: BatikColors.gold,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan isi username dan password.'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BatikColors.cream,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const Icon(
                Icons.local_florist,
                size: 90,
                color: BatikColors.brown,
              ),
              const SizedBox(height: 15),
              const Text(
                'BATIK NUSANTARA',
                style: TextStyle(
                  color: BatikColors.darkBrown,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Selamat datang kembali!',
                style: TextStyle(color: BatikColors.grey),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: inputDecoration(
                  'Username',
                  Icons.person_outline,
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: inputDecoration(
                  'Password',
                  Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BatikColors.brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(
  String label,
  IconData icon,
) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      icon,
      color: BatikColors.brown,
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
  );
}

class BatikScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const BatikScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BatikColors.cream,
      appBar: AppBar(
        backgroundColor: BatikColors.darkBrown,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavoritePage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: BatikColors.cream,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                20, 55, 20, 25,
              ),
              color: BatikColors.darkBrown,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.local_florist,
                    color: BatikColors.gold,
                    size: 55,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'BATIK NUSANTARA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Warisan Budaya Indonesia',
                    style: TextStyle(
                      color: BatikColors.gold,
                    ),
                  ),
                ],
              ),
            ),
            drawerItem(
              context,
              Icons.home_outlined,
              'Beranda',
              const HomePage(),
            ),
            drawerItem(
              context,
              Icons.explore_outlined,
              'Jelajahi Batik',
              const ExplorePage(),
            ),
            drawerItem(
              context,
              Icons.favorite_border,
              'Favorit',
              const FavoritePage(),
            ),
            drawerItem(
              context,
              Icons.quiz_outlined,
              'Kuis Batik',
              const QuizPage(),
            ),
            drawerItem(
              context,
              Icons.info_outline,
              'Tentang Aplikasi',
              const AboutPage(),
            ),
            drawerItem(
              context,
              Icons.support_agent,
              'Hubungi Admin',
              const WhatsAppPage(),
            ),
            const Spacer(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Batik Nusantara © 2026',
                style: TextStyle(
                  color: BatikColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }

  Widget drawerItem(
    BuildContext context,
    IconData icon,
    String text,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: BatikColors.brown,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: BatikColors.darkBrown,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        if (page is HomePage) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
            (route) => route.isFirst,
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Beranda',
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BatikColors.cream,
        child: Stack(
          children: [
            Positioned(
              top: -45,
              right: -65,
              child: CustomPaint(
                size: const Size(230, 230),
                painter: BatikDecorationPainter(),
              ),
            ),
            Positioned(
              bottom: -65,
              left: -75,
              child: Transform.rotate(
                angle: 3.14,
                child: CustomPaint(
                  size: const Size(270, 270),
                  painter: BatikDecorationPainter(),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_florist,
                        size: 100,
                        color: BatikColors.brown,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Selamat Datang di\nBatik Nusantara',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: BatikColors.darkBrown,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Aplikasi edukasi untuk mengenal keindahan, '
                        'sejarah, dan filosofi batik Indonesia.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF555555),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 55),
                      SizedBox(
                        width: 320,
                        height: 68,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ExplorePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BatikColors.brown,
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.explore_outlined,
                                size: 30,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Jelajahi Batik',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatikDecorationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8C69F).withOpacity(0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    for (int i = 0; i < 8; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * 3.14159 / 4);

      final path = Path()
        ..moveTo(0, 0)
        ..quadraticBezierTo(
          -35,
          -35,
          0,
          -size.height / 2,
        )
        ..quadraticBezierTo(
          35,
          -35,
          0,
          0,
        );

      canvas.drawPath(path, paint);
      canvas.restore();
    }

    canvas.drawCircle(center, 18, paint);
    canvas.drawCircle(center, 35, paint);
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final searchController = TextEditingController();
  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = batikList.where((batik) {
      return batik.name.toLowerCase().contains(
            searchText.toLowerCase(),
          ) ||
          batik.origin.toLowerCase().contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return BatikScaffold(
      title: 'Jelajahi Batik',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Motif Batik Nusantara',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: BatikColors.darkBrown,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Kenali berbagai motif batik Indonesia.',
                  style: TextStyle(
                    color: BatikColors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari nama atau asal batik...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: BatikColors.brown,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredList.isEmpty
                ? const Center(
                    child: Text(
                      'Motif batik tidak ditemukan.',
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final batik = filteredList[index];

                      return BatikCard(
                        batik: batik,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(
                                batik: batik,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class BatikCard extends StatelessWidget {
  final Batik batik;
  final VoidCallback onTap;

  const BatikCard({
    super.key,
    required this.batik,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  batik.image,
                  width: 115,
                  height: 115,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 115,
                      height: 115,
                      color: BatikColors.cream,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: BatikColors.brown,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      batik.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: BatikColors.darkBrown,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: BatikColors.caramel,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(batik.origin),
                      ],
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Lihat Detail →',
                      style: TextStyle(
                        color: BatikColors.caramel,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Batik batik;

  const DetailPage({
    super.key,
    required this.batik,
  });

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Detail Batik',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              batik.image,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 260,
                  color: BatikColors.cream,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    batik.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: BatikColors.darkBrown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: BatikColors.caramel,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        batik.origin,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Tentang Motif',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: BatikColors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    batik.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Filosofi dan Makna',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: BatikColors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    batik.philosophy,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WhatsAppPage(
                              initialMessage:
                                  'Saya ingin bertanya tentang '
                                  '${batik.name}.',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.support_agent),
                      label: const Text('Hubungi Admin'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: BatikColors.brown,
                        side: const BorderSide(
                          color: BatikColors.brown,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: favoriteNotifier,
                      builder: (context, favorites, child) {
                        final isFavorite =
                            favorites.contains(batik.id);

                        return ElevatedButton.icon(
                          onPressed: () {
                            final updated =
                                Set<String>.from(
                              favoriteNotifier.value,
                            );

                            if (isFavorite) {
                              updated.remove(batik.id);
                            } else {
                              updated.add(batik.id);
                            }

                            favoriteNotifier.value = updated;
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          label: Text(
                            isFavorite
                                ? 'Hapus dari Favorit'
                                : 'Tambah ke Favorit',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BatikColors.brown,
                            foregroundColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Favorit',
      body: ValueListenableBuilder<Set<String>>(
        valueListenable: favoriteNotifier,
        builder: (context, favorites, child) {
          final favoriteList = batikList
              .where((batik) => favorites.contains(batik.id))
              .toList();

          if (favoriteList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 75,
                    color: BatikColors.caramel,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Belum ada batik favorit.',
                    style: TextStyle(
                      color: BatikColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final batik = favoriteList[index];

              return BatikCard(
                batik: batik,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        batik: batik,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Batik Mega Mendung berasal dari daerah mana?',
      'options': [
        'Yogyakarta',
        'Cirebon',
        'Pekalongan',
        'Solo',
      ],
      'answer': 'Cirebon',
    },
    {
      'question': 'Motif Parang melambangkan apa?',
      'options': [
        'Kesuburan',
        'Kekayaan',
        'Semangat pantang menyerah',
        'Ketenangan',
      ],
      'answer': 'Semangat pantang menyerah',
    },
    {
      'question': 'Batik Kawung memiliki bentuk menyerupai apa?',
      'options': [
        'Buah aren',
        'Bunga mawar',
        'Awan',
        'Daun',
      ],
      'answer': 'Buah aren',
    },
    {
      'question': 'Motif Truntum melambangkan apa?',
      'options': [
        'Keberanian',
        'Kasih sayang',
        'Kekuatan',
        'Kesederhanaan',
      ],
      'answer': 'Kasih sayang',
    },
  ];

  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  bool finished = false;
  String? selectedAnswer;

  void selectAnswer(String answer) {
    if (answered) return;

    setState(() {
      selectedAnswer = answer;
      answered = true;

      if (answer == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        answered = false;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        finished = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      answered = false;
      finished = false;
      selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Kuis Batik',
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: finished
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.emoji_events,
                      size: 90,
                      color: BatikColors.gold,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Kuis Selesai!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: BatikColors.darkBrown,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Skor kamu: $score dari ${questions.length}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: restartQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BatikColors.brown,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Ulangi Kuis'),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pertanyaan ${currentQuestion + 1} '
                    'dari ${questions.length}',
                    style: const TextStyle(
                      color: BatikColors.caramel,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    value:
                        (currentQuestion + 1) / questions.length,
                    color: BatikColors.brown,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    questions[currentQuestion]['question'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: BatikColors.darkBrown,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ...List<String>.from(
                    questions[currentQuestion]['options'],
                  ).map((option) {
                    final correct =
                        questions[currentQuestion]['answer'] ==
                            option;

                    Color background = Colors.white;

                    if (answered && correct) {
                      background = Colors.green.shade100;
                    } else if (answered &&
                        selectedAnswer == option &&
                        !correct) {
                      background = Colors.red.shade100;
                    }

                    return Card(
                      color: background,
                      child: ListTile(
                        title: Text(option),
                        onTap: () => selectAnswer(option),
                      ),
                    );
                  }),
                  const Spacer(),
                  if (answered)
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BatikColors.brown,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          currentQuestion == questions.length - 1
                              ? 'Lihat Hasil'
                              : 'Pertanyaan Selanjutnya',
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Tentang Aplikasi',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Icon(
              Icons.local_florist,
              size: 100,
              color: BatikColors.brown,
            ),
            const SizedBox(height: 20),
            const Text(
              'Batik Nusantara',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: BatikColors.darkBrown,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Batik Nusantara merupakan aplikasi edukasi '
              'yang bertujuan memperkenalkan kekayaan batik '
              'Indonesia kepada masyarakat.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Melalui aplikasi ini, pengguna dapat mengenal '
              'berbagai motif batik, daerah asal, sejarah, '
              'serta filosofi yang terkandung di dalamnya.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Mari lestarikan budaya Indonesia!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: BatikColors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WhatsAppPage extends StatefulWidget {
  final String initialMessage;

  const WhatsAppPage({
    super.key,
    this.initialMessage = '',
  });

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> {
  final nameController = TextEditingController();
  final messageController = TextEditingController();

  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    messageController.text = widget.initialMessage;
  }

  @override
  void dispose() {
    nameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (nameController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama dan pesan harus diisi terlebih dahulu.',
          ),
        ),
      );
      return;
    }

    setState(() {
      isSuccess = true;
    });
  }

  void createNewOrder() {
    nameController.clear();
    messageController.clear();

    setState(() {
      isSuccess = false;
    });
  }

  Widget successView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 95,
              height: 95,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'PESANAN BERHASIL',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: BatikColors.darkBrown,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Baik, laporan/pesanan Anda sedang diproses.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Nama: ${nameController.text}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: BatikColors.brown,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: createNewOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: BatikColors.brown,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Buat Pesanan Baru'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Kembali',
                style: TextStyle(
                  color: BatikColors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BatikScaffold(
      title: 'Hubungi Admin',
      body: isSuccess
          ? successView()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.support_agent,
                    size: 75,
                    color: BatikColors.brown,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Hubungi Admin',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: BatikColors.darkBrown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Silakan isi formulir berikut untuk '
                    'menyampaikan pertanyaan, laporan, atau pesanan.',
                    style: TextStyle(
                      fontSize: 15,
                      color: BatikColors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: nameController,
                    decoration: inputDecoration(
                      'Nama Lengkap',
                      Icons.person_outline,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: messageController,
                    maxLines: 5,
                    decoration: inputDecoration(
                      'Pesan atau Pesanan',
                      Icons.message_outlined,
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: sendMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BatikColors.brown,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Kirim Pesan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: BatikColors.brown,
                      ),
                      child: const Text('Kembali'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}