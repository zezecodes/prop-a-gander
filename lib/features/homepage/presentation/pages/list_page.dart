import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vodafone/models/models.dart';
import 'package:vodafone/services/data_provider.dart';
import 'package:vodafone/themes/theme_provider.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(userDataProvider);
    final appThemeToggle = ref.watch(themeToggle);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.grey[200],
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
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 2,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            )),
        title: Text(
          "Prop-a-gander? 🦆",
          style: GoogleFonts.lora(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              appThemeToggle.toggleMode();
            },
            icon: Icon(
              appThemeToggle.lightModeEnable
                  ? Icons.dark_mode
                  : Icons.light_mode,
              size: 35,
            ),
          )
        ],
      ),
      body: value.when(
          data: (value) {
            List<NewsModel> userList = value.map((e) => e).toList();
            return RefreshIndicator(
              child: PageData(userList: userList),
              onRefresh: () {
                return ref.refresh(userDataProvider.future);
              },
            );
          },
          error: ((error, s) => const Center(
                child: Text(
                  "No Internet",
                ),
              )),
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}

class PageData extends StatelessWidget {
  const PageData({
    super.key,
    required this.userList,
  });

  final List<NewsModel> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: userList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (data, index) {
          final time = userList[index].publishedAt.hour.toString();
          final source = userList[index].source.name;
          return Card(
            elevation: 1,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/second");
              },
              title: Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(userList[index].urlToImage),
                        fit: BoxFit.cover)),
                child: const Text(''),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userList[index].title,
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      userList[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '$time h ago',
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ' ☉ $source',
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
