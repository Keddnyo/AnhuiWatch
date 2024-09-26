import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
