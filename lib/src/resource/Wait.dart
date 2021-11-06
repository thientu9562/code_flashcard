import 'package:flutter/material.dart';

import '../app_colors.dart';

class WaitPage extends StatefulWidget {
  const WaitPage({Key? key}) : super(key: key);
  @override
  _TransformBoxWidgetState createState() => _TransformBoxWidgetState();
}

class _TransformBoxWidgetState extends State<WaitPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<BorderRadius> radiusAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();

    final curvedAnimation =
    CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation = Tween<double>(begin: 50, end: 250).animate(curvedAnimation);
    radiusAnimation = Tween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(20),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Container(
          width: sizeAnimation.value,
          height: sizeAnimation.value,
          child: const Center(
            child: Text('Please check your email!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                )),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: radiusAnimation.value,
          ),
        )
    ),
  );
}


