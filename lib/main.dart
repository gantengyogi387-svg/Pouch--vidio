import 'package:flutter/material.dart';

void main() {
  runApp(const PouchVidioApp());
}

class PouchVidioApp extends StatelessWidget {
  const PouchVidioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pouch Vidio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> categories = ['Semua', 'Trending', 'Komedi', 'Musik', 'Gaming', 'Kuliner', 'Vlog'];
  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Konten Utama (Mirip Reels/TikTok)
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Stack(
                fit: Stack.expand,
                children: [
                  Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'Video Pendek Pouch Vidio #${index + 1}\nKategori: $selectedCategory',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  // Informasi Akun & Caption di Kiri Bawah
                  Positioned(
                    bottom: 80,
                    left: 16,
                    right: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '@kreator_pouch',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Keseruan hari ini di Pouch Vidio! Jangan lupa like dan ikuti ya kawan-kawan. #PouchVidio #${selectedCategory.toLowerCase()}',
                          style: const TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  // Tombol Aksi Interaksi di Kanan
                  Positioned(
                    bottom: 80,
                    right: 16,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red, size: 36),
                          onPressed: () {},
                        ),
                        const Text('12.4K', style: TextStyle(fontSize: 12, color: Colors.white)),
                        const SizedBox(height: 16),
                        IconButton(
                          icon: const Icon(Icons.comment, color: Colors.white, size: 34),
                          onPressed: () {},
                        ),
                        const Text('342', style: TextStyle(fontSize: 12, color: Colors.white)),
                        const SizedBox(height: 16),
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.white, size: 34),
                          onPressed: () {},
                        ),
                        const Text('Bagikan', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Banner Atas & Filter Kategori
          SafeArea(
            child: Column(
              children: [
                // Header / Banner Judul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '🔥 Pouch Vidio',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent),
                      ),
                      IconButton(
                        icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
                        onPressed: () {
                          // Aksi Login Google / Profil
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Fitur Login Google / Profil ditekan')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Filter Kategori Horisontal
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = cat == selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          selectedColor: Colors.red,
                          backgroundColor: Colors.grey[850],
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          },
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
      // Navigasi Bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: 'Trending'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box, size: 36), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
