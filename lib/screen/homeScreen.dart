import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rand_num_gen/screen/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(
                onPressed: onRandomNumGen,
              )
            ],
          ),
        ),
      )
    );
  }

  void onRandomNumGen() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      if (number > 99) {
        newNumbers.add(number);
      }
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤 숫자 생성',
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: RED))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries
              .map((x) => Padding(
                    padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                    child: Row(
                      children: x.value
                          .toString()
                          .split('')
                          .map((x) => Image.asset(
                                'asset/img/$x.png',
                                height: 70.0,
                                width: 50.0,
                              ))
                          .toList(),
                    ),
                  ))
              .toList()),
    ));
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: RED,
            ),
            onPressed: onPressed,
            child: Text('CREATE')),
      )
    ]);
  }
}
