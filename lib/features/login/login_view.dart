import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Login View'),
                  const SizedBox(
                    height: 30,
                  ),
                  model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TextButton(
                          onPressed: model.loginUser,
                          child: const Text('lOGIN'),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
