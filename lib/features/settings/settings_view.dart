import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sumrachat/features/settings/view_model/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.fetchUserTransactions(),
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => model.search(model.amount),
                  )),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      model.search(value);
                      return;
                    }
                    model.setAmount(value);
                  },
                ),
                model.isBusy
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : model.transactionList.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('No transactions found'),
                            ),
                          )
                        : model.searchTransactionList.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: model.searchTransactionList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final transaction = model
                                        .searchTransactionList
                                        .elementAt(index);
                                    return ListTile(
                                      title: Text('${transaction.amount}'),
                                    );
                                  },
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: model.transactionList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final transaction =
                                        model.transactionList.elementAt(index);
                                    return ListTile(
                                      title: Text('${transaction.amount}'),
                                    );
                                  },
                                ),
                              ),
              ],
            ),
          ),
        );
      },
    );
  }
}
