import 'package:flutter/material.dart';

class CustomTransitionPage<T> extends Page<T> {
  final Widget child;
  final Duration duration;
  final RouteTransitionsBuilder transitionsBuilder;

  const CustomTransitionPage({
    required this.child,
    required this.transitionsBuilder,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: transitionsBuilder,
    );
  }
}

RouteTransitionsBuilder slideTransition =
    (context, animation, secondaryAnimation, child) {
  const Offset begin = Offset(1.0, 0.0);
  const Offset end = Offset.zero;
  const Curve curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
};

RouteTransitionsBuilder fadeTransition =
    (context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
};

RouteTransitionsBuilder scaleTransition =
    (context, animation, secondaryAnimation, child) {
  return ScaleTransition(
    scale: animation,
    child: child,
  );
};

RouteTransitionsBuilder noTransition =
    (context, animation, secondaryAnimation, child) {
  return child;
};

class NoTransitionPage<T> extends Page<T> {
  final Widget child;

  const NoTransitionPage({required this.child, super.key, super.name});

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
