import 'package:flutter/material.dart';

import '../../domain/models/photo/photo.dart';
import 'photo_card.dart';

class PhotoInfiniteList extends StatefulWidget {
  const PhotoInfiniteList({
    super.key,
    required this.fullListPhotos,
  });

  final List<Photo> fullListPhotos;

  @override
  State<PhotoInfiniteList> createState() => _PhotoInfiniteListState();
}

class _PhotoInfiniteListState extends State<PhotoInfiniteList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();
  late List<Photo> _currentListPhotos;
  int _lastIndexItem = 9;
  @override
  void initState() {
    _currentListPhotos =
        widget.fullListPhotos.getRange(0, _lastIndexItem).toList();
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _lastIndexItem += 10;
        _currentListPhotos =
            widget.fullListPhotos.getRange(0, _lastIndexItem).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      controller: _scrollController,
      itemBuilder: (context, index) {
        return PhotoCard(
          photo: _currentListPhotos[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: _currentListPhotos.length,
    );
  }
}
