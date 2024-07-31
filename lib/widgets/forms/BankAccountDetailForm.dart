import 'package:bank_accounts/models/BankAccountDetails.dart';
import 'package:bank_accounts/models/BankBranchIdentifier.dart';
import 'package:digit_ui_components/digit_components.dart';
// import 'package:digit_ui_components/enum/app_enums.dart';
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
// import 'package:digit_ui_components/widgets/atoms/digit_radio_list.dart';
import 'package:bank_accounts/widgets/cardHeading.dart';



class BankAccountDetailForm extends StatefulWidget {
  final void Function(BankAccountDetails) onSubmit;
  const BankAccountDetailForm({super.key, required this.onSubmit});

  @override
  State<BankAccountDetailForm> createState() => _BankAccountDetailFormState();
}

class _BankAccountDetailFormState extends State<BankAccountDetailForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String,dynamic> formData = {};

  void submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Adding Bank Account Details.."),
          backgroundColor: Theme.of(context).colorScheme.primary
        ),
      );

      final bankBranchIdentifier = BankBranchIdentifier(
        type: formData['branchType'], 
        code: formData['branchCode'],
      );
      
      final bankAccountDetail = BankAccountDetails(
        tenantId: formData['tenantId'],
        accountHolderName: formData['accountHolderName'], 
        accountNumber: formData['accountNumber'], 
        accountType: formData['accountType'], 
        isActive: formData['isActive'], 
        isPrimary: formData['isPrimary'], 
        bankBranchIdentifier: bankBranchIdentifier,
      );
      // print(formData);
      // print(bankAccountDetail);
      widget.onSubmit(bankAccountDetail);
    }
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
                const CardHeader(title: "Bank Account Detail",),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03)),
            
                LabeledField(
                  label: "Enter Tenant id",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "tenantid",
                    isRequired: true,
                    helpText: "e.g. pb.amritsar",
                    onChange: (value)=>formData['tenantId']=value,
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
                  label: "Enter Account Holder Name",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "name",
                    onChange: (value)=>formData['accountHolderName']=value,
                    validations: [
                      Validator(
                        ValidatorType.required,
                        formData['accountHolderName'],
                        errorMessage: "Please enter Account Holder Name",
                      )
                    ],
                  ),
                ),
                LabeledField(
                  label: "Enter Account Number",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "account number",
                    onChange: (value)=>formData['accountNumber']=value,
                    validations: [
                      Validator(
                        ValidatorType.required,
                        formData['accountNumber'],
                        errorMessage: "Please enter Account Number",
                      )
                    ],
                  ),
                ),
                LabeledField(
                  label: "Enter Account type",
                  isRequired: true,
                  child: DigitTextFormInput(
                    innerLabel: "type",
                    helpText: "e.g. savings or current",
                    onChange: (value)=>formData['accountType']=value,
                    validations: [
                      Validator(
                        ValidatorType.required,
                        formData['accountType'],
                        errorMessage: "Please Enter Account Type"
                      )
                    ],
                  ),
                ),
                LabeledField(
                  label: "Is Primary Account?",
                  isRequired: true,
                  child: RadioList(
                    radioButtons: [
                      RadioButtonModel(code: "true", name: "Yes"),
                      RadioButtonModel(code: "false", name: "No"),
                    ],
                    onChanged: (value)=>formData['isPrimary']=(value.code=="true")?true:false,
                  ),
                ),
                LabeledField(
                  label: "Is Account Active?",
                  isRequired: true,
                  child: RadioList(
                    radioButtons: [
                      RadioButtonModel(code: "true", name: "Yes"),
                      RadioButtonModel(code: "false", name: "No"),
                    ],
                    onChanged: (value)=>formData['isActive']=(value.code=="true")?true:false,
                  )
                  ),
                DigitCard(
                  cardType: CardType.secondary,
                  children: [
                    LabeledField(
                      label: "Branch Type",
                      isRequired: true,
                      child: DigitTextFormInput(
                        innerLabel: "type",
                        helpText: "e.g. IFSC",
                        onChange: (value)=>formData['branchType']=value,
                        validations: [
                          Validator(
                            ValidatorType.required,
                            formData['branchType']
                          )
                        ],
                      ),
                    ),
                    LabeledField(
                      label: "Branch Code",
                      isRequired: true,
                      child: DigitTextFormInput(
                        innerLabel: "Branch code",
                        onChange: (value)=>formData['branchCode']=value,
                        validations: [
                          Validator(
                            ValidatorType.required,
                            formData['branchCode']
                          )
                        ],
                      )
                    )
                  ], 
                ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1)),
            
                Center(
                  child: Button(
                    label: "Add Account Detail",
                    onPressed: ()=>submitForm(), 
                    type: ButtonType.primary, 
                    size: ButtonSize.large,
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
