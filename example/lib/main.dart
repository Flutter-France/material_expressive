import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_expressive/material_expressive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    return MaterialApp(
      title: 'Material 3 Expressive Demo',
      theme: ThemeData(
        extensions: [M3ETheme()],
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Material 3 Expressive Buttons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  bool hideBottomNavBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      bottomNavigationBar: AnimatedSlide(
        offset: hideBottomNavBar ? const Offset(0, 1) : Offset.zero,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == currentIndex) return;
            setState(() => currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Mail'),
            BottomNavigationBarItem(
              icon: Icon(Icons.alternate_email),
              label: 'Friends',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Video'),
          ],
        ),
      ),
      body: switch (currentIndex) {
        0 => _PageContent(
          key: Key('page_0'),
          fabLabel: 'Compose',
          icon: Icons.edit,
          onScroll: handleOnScroll,
        ),
        1 => _PageContent(
          key: Key('page_1'),
          fabLabel: 'Add Friend',
          icon: Icons.person_add,
          onScroll: handleOnScroll,
        ),
        2 => _PageContent(
          key: Key('page_2'),
          fabLabel: 'Start Call',
          icon: Icons.video_call,
          onScroll: handleOnScroll,
        ),
        _ => const Center(child: Text('Unknown Page')),
      },
    );
  }

  void handleOnScroll(bool isScrollingDown) {
    if (isScrollingDown) {
      setState(() => hideBottomNavBar = true);
      return;
    }
    setState(() => hideBottomNavBar = false);
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent({
    required this.fabLabel,
    required this.icon,
    required this.onScroll,
    super.key,
  });

  final String fabLabel;
  final IconData icon;
  final void Function(bool isScrollingDown) onScroll;

  @override
  State<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final position = scrollController.position;
      final isScrollingDown =
          position.userScrollDirection == ScrollDirection.reverse;
      if (isScrollingDown) {
        widget.onScroll(true);
        return;
      }
      widget.onScroll(false);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: M3EExtendedFloatingActionButton(
        onPressed: () {},
        label: Text(widget.fabLabel),
        icon: Icon(widget.icon),
        scrollController: scrollController,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
    );
  }
}
