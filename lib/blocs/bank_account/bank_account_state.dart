part of 'bank_account_bloc.dart';

sealed class BankAccountState extends Equatable {
  const BankAccountState();
  
  @override
  List<Object> get props => [];
}

final class BankAccountInitial extends BankAccountState {}

final class BankAccountLoaded extends BankAccountState{
  final BankAccount bankAccount;

  const BankAccountLoaded(this.bankAccount):super();

  @override
  List<Object> get props => [bankAccount];
}

final class DataLoading extends BankAccountState{
  const DataLoading():super();
}

final class DataSubmitSuccess extends BankAccountState{
  const DataSubmitSuccess():super();
}

final class DataSubmitError extends BankAccountState{
  const DataSubmitError():super();
}
