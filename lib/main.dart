import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_viewer_flutter/screens/home_screen.dart';
import 'package:pdf_viewer_flutter/screens/list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          indicatorColor: Colors.pink,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_sharp),
              label: 'List',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        body: <Widget>[
          /// Home page
          const Card(
            shadowColor: Colors.transparent,
            margin: EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: HomeScreen(),
              ),
            ),
          ),

          /// List page
          Card(
              child: ListScreen() 
              ),
          /// Settings page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ][currentPageIndex],
      ),
    );
  }
}
