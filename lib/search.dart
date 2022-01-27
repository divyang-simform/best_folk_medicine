import 'package:flutter/material.dart';
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ),);
  }
}
