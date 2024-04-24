import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_api_bloc/pages/auth_apge.dart';
import 'package:flutter_ui_api_bloc/pages/before_success_recent_mail_page.dart';
import 'package:flutter_ui_api_bloc/pages/email_code_page.dart';
import 'package:flutter_ui_api_bloc/pages/firebase_page.dart';
import 'package:flutter_ui_api_bloc/pages/forgot_password_page.dart';
import 'package:flutter_ui_api_bloc/pages/home_page.dart';
//import 'package:flutter_ui_api_bloc/pages/register_page.dart';
import 'package:flutter_ui_api_bloc/pages/reset_password_page.dart';
import 'package:flutter_ui_api_bloc/pages/set_password_page.dart';
import 'package:flutter_ui_api_bloc/pages/spors_page.dart';
import 'package:flutter_ui_api_bloc/pages/success_reset_password_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MyHomeRoute.page,
          //initial: true,
          path: "/myHomePage",
        ),
        AutoRoute(
          page: EmailCode2Route.page,
          path: "/emailCodePage",
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: "/forgotPasswordPage",
        ),
        AutoRoute(
          page: ResetPassword2Route.page,
          path: "/resetPasswordPage",
        ),
        AutoRoute(
          page: SetPasswordRoute.page,
          path: "/setPasswordPage",
        ),
        AutoRoute(
          page: BeforeSuccessRecentMailRoute.page,
          path: "/beforeSuccessRecentMailPage",
        ),
        AutoRoute(
          page: SuccessResetMailRoute.page,
          path: "/successResentMailPage",
        ),
        AutoRoute(
          page: FireBaseRoute.page,
          path: "/fireBasePage",
        ),
        AutoRoute(
          page: SporsRoute.page,
          path: "/sportsPage",
        ),
        /* AutoRoute(
          page: RegisterRoute.page,
          path: "/registerPage",
        ), */
        AutoRoute(
          page: AuthRoute.page,
          path: "/authPage",
          initial: true,
        ),
      ];
}
