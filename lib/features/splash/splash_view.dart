import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.handleStartUp(),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: Colors.orange,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   'assets/svg/logo.svg',
                //   width: 164,
                //   height: 182,
                //   fit: BoxFit.cover,
                // ),
                Image.asset(
                  'assets/png/logo.png',
                  width: 164,
                  height: 182,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sumrachat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
