import 'package:flutter/cupertino.dart';

class ChartBar extends StatelessWidget {
  late final String label;
  late final double value;
  late final double percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("R\$ ${value.toStringAsFixed(2)}"),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
