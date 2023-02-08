import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget(
      {super.key, required this.function, required this.label});
  final Function function;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        onPressed: () {
          function();
        },
      ),
    );
  }
}
