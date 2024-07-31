import 'package:bank_accounts/models/BankAccountDetails.dart';
import 'package:bank_accounts/models/BankBranchIdentifier.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:bank_accounts/widgets/cardHeading.dart';

class BankAccountDetailForm extends StatefulWidget {
  final void Function(BankAccountDetails) onSubmit;
  const BankAccountDetailForm({super.key, required this.onSubmit});

  @override
  State<BankAccountDetailForm> createState() => _BankAccountDetailFormState();
}

class _BankAccountDetailFormState extends State<BankAccountDetailForm> {
  final form = FormGroup({
    'tenantId': FormControl<String>(validators: [Validators.required]),
    'accountHolderName': FormControl<String>(validators: [Validators.required]),
    'accountNumber': FormControl<String>(validators: [Validators.required]),
    'accountType': FormControl<String>(validators: [Validators.required]),
    'isPrimary': FormControl<bool>(validators: [Validators.required]),
    'isActive': FormControl<bool>(validators: [Validators.required]),
    'branchType': FormControl<String>(validators: [Validators.required]),
    'branchCode': FormControl<String>(validators: [Validators.required]),
  });

  void submitForm() {
    if (form.valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Adding Bank Account Details.."),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );

      final formData = form.value;
      final bankBranchIdentifier = BankBranchIdentifier(
        type: formData['branchType'] as String,
        code: formData['branchCode'] as String,
      );

      final bankAccountDetail = BankAccountDetails(
        tenantId: formData['tenantId'] as String,
        accountHolderName: formData['accountHolderName'] as String,
        accountNumber: formData['accountNumber'] as String,
        accountType: formData['accountType'] as String,
        isActive: formData['isActive']=="true"?true:false ,
        isPrimary: formData['isPrimary']=="true"?true:false,
        bankBranchIdentifier: bankBranchIdentifier,
      );

      widget.onSubmit(bankAccountDetail);
    } else {
      form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Expanded(
        child: SingleChildScrollView(
          child: Center(
            child: DigitCard(
              cardType: CardType.primary,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
              children: [
                const CardHeader(title: "Bank Account Detail"),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03)),
                LabeledField(
                  label: "Enter Tenant id",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'tenantId',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter valid tenant id',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "tenantid",
                        helpText: "e.g. pb.amritsar",
                        errorMessage: field.errorText,
                        onChange: (value) => field.didChange(value),
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Enter Account Holder Name",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'accountHolderName',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter Account Holder Name',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "name",
                        errorMessage: field.errorText,
                        onChange: (value) => field.didChange(value),
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Enter Account Number",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'accountNumber',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter Account Number',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "account number",
                        errorMessage: field.errorText,
                        onChange: (value) => field.didChange(value),
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Enter Account Type",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'accountType',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter Account Type',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "type",
                        helpText: "e.g. savings or current",
                        errorMessage: field.errorText,
                        onChange: (value) => field.didChange(value),
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Is Primary Account?",
                  isRequired: true,
                  child: ReactiveFormField<bool, bool>(
                    formControlName: 'isPrimary',
                    builder: (field) {
                      return RadioList(
                        radioButtons: [
                          RadioButtonModel(code: "true", name: "Yes"),
                          RadioButtonModel(code: "false", name: "No"),
                        ],
                        groupValue:  (field.value==true) ? "true":"false",
                        onChanged: (value) => field.didChange(value.code == "true"),
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Is Account Active?",
                  isRequired: true,
                  child: ReactiveFormField<bool, bool>(
                    formControlName: 'isActive',
                    builder: (field) {
                      return RadioList(
                        radioButtons: [
                          RadioButtonModel(code: "true", name: "Yes"),
                          RadioButtonModel(code: "false", name: "No"),
                        ],
                        groupValue: (field.value==true) ? "true":"false",
                        onChanged: (value) => field.didChange(value.code == "true"),
                      );
                    },
                  ),
                ),
                DigitCard(
                  cardType: CardType.secondary,
                  children: [
                    LabeledField(
                      label: "Branch Type",
                      isRequired: true,
                      child: ReactiveFormField<String, String>(
                        formControlName: 'branchType',
                        validationMessages: {
                          ValidationMessage.required: (error) => 'Please enter Branch Type',
                        },
                        builder: (field) {
                          return DigitTextFormInput(
                            innerLabel: "type",
                            helpText: "e.g. IFSC",
                            errorMessage: field.errorText,
                            onChange: (value) => field.didChange(value),
                          );
                        },
                      ),
                    ),
                    LabeledField(
                      label: "Branch Code",
                      isRequired: true,
                      child: ReactiveFormField<String, String>(
                        formControlName: 'branchCode',
                        validationMessages: {
                          ValidationMessage.required: (error) => 'Please enter Branch Code',
                        },
                        builder: (field) {
                          return DigitTextFormInput(
                            innerLabel: "Branch code",
                            errorMessage: field.errorText,
                            onChange: (value) => field.didChange(value),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
                Center(
                  child: Button(
                    label: "Add Account Detail",
                    onPressed: submitForm,
                    type: ButtonType.primary,
                    size: ButtonSize.large,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
