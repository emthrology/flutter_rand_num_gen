import 'package:flutter/material.dart';
import 'package:flutter_rand_num_gen/screen/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '랜덤 숫자 생성',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, color: RED))
                  ],
                ),
                Expanded(
                    child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [123, 675, 789]
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
                )),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: RED,
                        ),
                        onPressed: () {},
                        child: Text('CREATE')),
                  )
                ])
              ],
            ),
          ),
        ));
  }
}
