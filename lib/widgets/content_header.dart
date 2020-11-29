import 'package:flutter/material.dart';
import 'package:netflix/models/models.dart';
import 'package:netflix/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover),
            )),
        Container(
            height: 500,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight))),
        Positioned(
            bottom: 110.0,
            child: SizedBox(
              width: 250,
              child: Image.asset(featuredContent.titleImageUrl),
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  onTap: () => print('My List'),
                  title: 'My List'),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  onTap: () => print('Info'),
                  title: 'Info'),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () => print('play'),
        padding: const EdgeInsets.fromLTRB(
          15,
          5,
          20,
          5,
        ),color: Colors.white,
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
        ),
        label: const Text(
          'Play',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}
