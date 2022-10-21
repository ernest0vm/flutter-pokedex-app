import 'package:flutter/material.dart';

class SortListTile extends StatelessWidget {
  const SortListTile(
      {Key? key, this.onTap, required this.iconData, required this.text})
      : super(key: key);

  final Function()? onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                iconData,
                size: 36,
              ),
            ),
            Text(
              text,
              maxLines: 1,
              softWrap: true,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );
}
