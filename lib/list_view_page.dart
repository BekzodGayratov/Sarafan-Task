import 'package:flutter/material.dart';
import 'package:task/build_image.dart';
import 'package:task/build_tabbar.dart';
import 'package:task/build_text.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _mockApiContent.length,
          itemBuilder: (context, index) {
            final item = _mockApiContent[index];

            if (item['widget_type'] == 'image') {
              return BuildImage(url: item['url']);
            }
            if (item['widget_type'] == 'text') {
              return BuildText(text: item['text']);
            } else if (item['widget_type'] == 'tab_bar') {
              return BuildTabBar(tabs: item['tabs'], views: item['views']);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _mockApiContent = [
  {'widget_type': 'text', 'text': 'Hello World1'},
  {
    'widget_type': 'tab_bar',
    'tabs': [
      {'label': 'Tab 1'},
      {'label': 'Tab 2'},
      {'label': 'Tab 3'},
    ],
    'views': [
      {
        'widget_type': 'list_view',
        'content': [
          {'widget_type': 'text', 'text': 'Tab World1'},
          {'widget_type': 'text', 'text': 'Tab World2'},
          {'widget_type': 'text', 'text': 'Tab World3'},
        ],
      },
      {
        'widget_type': 'list_view',
        'content': [
          {'widget_type': 'text', 'text': 'Tab World1'},
          {'widget_type': 'text', 'text': 'Tab World2'},
          {'widget_type': 'text', 'text': 'Tab World3'},
        ],
      },
      {
        'widget_type': 'list_view',
        'content': [
          {'widget_type': 'text', 'text': 'Tab World1'},
          {'widget_type': 'text', 'text': 'Tab World2'},
          {'widget_type': 'text', 'text': 'Tab World3'},
          {
            'widget_type': 'image',
            'url':
                'https://t4.ftcdn.net/jpg/02/66/72/41/360_F_266724172_Iy8gdKgMa7XmrhYYxLCxyhx6J7070Pr8.jpg',
          },
        ],
      },
    ],
  },
  {'widget_type': 'text', 'text': 'Hello World2'},
  {'widget_type': 'text', 'text': 'Hello World3'},
  {
    'widget_type': 'image',
    'url':
        'https://t4.ftcdn.net/jpg/02/66/72/41/360_F_266724172_Iy8gdKgMa7XmrhYYxLCxyhx6J7070Pr8.jpg',
  },
  {'widget_type': 'text', 'text': 'Hello World4'},
  {'widget_type': 'text', 'text': 'Hello World5'},
];
