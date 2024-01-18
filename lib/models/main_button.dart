import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final AppState instanceState;
  const MainButton(
      {super.key, required this.onTap, required this.instanceState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          instanceState == AppState.congrating ? "Again" : "Next",
        ),
      ),
    );
  }
}
