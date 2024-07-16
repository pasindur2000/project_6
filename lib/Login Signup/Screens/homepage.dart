import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Item {
  final String imageUrl;
  final String title;
  final String subtitle;

  Item({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

List<Item> items = [
  Item(
    imageUrl: 'assets/images/chair.png',
    title: 'Item 1',
    subtitle: 'Category 1',
  ),
  Item(
    imageUrl: 'assets/images/ch2.png',
    title: 'Item 2',
    subtitle: 'Category 2',
  ),
  Item(
    imageUrl: 'assets/images/ch3.png',
    title: 'Item 3',
    subtitle: 'Category 3',
  ),
  Item(
    imageUrl: 'assets/images/ch4.png',
    title: 'Item 4',
    subtitle: 'Category 4',
  ),
  Item(
    imageUrl: 'assets/images/chh5.png',
    title: 'Item 5',
    subtitle: 'Category 5',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login screen or show a message
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      // Handle error
      print('Sign out error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: Colors.black54.withOpacity(.6)),
                  Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.black54.withOpacity(.5)),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFE49B0F).withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Category List
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryChip('All', 0),
                  categoryChip('Category 1', 1),
                  categoryChip('Category 2', 2),
                  categoryChip('Category 3', 3),
                ],
              ),
            ),
            // Featured Items
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle item tap
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: item.imageUrl.startsWith('http')
                                ? Image.network(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              color: Color(0xFFE49B0F).withOpacity(.8),
                              colorBlendMode: BlendMode.darken,
                            )
                                : Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              color: Color(0xFFE49B0F).withOpacity(.1),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.subtitle,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Detailed Items
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Text(
                'Detailed Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE49B0F).withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80.0,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFE49B0F).withOpacity(.8),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 80.0,
                                child: item.imageUrl.startsWith('http')
                                    ? Image.network(item.imageUrl)
                                    : Image.asset(item.imageUrl),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.subtitle),
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget categoryChip(String label, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: selectedIndex == index
                ? FontWeight.bold
                : FontWeight.w300,
            color: selectedIndex == index
                ? Color(0xFFE49B0F)
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
