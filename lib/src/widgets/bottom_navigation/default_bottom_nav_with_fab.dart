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
      extendBody: true,
      bottomNavigationBar: Container(
        height: 60 + MediaQuery.paddingOf(context).bottom,
        decoration: BoxDecoration(color: Colors.black12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildItemBottomNav(),
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
