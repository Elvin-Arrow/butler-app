import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function onChanged;

  const Search({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        hintColor: Colors.transparent,
      ),
      child: Container(
        color: kBackgroundColor,
        height: 42,
        child: TextField(
          onChanged: this.onChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: 'Regular',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[700],
            ),
            fillColor: kDefaultIconColour,
            filled: true,
          ),
        ),
      ),
    );
  }
}
