import 'package:cine_loomi/modules/auth/sign_up/pages/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/signUp',
  routes: [
    GoRoute(
      path: '/signUp',
      builder: (context, state) => SignUpScreen(),
    ),
  ],
);
