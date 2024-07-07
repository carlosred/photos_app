// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:photo_project/utils/contants.dart';

import '../../domain/models/photo/photo.dart';
import 'photo_card.dart';

class PhotoListPagination extends StatefulWidget {
  const PhotoListPagination({
    super.key,
    required this.fullListPhotos,
  });

  final List<Photo> fullListPhotos;

  @override
  _PhotoListPaginationState createState() => _PhotoListPaginationState();
}

class _PhotoListPaginationState extends State<PhotoListPagination>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;
  final int _perPage = 10;
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void resetScrollController() async {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Durations.short4,
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final photosToShow = widget.fullListPhotos
        .sublist((_page * _perPage), ((_page * _perPage) + _perPage));

    return Column(
      children: [
        Expanded(
          flex: 30,
          child: ListView.separated(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return PhotoCard(
                photo: photosToShow[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: photosToShow.length,
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () async {
                resetScrollController();
                setState(() {
                  _page -= 1;
                });
              },
              child: Text(Constants.previous),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Text(
                _page.toString(),
                style: Constants.cardTittleTexStyle,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                resetScrollController();
                setState(() {
                  _page += 1;
                });
              },
              child: Text(Constants.next),
            )
          ]),
        ),
      ],
    );
  }
}
