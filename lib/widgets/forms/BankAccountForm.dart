import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:bank_accounts/models/BankAccount.dart';
import 'package:bank_accounts/widgets/cardHeading.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BankAccountForm extends StatefulWidget {
  final void Function(BankAccount) onSubmit;
  const BankAccountForm({super.key, required this.onSubmit});

  @override
  State<BankAccountForm> createState() => _BankAccountFormState();
}

class _BankAccountFormState extends State<BankAccountForm> {
  final form = FormGroup({
    'tenantId': FormControl<String>(validators: [Validators.required]),
    'serviceCode': FormControl<String>(validators: [Validators.required]),
    'referenceId': FormControl<String>(validators: [Validators.required]),
  });

  void submitForm() {
    if (form.valid) {
      final formData = form.value;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Adding Bank Account..'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      final bankAccount = BankAccount(
        tenantId: formData['tenantId'] as String,
        serviceCode: formData['serviceCode'] as String,
        referenceId: formData['referenceId'] as String,
      );
      widget.onSubmit(bankAccount);
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
                const CardHeader(title: "Bank Account",),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03)),
                LabeledField(
                  label: "Enter Tenantid",
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
                        onChange: field.didChange,
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Enter Service Code",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'serviceCode',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter valid service code',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "service code",
                        helpText: "e.g. ORG",
                        errorMessage: field.errorText,
                        onChange: field.didChange,
                      );
                    },
                  ),
                ),
                LabeledField(
                  label: "Enter Reference Id",
                  isRequired: true,
                  child: ReactiveFormField<String, String>(
                    formControlName: 'referenceId',
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Please enter valid reference id',
                    },
                    builder: (field) {
                      return DigitTextFormInput(
                        innerLabel: "reference id",
                        errorMessage: field.errorText,
                        onChange: field.didChange,
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
                Center(
                  child: Button(
                    label: "Add Bank Account",
                    type: ButtonType.primary, 
                    size: ButtonSize.large,
                    onPressed: () {
                      submitForm();
                    },
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
