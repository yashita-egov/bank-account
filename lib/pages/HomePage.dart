import 'package:auto_route/auto_route.dart';
import 'package:bank_accounts/router/app_router.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';


@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeaderMolecule(
            title: "Bank Account Services",
            type: HeaderType.dark,
          ),
          
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3)),

          Center(
            child: Button(
              label: "Create Bank Account", 
              onPressed: ()=>context.router.push(BankAccountRoute()), 
              type: ButtonType.primary,
              size: ButtonSize.large,
            ),
          )
        ]
      ),
    );
  }
}