import 'package:flutter/material.dart';


class CardText{
    final TextStyle? headline;
    final TextStyle? label;
    final TextStyle? labelData;

    CardText(BuildContext context)
      :headline = Theme.of(context).textTheme.headlineMedium,
      label = Theme.of(context).textTheme.bodyMedium,
      labelData = Theme.of(context).textTheme.bodyLarge;
      
}