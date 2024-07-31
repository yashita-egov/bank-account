import 'package:auto_route/auto_route.dart';
// import 'package:bank_accounts/models/BankAccount.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
// import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_accounts/blocs/bank_account/bank_account_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';



@RoutePage()
class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeaderMolecule(
            title: "Bank Account Services",
            type: HeaderType.dark,
          ),

          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),

          BlocBuilder<BankAccountBloc,BankAccountState>(
            builder: (context, state) {
              if(state is DataLoading){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is DataSubmitSuccess){
                return PanelCard(
                  title: "Bank Account Submitted successfully", 
                  type: PanelType.success,
                  animate: true,
                  actions: [
                    Button(
                      label: "Back to HomePage", 
                      onPressed: ()=>context.router.popUntilRouteWithName('HomeRoute'), 
                      type: ButtonType.primary, 
                      size: ButtonSize.large
                    )
                  ],
                );
              }
              
              //if submission failed
              return const PanelCard(
                  title: "Bank Account Submission Failed", 
                  type: PanelType.error,
                  animate: true,
              );
            },
          ),
        ],
      )
    );
  }
}