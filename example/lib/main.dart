import 'package:flutter/material.dart';

import 'package:stacked_sheet/stacked_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StackedChild> sheets = [
    StackedChild(
      button: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: const Text('None'),
        width: double.infinity,
      ),
      child: const FirstSheet(),
      header: const Header(
        title: 'Credit amount',
        subtitle: '\$400',
      ),
    ),
    StackedChild(
      button: const Button(
        title: 'Select EMI',
      ),
      child: const FirstSheet(),
      header: const Header(
        title: 'EMI  ',
        subtitle: '\$ 400 /Mo',
      ),
    ),
    StackedChild(
      button: const Button(
        title: 'Loan ',
      ),
      child: const FirstSheet(),
      header: const Header(
        title: 'Loan anount',
        subtitle: '\$400',
      ),
    ),
    StackedChild(
      button: const Button(
        title: 'Credit amount',
      ),
      child: const FirstSheet(),
      header: const Header(
        title: 'Repay',
        subtitle: '\$400',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[900],
      body: StackedSheet(
        children: sheets,
      ),
    );
  }
}

class FirstSheet extends StatelessWidget {
  const FirstSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.blueGrey,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Nikunj, how much do you need? ",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Move the dial and set any amount needed upto 48.9 '),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.grey[800],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  const Button({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.indigo[400],
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
