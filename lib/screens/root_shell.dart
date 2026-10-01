import 'package:flutter/material.dart';
import 'package:home/screens/saved_screen.dart';
import 'discover_screen.dart';
import '../widgets/glass_container.dart';
import '../theme/app_colors.dart';
import 'package:home/screens/saved_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    DiscoverScreen(),
    SavedScreen(),
    Center(child: Text("Profile (coming soon)")),
  ];

  final List<IconData> icons = const [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: selectedIndex, children: screens),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: GlassContainer(
              borderRadius: 32,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(icons.length, (index) {
                  return _NavIcon(
                    icon: icons[index],
                    isSelected: index == selectedIndex,
                    onTap: () => setState(() => selectedIndex = index),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}