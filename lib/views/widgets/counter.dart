import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final dynamic cubit;
  final int counter;
  const Counter({super.key, required this.cubit, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async => await cubit.decremant(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Text(
                '-',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            cubit.incremant();
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Text(
                '+',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
