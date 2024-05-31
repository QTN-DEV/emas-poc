import 'package:flutter/material.dart';

class BNMiniAppsCard extends StatefulWidget {
  const BNMiniAppsCard({super.key});

  @override
  State<StatefulWidget> createState() => BNMiniAppsCardState();
}

class BNMiniAppsCardState extends State<BNMiniAppsCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              "Perkhidmatan Khas SuperBN",
              style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}