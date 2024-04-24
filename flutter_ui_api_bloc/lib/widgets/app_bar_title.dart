import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final bool login;
  const AppBarTitle({super.key, this.login = true});

  @override
  Widget build(BuildContext context) {
    const TextStyle selectedStyle = TextStyle(
      color: Colors.blue, // Seçili olanın rengi
      fontWeight: FontWeight.bold, // Seçili olanın kalın fontu
    );

    const TextStyle unselectedStyle = TextStyle(
      color: Colors.grey, // Seçili olmayanın rengi
    );

    return AppBar(
      backgroundColor: Colors.white,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: login
                        ? Colors.blue
                        : Colors.transparent, // Seçili olanın alt çizgisi
                    width: 3.0,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Log In",
                  style: login ? selectedStyle : unselectedStyle,
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: login
                        ? Colors.transparent
                        : Colors.blue, // Seçili olmayanın alt çizgisi
                    width: 3.0,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: login ? unselectedStyle : selectedStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/fonts.dart';

class AppBarTitle extends StatelessWidget {
  final bool login;
  const AppBarTitle({super.key, this.login = true});

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height*0.02),
      child: login == true ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: width / 3,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff648ddb),
                      width: 3.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Log In",
                    style: CustomizeFonts.appBarHeadBlue,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.router.push(const RegisterRoute()),
                child: SizedBox(
                  width: width / 3,
                  child: Text(
                    "Sign Up",
                    style: CustomizeFonts.appBarHeadGrey,
                  ),
                ),
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: SizedBox(
                  width: width / 3,
                  child: Text(
                    "Log In",
                    style: CustomizeFonts.appBarHeadGrey,
                  ),
                ),
              ),
              Container(
                width: width / 3,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff648ddb),
                      width: 3.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: CustomizeFonts.appBarHeadBlue,
                  ),
                ),
              ),
              
            ],
          ),
    );
  }
} */