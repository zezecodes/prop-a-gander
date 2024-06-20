import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vodafone/models/models.dart';
import 'package:vodafone/services/data_provider.dart';
import 'package:vodafone/themes/theme_provider.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newsData = ref.watch(userDataProvider);
    final appThemeToggle = ref.watch(themeToggle);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(title: Text(''), actions: [
        IconButton(
          onPressed: () {
            appThemeToggle.toggleMode();
          },
          icon: Icon(
            appThemeToggle.lightModeEnable ? Icons.dark_mode : Icons.light_mode,
            size: 35,
          ),
        )
      ]),
      body: newsData.when(
          data: (newsData) {
            List<NewsModel> news = newsData.map((e) => e).toList();
            return ListView.builder(
              itemBuilder: (
                (context, index) => const Column(
                      children: [
                        Text(''),
                      ],
                    )
              ),
            );
          },
          error: (error, s) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}
