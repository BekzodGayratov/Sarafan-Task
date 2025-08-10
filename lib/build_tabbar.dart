import 'package:flutter/material.dart';
import 'package:task/build_image.dart';
import 'package:task/build_text.dart';

class BuildTabBar extends StatefulWidget {
  final List<Map<String, dynamic>> tabs;
  final List<Map<String, dynamic>> views;

  const BuildTabBar({super.key, required this.tabs, required this.views});

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: widget.tabs.map((tab) => Tab(text: tab['label'])).toList(),
        ),
        Builder(
          builder: (_) {
            if (widget.views[_tabController.index]['widget_type'] ==
                'list_view') {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.views[_tabController.index]['content'].length,
                itemBuilder: (context, index) {
                  final item =
                      widget.views[_tabController.index]['content'][index];
                  if (item['widget_type'] == 'text') {
                    return BuildText(text: item['text']);
                  }
                  if (item['widget_type'] == 'image') {
                    return BuildImage(url: item['url']);
                  }
                  return const SizedBox.shrink();
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
