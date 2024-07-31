import 'package:auto_route/auto_route.dart';
import 'package:bank_accounts/blocs/bank_account/bank_account_bloc.dart';
import 'package:bank_accounts/router/app_router.dart';
import 'package:bank_accounts/widgets/forms/BankAccountDetailForm.dart';
// import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:flutter/material.dart';
// import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';


@RoutePage()
class BankAccountDetailPage extends StatelessWidget {
  const BankAccountDetailPage({super.key});

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
          
          BankAccountDetailForm(
            onSubmit: (bankAccountDetail) {
              context.read<BankAccountBloc>().add(AddBankAccountDetailEvent(bankAccountDetail));
              
              context.router.push(PreviewRoute());
            },
          ),
        ],
      ),
    );
  }
}
