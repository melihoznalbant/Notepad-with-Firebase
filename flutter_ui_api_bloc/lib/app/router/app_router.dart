import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/auth_apge.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/before_success_recent_mail_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/email_code_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/firebase_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/forgot_password_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/home_page.dart';
//import 'package:flutter_ui_api_bloc/pages/register_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/reset_password_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/set_password_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/spors_page.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/view/success_reset_password_page.dart';

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
