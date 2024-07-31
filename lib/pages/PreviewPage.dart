import 'package:auto_route/auto_route.dart';
import 'package:bank_accounts/blocs/bank_account/bank_account_bloc.dart';
import 'package:bank_accounts/router/app_router.dart';
// import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';
import 'package:bank_accounts/widgets/cardHeading.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:bank_accounts/widgets/const/review_card_text.dart';


@RoutePage()
class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

@override
  Widget build(BuildContext context) {
    final cardText = CardText(context);

    return Scaffold(
      body: Column(
        children: [
          const CustomHeaderMolecule(
            title: "Bank Account Services",
            type: HeaderType.dark,
          ),

          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),

          BlocBuilder<BankAccountBloc, BankAccountState>(
            builder: (context, state) {
              if (state is BankAccountLoaded) {
                // Access the bankAccount from the state
                final bankAccount = state.bankAccount;
                final bankAccountDetail = bankAccount.bankAccountDetail;
                final branchIdentifier = bankAccountDetail[0].bankBranchIdentifier;
                
                return Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: DigitCard(
                        cardType: CardType.primary,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.2, 
                          right: MediaQuery.of(context).size.width*0.2
                        ),
                        children: [
                          const CardHeader(title: "Review Details",),
                          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04)),
                      
                          Text(
                            "Bank Account",
                            style: cardText.headline,
                          ),
                      
                          DigitDivider(dividerType: DividerType.small,),
                      
                          LabeledField(
                            label: "Tenant Id:",
                            labelStyle: cardText.label,
                            child: Text("${bankAccount.tenantId}", style: cardText.labelData)
                          ),
                      
                          LabeledField(
                            label: "Service Code:",
                            labelStyle: cardText.label,
                            child: Text("${bankAccount.serviceCode}", style: cardText.labelData)
                          ),
                      
                          LabeledField(
                            label: "Reference Id:",
                            labelStyle: cardText.label,
                            child: Text("${bankAccount.referenceId}", style: cardText.labelData,)
                          ),
                          Center(
                            child: DigitCard( 
                              cardType: CardType.primary,
                              children: [
                                Text("Bank Account Details", style: cardText.headline,),
                                                  
                                const DigitDivider(dividerType: DividerType.small,),
                                                  
                                LabeledField(
                                  label: "Account Holder Name:",
                                  labelStyle: cardText.label,
                                  child: Text("${bankAccountDetail[0].accountHolderName}", style: cardText.labelData,)
                                ),
                                LabeledField(
                                  label: "Account Number:",
                                  labelStyle: cardText.label,
                                  child: Text("${bankAccountDetail[0].accountNumber}", style: cardText.labelData,)
                                ),
                                  
                                LabeledField(
                                  label: "Account Type:",
                                  labelStyle: cardText.label,
                                  child: Text("${bankAccountDetail[0].accountType}", style: cardText.labelData)
                                ),
                                                  
                                LabeledField(
                                  label: "Branch Type:",
                                  labelStyle: cardText.labelData,
                                  child: Text(" ${branchIdentifier.type}", style: cardText.labelData,)
                                ),
                                                  
                                LabeledField(
                                  label: "Branch Code:",
                                  labelStyle: cardText.labelData,
                                  child: Text(" ${branchIdentifier.code}", style: cardText.labelData,)
                                ),
                                  
                              ],
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),

                          Center(
                            child: Button(
                              label: "Submit",
                              type: ButtonType.primary,
                              size: ButtonSize.large,
                              onPressed: (){
                                context.read<BankAccountBloc>().add(DataSubmitEvent());
                                context.router.push(SubmitRoute());
                              }
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              
              // Optionally handle other states or show a loading indicator
              return const Center(child: Text("No data available"));
            },
          ),
        ],
      ),
    );
  }
}

