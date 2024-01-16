import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('랜덤 숫자 생성'),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings))
            ],
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('123'), Text('456'), Text('789')],
            ),
          )),
          Row(children: [
            Expanded(
              child: ElevatedButton(onPressed: () {}, child: Text('CREATE')),
            )
          ])
        ],
      ),
    ));
  }
}
