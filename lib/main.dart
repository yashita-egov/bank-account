import 'package:bank_accounts/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_accounts/blocs/bank_account/bank_account_bloc.dart';
import 'package:digit_ui_components/digit_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>BankAccountBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: DigitTheme.instance.mobileTheme,
      ),
    );
  }
}
