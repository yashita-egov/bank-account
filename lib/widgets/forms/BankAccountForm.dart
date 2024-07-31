// import 'package:digit_ui_components/enum/app_enums.dart';
// import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
// import 'package:digit_ui_components/widgets/atoms/digit_base_form_input.dart';
// import 'package:digit_ui_components/widgets/atoms/digit_text_form_input.dart';
// import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
// import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
// import 'package:digit_ui_components/enum/app_enums.dart';
// import 'package:bank_accounts/router/app_router.dart';
// import 'package:auto_route/auto_route.dart';
import 'package:bank_accounts/models/BankAccount.dart';
import 'package:bank_accounts/widgets/cardHeading.dart';
import 'package:digit_ui_components/digit_components.dart';


class BankAccountForm extends StatefulWidget {
  final void Function(BankAccount) onSubmit;
  const BankAccountForm({super.key, required this.onSubmit});

  @override
  State<BankAccountForm> createState() => _BankAccountFormState();
}

class _BankAccountFormState extends State<BankAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String,dynamic> formData = {};

  void submitForm(){
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Adding Bank Account..'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      // print(formData);
      final bankAccount = BankAccount(
        tenantId: formData['tenantId'],
        serviceCode: formData['serviceCode'],
        referenceId: formData['referenceId'],
      );
      // print(bankAccount);
      widget.onSubmit(bankAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Center(
            child: DigitCard(
              cardType: CardType.primary,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.2, 
                right: MediaQuery.of(context).size.width*0.2
              ),
              children: [
                const CardHeader(title: "Bank Account",),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03)),
                LabeledField(
                  label: "Enter Tenantid",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "tenantid",
                    helpText: "e.g. pb.amritsar",
                    onChange: (value)=> formData['tenantId']=value,
                    isRequired: true,
                    validations: [
                      Validator(
                        ValidatorType.required, 
                        formData['tenantId'],
                        errorMessage: "Please enter valid tenant id",
                      )
                    ],
                  ),
                ),
                LabeledField(
                  label: "Enter Service Code",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "service code",
                    helpText: "e.g. ORG",
                    onChange: (value)=> formData['serviceCode']=value,
                    isRequired: true,
                    validations: [
                      Validator(
                        ValidatorType.required, 
                        formData['serviceCode'],
                        errorMessage: "Please enter valid service code",
                      )
                    ],
                  ),
                ),
                LabeledField(
                  label: "Enter Reference Id",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "reference id",
                    onChange: (value)=> formData['referenceId']=value,
                    isRequired: true,
                    validations: [
                      Validator(
                        ValidatorType.required, 
                        formData['referenceId'],
                        errorMessage: "Please enter valid reference id",
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
                Center(
                  child: Button(
                    label: "Add Bank Account",
                    type: ButtonType.primary, 
                    size: ButtonSize.large,
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        submitForm();
                      }
                    } 
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
