import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomMenuBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final List<String> categories;
  final Function(int) onItemTapped;

  const CustomMenuBar({
    super.key,
    required this.icons,
    required this.categories,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              color: index == selectedIndex ? Color(0xFF3C7FB6) : Color(0x963C7FB6),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      categories[index].tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}