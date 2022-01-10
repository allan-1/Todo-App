import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,),),
            Text(DateFormat.yMMMMEEEEd().format(DateTime.now()),),
          ],
        ),
          const Icon(Icons.calendar_today_outlined)
        ],
      );
  }
}
