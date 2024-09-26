import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4.0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          child: child,
        ),
      );
}
