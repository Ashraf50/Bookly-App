import 'package:flutter/material.dart';

class DetailsCustomButton extends StatelessWidget {
  final Color color;
  final TextStyle style;
  final String title;
  final void Function()? onTap;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  const DetailsCustomButton({
    super.key,
    required this.color,
    required this.style,
    required this.title,
    required this.onTap,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(color),
            shape: shape,
            minimumSize:
                const MaterialStatePropertyAll(Size(double.infinity, 50))),
        onPressed: onTap,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
