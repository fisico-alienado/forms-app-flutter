import 'package:forms_bloc_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/', // ! Pantalla que se va a ver por defecto. Esta interesante para TESTEAR porque podemos poner de principal screens que queramos testear
  routes: [
    GoRoute(
      path: '/', // ! Pantalla que se va a ver por defecto. Es importante porque, sino encuentra rutas volverá a esta por defecto.
      builder: (context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),

  ]
);