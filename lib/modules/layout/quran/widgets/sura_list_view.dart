import 'package:flutter/material.dart';

class SuraListView extends StatelessWidget {
  const SuraListView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      spacing: 10,children: [
      Text("Suras List",
      style: theme.textTheme.titleMedium,),
      
    ],);
  }
}
