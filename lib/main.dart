import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = [const HomeTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("Cupertino"),
          trailing: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text("WARNING", style: TextStyle(color: Colors.red),),
                      content: const Text("Are you sure want to delete this data?"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Icon(Icons.close, color: Colors.red,),
                          onPressed: () {},
                        ),
                        CupertinoDialogAction(
                          child: const Icon(Icons.done, color: Colors.green,),
                          onPressed: () {},
                        ),
                      ],
                    );
                  });
            },
            child: const Icon(Icons.delete),
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "Profile",
              )
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return data[index];
              },
            );
          },
        ));
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text("Hobbies"),
                    message: const Text("Select your hobbie"),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: const Text("Coding"),
                        onPressed: () {},
                      ),
                      CupertinoActionSheetAction(
                        child: const Text("Main Game"),
                        onPressed: () {},
                      ),
                      CupertinoActionSheetAction(
                        child: const Text("Menulis"),
                        onPressed: () {},
                      ),
                    ],
                  );
                });
          },
          child: const Text("Tap me"),
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Text(
          "This is profile page",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
