// import 'dart:convert';

import 'package:bank_accounts/models/BankAccount.dart';
import 'package:bank_accounts/models/BankAccountDetails.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'bank_account_event.dart';
part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountBloc() : super(BankAccountInitial()) {
    late BankAccount bankAccount;
    late BankAccountDetails bankAccountDetail;
    on<BankAccountEvent>((event, emit) {
      // implement event handler
    });

    on<AddBankAccountEvent>((event,emit){
      bankAccount = event.bankAccount;
    });

    on<AddBankAccountDetailEvent>((event,emit){
      bankAccountDetail = event.bankAccountDetail;
      
      bankAccount.addBankAccountDetails(bankAccountDetail);

      emit(BankAccountLoaded(bankAccount));
    });

    on<DataSubmitEvent>((event,emit) async{
      emit(DataLoading());
      try{
        await sendDataToBackend(bankAccount);
        emit(DataSubmitSuccess());
      }catch(e){
        // print(e);
        emit(DataSubmitError());
      }

    });
  }
}

Future<void> sendDataToBackend(BankAccount bankAccount) async{
  // print("Sending data to backedn");
  final body = {
      "requestInfo": {
        "apiId": "Rainmaker",
        "authToken": "e93c6059-71d8-4f55-b44c-1aec0a723c65",
        "userInfo": {
        "id": 1552,
        "uuid": "0477b319-7cd3-4b5e-98ec-dc7ed140b623",
        "userName": "DEV_GUIDE",
        "name": "dev guide",
        "mobileNumber": "9925363638",
        "emailId": "workbenchadmin@gmail.com",
        "locale": null,
        "type": "EMPLOYEE",
        "roles": [
            {
                "name": "Super User",
                "code": "SUPERUSER",
                "tenantId": "pb"
            },
            {
                "name": "Citizen",
                "code": "CITIZEN",
                "tenantId": "pb"
            },
            {
                "name": "MDMS Admin",
                "code": "MDMS_ADMIN",
                "tenantId": "pb"
            },
            {
                "name": "Localisation admin",
                "code": "LOC_ADMIN",
                "tenantId": "pb"
            },
            {
                "name": "Employee",
                "code": "EMPLOYEE",
                "tenantId": "pb"
            }
        ],
        "active": true,
        "tenantId": "pb",
        "permanentCity": null
    },
        "msgId": "1714055068243|en_MZ",
        "plainAccessRequest": {}
    },
    "bankAccounts": [bankAccount.toJson()]
};

  final dio = Dio();

  Response response;
  response = await dio.post('http://localhost:8080/bank_service/bankaccount/v1/_create', data: body,options: Options(
    headers: {'Content-Type':'application/json'},
  ));


}