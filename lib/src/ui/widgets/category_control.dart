import 'package:flutter/material.dart';

import 'package:butler_app/src/resources/utilities/constants.dart';

/// A tapable icon widget with the ability to change colour
/// based on the [isSelected] property.
///
class CategoryControl extends StatelessWidget {
  const CategoryControl({
    Key key,
    this.selectedColour = kSelectedIconColour,
    this.colour = kDefaultIconColour,
    this.isSelected = false,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final Color selectedColour;
  final Color colour;
  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          this.icon,
          color: this.isSelected ? this.selectedColour : this.colour,
          size: 30,
        ),
      ),
    );
  }
}
