import 'package:flutter/material.dart';

import '../Setting/resources.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .95,
      child: const Material(
        elevation: 10,
        shadowColor: Colors.black,
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(),
              prefixIcon: Icon(kSearchBarIcon)),
        ),
      ),
    );
  }
}
