import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Error"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            context.router.maybePop();
                           // context.router.push(const AuthRoute());
                          },
                          child: const Text("Try again")),
                    )
                  ],
                ),
              ),
            );
  }
}