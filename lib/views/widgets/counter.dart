import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (counter != 0) {
                    counter--;
                  }
                });
              },
              child: Text(
                '-',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              counter.toString(),
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: Text(
                '+',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
