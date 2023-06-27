import 'package:flutter/material.dart';
import 'package:pokedex/config/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        backgroundColor: gray200,
        elevation: 0,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Icon(Icons.filter_list_alt, color: Colors.black),
      )
    );
  }
}
