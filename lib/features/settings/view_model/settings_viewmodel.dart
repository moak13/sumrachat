import 'package:stacked/stacked.dart';
import 'package:sumrachat/core/models/transaction_model.dart';

class SettingsViewModel extends BaseViewModel {
  String _amount = '';
  String get amount => _amount;

  List<Data> _searchTransactionList = [];
  List<Data> get searchTransactionList => _searchTransactionList;

  List<Data> _transactionList = [];
  List<Data> get transactionList => _transactionList;

  void setAmount(String value) {
    _amount = value;
    notifyListeners();
  }

  final List<Data> _inMemoryDB = [
    Data(
      depositID: 'bfsfksnnsn',
      payinAccount: '1',
      payoutAccount: '2',
      depositType: 'fixedDeposit',
      dateCreated: '2022-05-16T10:55:42.79',
      dateUpdated: '2022-05-16T10:55:42.913',
      amount: 7000,
    ),
    Data(
      depositID: 'bfsfksnnsn',
      payinAccount: '1',
      payoutAccount: '2',
      depositType: 'fixedDeposit',
      dateCreated: '2022-05-16T10:55:42.79',
      dateUpdated: '2022-05-16T10:55:42.913',
      amount: 500,
    ),
    Data(
      depositID: 'bfsfksnnsn',
      payinAccount: '1',
      payoutAccount: '2',
      depositType: 'fixedDeposit',
      dateCreated: '2022-05-16T10:55:42.79',
      dateUpdated: '2022-05-16T10:55:42.913',
      amount: 200,
    ),
    Data(
      depositID: 'bfsfksnnsn',
      payinAccount: '1',
      payoutAccount: '2',
      depositType: 'fixedDeposit',
      dateCreated: '2022-05-16T10:55:42.79',
      dateUpdated: '2022-05-16T10:55:42.913',
      amount: 7000,
    ),
    Data(
      depositID: 'bfsfksnnsn',
      payinAccount: '1',
      payoutAccount: '2',
      depositType: 'fixedDeposit',
      dateCreated: '2022-05-16T10:55:42.79',
      dateUpdated: '2022-05-16T10:55:42.913',
      amount: 2000,
    ),
  ];

  void fetchUserTransactions() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 4));
    setBusy(false);
    _transactionList = _inMemoryDB;
    notifyListeners();
  }

  void search(String amount) {
    if (amount.isEmpty) {
      _searchTransactionList = _transactionList;
    } else {
      _searchTransactionList = _transactionList
          .where((element) =>
              element.amount.toString().contains(amount.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
