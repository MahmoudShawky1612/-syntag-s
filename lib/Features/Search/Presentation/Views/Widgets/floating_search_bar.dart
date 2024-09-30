import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search.dart';

class FloatingSearchBar extends StatelessWidget {
  const FloatingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          // Navigate to the SearchScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: const TextField(
            enabled: false, // Disable typing in this screen
            decoration: InputDecoration(
              hintText: 'Search recipes...',
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              suffixIcon: Icon(Icons.search, color: Colors.black),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
