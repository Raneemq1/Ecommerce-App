import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Color bgColor;
  final double height;
  final Color frColor;
  final VoidCallback? onPressed;

  const MainButton(
      {super.key,
      this.height = 50,
      this.frColor = AppColors.bgColor,
      this.bgColor = AppColors.orange,
      this.child,
      this.title,
      this.onPressed})
      : assert(title != null || child != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: title != null
            ? Text(
                '$title',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, color: AppColors.white),
              )
            :  child,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: frColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
