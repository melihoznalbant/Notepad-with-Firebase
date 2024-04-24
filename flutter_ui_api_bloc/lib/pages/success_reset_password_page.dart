import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';

@RoutePage()
class SuccessResetMailPage extends StatefulWidget {
  const SuccessResetMailPage({super.key});

  @override
  State<SuccessResetMailPage> createState() => _SuccessResetMailPageState();
}

class _SuccessResetMailPageState extends State<SuccessResetMailPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.router.push(const FireBaseRoute(),);
        /* showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Password Changed"),
              content: const Text(
                  "Congratulations! Your password has been changed. Click continue to login."),
              actions: <Widget>[
                TextButton(
                  child: const Text("Continue"),
                  onPressed: () {
                    context.router.push(
                      const MyHomeRoute(),
                    );
                  },
                ),
              ],
            );
          },
        ); */
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.13, horizontal: width * 0.35),
          child: Container(
            height: width * 0.28,
            width: width * 0.28,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff648ddb),
                  width: 2,
                ),
                shape: BoxShape.circle,
                color: const Color(0xffeff4ff)),
            child: Icon(
              Icons.check,
              size: width * 0.12,
              color: const Color(0xff648ddb),
            ),
          ),
        ),
      ),
    );
  }
}
