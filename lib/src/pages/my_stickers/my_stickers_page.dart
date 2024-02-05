import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/pages/my_stickers/widgets/sticker_group_filter.dart';
import 'package:fwc_album_app/src/pages/my_stickers/widgets/sticker_status_filter.dart';

class MyStickersPage extends StatelessWidget {
  const MyStickersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StickerStatusFilter(
                  filterSelected: "",
                ),
                StickerGroupFilter(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
