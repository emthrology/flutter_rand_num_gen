import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rand_num_gen/components/number_row.dart';
import 'package:flutter_rand_num_gen/screen/color.dart';
import 'package:flutter_rand_num_gen/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
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
                _Header(
                  onPressed: onSettingsClicked,
                ),
                _Body(
                  randomNumbers: randomNumbers,
                ),
                _Footer(
                  onPressed: onRandomNumGen,
                )
              ],
            ),
          ),
        ));
  }

  void onRandomNumGen() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);
      if (number > 99) {
        newNumbers.add(number);
      }
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  void onSettingsClicked() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );

    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({super.key, required this.onPressed});

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
        IconButton(onPressed: onPressed, icon: Icon(Icons.settings, color: RED))
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
                  child: NumberRow(number: x.value)))
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
              backgroundColor: RED,
            ),
            onPressed: onPressed,
            child: Text('CREATE')),
      )
    ]);
  }
}
