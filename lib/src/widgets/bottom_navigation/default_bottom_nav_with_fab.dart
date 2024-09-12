import 'package:flutter/material.dart';

/// example use bottom navigation bar with floating action button (default by Flutter provider)
/// use notch, NOT use lib, NOT use canvas
class DefaultBottomNavWithFABExample extends StatefulWidget {
  const DefaultBottomNavWithFABExample({super.key});

  @override
  State<DefaultBottomNavWithFABExample> createState() => _DefaultBottomNavWithFABExampleState();
}

class _DefaultBottomNavWithFABExampleState extends State<DefaultBottomNavWithFABExample> {
  int selectedIndex = 0;
  final items = [
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  void _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set true to ensure that body will be visible through the bottom navigation bar's notch
      extendBody: true,
      bottomNavigationBar: _DefaultBottomNavWithFAB(
        items: List.generate(
            items.length,
            (index) => GestureDetector(
                  onTap: () {
                    _changeIndex(index);
                  },
                  child: Icon(
                    items[index],
                    color: index == selectedIndex ? Colors.white : Colors.black,
                    size: index == selectedIndex ? 30 : 24,
                  ),
                )).toList(),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
        child: const Icon(Icons.brightness_2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _DefaultBottomNavWithFAB extends StatelessWidget {
  const _DefaultBottomNavWithFAB({
    required this.items,
  });
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: EdgeInsets.zero,
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}

/// example use bottom navigation bar with floating action button
/// use notch, USE canvas, NOT use lib
class CustomBottomNavWithFABExample extends StatefulWidget {
  const CustomBottomNavWithFABExample({
    super.key,
    this.fabLocation,
  });
  final FABLocation? fabLocation;

  @override
  State<CustomBottomNavWithFABExample> createState() => _CustomBottomNavWithFABExampleState();
}

class _CustomBottomNavWithFABExampleState extends State<CustomBottomNavWithFABExample> {
  int selectedIndex = 0;
  final items = [
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  void _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // bottomNavigationBar: Container(
      //   height: 60 + MediaQuery.paddingOf(context).bottom,
      //   decoration: BoxDecoration(color: Colors.black12),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: _buildItemBottomNav(),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(40.0),
          child: ClipPath(
            clipper: TicketClipper(),
            child: Container(
              height: 120,
              width: double.maxFinite,
              color: Colors.orange,
              alignment: Alignment.topCenter,
              child: Text("Phim hay"),
            ),
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.all(12),
      //   decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
      //   child: const Icon(Icons.brightness_2),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> _buildItemBottomNav() {
    final width = 72.0;
    List<Widget> navItems = [];
    final count = items.length;
    for (int i = 0; i < count; i++) {
      if (widget.fabLocation != null && widget.fabLocation != FABLocation.end && i == count / 2) {
        navItems.add(SizedBox(width: width));
      }
      navItems.add(
        NavigationBarItem(
          icon: items[i],
          isActive: selectedIndex == i,
          onTap: () {
            _changeIndex(i);
          },
        ),
      );
      if (widget.fabLocation != null && widget.fabLocation == FABLocation.end && i == count - 1) {
        navItems.add(SizedBox(width: width));
      }
    }
    return navItems;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double borderRadius = 15;
    double width = size.width;
    double height = size.height;
    double rheight = height - height / 3;
    double oneThird = width / 3;

    final path = Path()
      ..lineTo(0, rheight - borderRadius)
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(oneThird, rheight)
      ..lineTo(width / 2 - borderRadius, height - borderRadius)
      ..cubicTo(width / 2 - borderRadius, height - borderRadius, width / 2, height,
          width / 2 + borderRadius, height - borderRadius)
      ..lineTo(2 * oneThird, rheight)
      ..lineTo(width - borderRadius, rheight)
      ..cubicTo(width - borderRadius, rheight, width, rheight, width, rheight - borderRadius)
      ..lineTo(width, 0)
      ..lineTo(0, 0);
    return path;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this != oldClipper;
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  const MyCustomClipper();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    double yControlPoint = size.height * 0.85;
    double increment = size.width / 12;

    while (x < size.width) {
      path.quadraticBezierTo(x + increment / 2, yControlPoint, x + increment, y);
      x += increment;
    }

    path.lineTo(size.width, 0.0);

    while (x > 0) {
      path.quadraticBezierTo(x - increment / 2, size.height * .15, x - increment, 0);
      x -= increment;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

enum FABLocation { start, center, end }

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    this.isActive = false,
    required this.icon,
    this.label,
    this.onTap,
  });
  final bool isActive;
  final IconData icon;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : Colors.black,
                ),
                if (label != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(label!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
