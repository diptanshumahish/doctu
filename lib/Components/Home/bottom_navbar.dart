import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTabTapped;

  const BottomNavBar({Key? key, required this.activeIndex, required this.onTabTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: MediaQuery.of(context).size.height / 11,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(width / 10),
      ),
      child: Row(
        children: List.generate(
          3,
          (index) => _buildNavBarButton(context, index, [
            Icons.home,
            Icons.healing,
            Icons.person,
          ][index], [
            "Home",
            "Diagnose",
            "Profile",
          ][index]),
        ),
      ),
    );
  }

  Widget _buildNavBarButton(BuildContext context, int index, IconData icon, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabTapped(index),
        child: Container(
          decoration: BoxDecoration(
            color: activeIndex == index ? const Color.fromARGB(255, 121, 33, 243) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: activeIndex == index ? 10 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: activeIndex == index ? Colors.white : Colors.grey,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: activeIndex == index ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
