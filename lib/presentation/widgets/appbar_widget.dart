import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_project/presentation/providers/presentation_providers.dart';
import 'package:photo_project/utils/contants.dart';

class PhotoAppBar extends ConsumerStatefulWidget {
  const PhotoAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  ConsumerState<PhotoAppBar> createState() => _PhotoAppBarState();
}

class _PhotoAppBarState extends ConsumerState<PhotoAppBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      ref.read(tabIndexProvider.notifier).state = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: Constants.infiniteScrollListTabMessage),
          Tab(text: Constants.paginatedListTabMessage),
        ],
      ),
      centerTitle: true,
      title: Text(
        widget.title,
      ),
    );
  }
}
