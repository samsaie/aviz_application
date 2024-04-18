import 'package:aviz_application/widgets/appBars.dart';
import 'package:flutter/material.dart';

import '../../../widgets/search_box.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchAppBar(),
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: SearchBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
