import 'package:flutter/material.dart';

class ShowAnswersButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ShowAnswersButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          child: const Text("Show Your Answers"),
        ),
      ),
    );
  }
}
