part of 'bank_account_bloc.dart';

sealed class BankAccountEvent extends Equatable {
  const BankAccountEvent();

  @override
  List<Object> get props => [];
}


class AddBankAccountEvent extends BankAccountEvent{
  final BankAccount bankAccount;

  const AddBankAccountEvent(this.bankAccount):super();

  @override
  List<Object> get props => [bankAccount];
}

class AddBankAccountDetailEvent extends BankAccountEvent{
  final BankAccountDetails bankAccountDetail;

  const AddBankAccountDetailEvent(this.bankAccountDetail):super();

  @override
  List<Object> get props => [bankAccountDetail];
}

class DataSubmitEvent extends BankAccountEvent{

  const DataSubmitEvent():super();
}