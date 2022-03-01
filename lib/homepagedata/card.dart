import '../data_fetching/parsingdata.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  CardPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.time,
      required this.name})
      : super(key: key);
  String image;
  String title;
  String time;
  String description;
  String name;

  @override
  Widget build(BuildContext context) {
    List<String>? time1 = time.split('T');
    return Column(
      children: [
        GestureDetector(
          child: Card(
            elevation: 10,
            child: Row(
              children: [
                Image.network(image,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * .11,
                    width: MediaQuery.of(context).size.width * .3),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text(time1[0]),
                        Text(description, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailPage.detailPagedata,
              arguments: Product(
                  image: image,
                  name: name,
                  description: description,
                  title: title,
                  time: time1[0]),
            );
          },
        ),
        const Divider(thickness: 2)
      ],
    );
  }
}
