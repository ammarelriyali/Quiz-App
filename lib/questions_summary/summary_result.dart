
import 'package:flutter/material.dart';
import 'package:task_app/questions_summary/summary_item.dart';
class SummaryResult extends StatelessWidget {
  const SummaryResult({required this.res, super.key});

  final List<Map<String, Object>> res;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
          child: Column(
              children: res.map((e) {
            return SummaryItem(e);
          }).toList()),
        ),
    );
  }
}
