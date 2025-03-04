import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Constants.greyLightColor,
          size: 28,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Constants.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Constants.primaryColor, width: 1.5),
        ),
        labelText: "Search",
        labelStyle: theme.textTheme.titleMedium,
      ),
    );
  }
}
