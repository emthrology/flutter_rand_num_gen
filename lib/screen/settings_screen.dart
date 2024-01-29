import 'package:flutter/material.dart';
import 'package:flutter_rand_num_gen/components/number_row.dart';

import 'color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({super.key, required this.maxNumber});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    maxNumber = widget.maxNumber.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Body(maxNumber: maxNumber),
                _Footer(
                  onSliderChanged: onSliderChanged,
                  maxNumber: maxNumber,
                  onBtnClicked: onBtnClicked,
                )
              ],
            ),
          ),
        ));
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onBtnClicked() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NumberRow(number: maxNumber.toInt()));
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onBtnClicked;

  const _Footer(
      {required this.onSliderChanged,
      super.key,
      required this.maxNumber,
      required this.onBtnClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: onSliderChanged),
        ElevatedButton(
            onPressed: onBtnClicked,
            style: ElevatedButton.styleFrom(backgroundColor: RED),
            child: Text('저장'))
      ],
    );
  }
}
