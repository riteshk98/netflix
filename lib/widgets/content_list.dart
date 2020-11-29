import 'package:flutter/material.dart';
import 'package:netflix/models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final bool isOriginals;
  final List<Content> contentList;

  const ContentList(
      {Key key, this.title, this.isOriginals = false, this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext bc, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 210 : 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                );
              }),
        )
      ],
    );
  }
}
