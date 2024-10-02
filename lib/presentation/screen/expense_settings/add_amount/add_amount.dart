import 'package:expense_manager/core/services/validation_services.dart';
import 'package:expense_manager/presentation/global_widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../sql_helper/add_amount_helper.dart';
import '../../../../theme/app_style.dart';

class AddAmount extends ConsumerStatefulWidget {
  const AddAmount({super.key});
  @override
  ConsumerState<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends ConsumerState<AddAmount> {
  // @override

  List<Map<String, dynamic>> _addAmount = [];

  void _refreshAddAmount() async {
    final data = await AddExpenseSQLHelper.getItems();
    setState(() {
      _addAmount = data;
      // _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshAddAmount();
    print("..number of items ${_addAmount.length}");
  }

  static final TextEditingController _addAmountController =
      TextEditingController();
  static final TextEditingController _incomeSourceController =
      TextEditingController();
  static final TextEditingController _addDateController =
      TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _addItem() async {
    await AddExpenseSQLHelper.createItem(_incomeSourceController.text,
        _addAmountController.text, _addDateController.text);
    _refreshAddAmount();
    print("..number of items ${_addAmount.length}");
    print(_addAmount);
  }

  Future<void> _updateItem(int id) async {
    await AddExpenseSQLHelper.updateItem(id, _incomeSourceController.text,
        _addAmountController.text, _addDateController.text);
    _refreshAddAmount();
  }

  Future<void> _deleteItem(int id) async {
    await AddExpenseSQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleated a Added History!')));
    _refreshAddAmount();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingAddAmount =
          _addAmount.firstWhere((element) => element['id'] == id);
      _incomeSourceController.text = existingAddAmount['source_of_income'];
      _addAmountController.text = existingAddAmount['add_amount'];
      _addDateController.text = existingAddAmount['add_amount_date_time'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Source of Income: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _incomeSourceController,
                          hintText: "Add a income source",
                          textInputType: TextInputType.number,
                          validator: Validators.fieldValidator,
                          onTapCallback: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add Amount: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _addAmountController,
                          validator: Validators.currencyValidator,
                          hintText: "Add the number of amount",
                          textInputType: TextInputType.number,
                          onTapCallback: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _addDateController,
                          hintText: "Select a Date",
                          textInputType: TextInputType.number,
                          prefixIcon: Icon(Icons.calendar_month_sharp),
                          onTapCallback: () {
                            _selectDatePicker();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              _formKey.currentState!.validate();
                              if (id == null) {
                                await _addItem();
                              }
                              if (id != null &&
                                  _formKey.currentState!.validate()) {
                                await _updateItem(id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Updated')),
                                );

                                /// close the bottom sheet
                                Navigator.of(context).pop();
                              } else {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(content: Text('Not Updated')),
                                // );
                              }
                            },
                            child: Text(id == null ? 'Create New' : 'Update')),
                        const SizedBox(
                          width: 20,
                        ),
                        id != null
                            ? ElevatedButton(
                                onPressed: () async {
                                  if (id != null) {
                                    await _deleteItem(id);
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text('Delete'))
                            : Container()
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  void _createForm(int? id) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        isDismissible: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Source of Income: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _incomeSourceController,
                          hintText: "Add a income source",
                          textInputType: TextInputType.number,
                          validator: Validators.fieldValidator,
                          onTapCallback: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add Amount: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _addAmountController,
                          hintText: "Add the number of amount",
                          textInputType: TextInputType.number,
                          validator: Validators.currencyValidator,
                          onTapCallback: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date: ',
                          style: AppStyle.font16Weight400Black,
                        ),
                        CustomTextField(
                          controller: _addDateController,
                          hintText: "Select a Date",
                          textInputType: TextInputType.number,
                          prefixIcon: Icon(Icons.calendar_month_sharp),
                          onTapCallback: () {
                            _selectDatePicker();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  id == null) {
                                await _addItem();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Form is valid!')),
                                );

                                /// clear the text field
                                _incomeSourceController.text = '';
                                _addAmountController.text = '';
                                _addDateController.text = '';

                                /// close the bottom sheet
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Form is not valid!')),
                                );
                              }
                            },
                            child: const Text('Create New')),
                      ],
                    ),
                  ],
                ),
              ),
            ));
    _incomeSourceController.clear();
    _addAmountController.clear();
    _addDateController.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Text("Added History",
                        style: AppStyle.dashboardTitleBoldTextStyle),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Income Source",
                        ),
                        Text(
                          "Date",
                        ),
                        Text(
                          "Amount (৳)",
                        ),
                        SizedBox(
                          width: 25,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _addAmount.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => _showForm(_addAmount[index]['id']),
                        child: Card(
                          color: const Color(0XFF5193BB),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                  width: 80,
                                  child: Text(
                                    _addAmount[index]['source_of_income'],
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  _addAmount[index]['add_amount_date_time'],
                                  style: const TextStyle(color: Colors.black),
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "৳ ${_addAmount[index]['add_amount']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () =>
                                        _showForm(_addAmount[index]['id']),
                                    icon: const Icon(Icons.arrow_forward_ios)),
                              )
                            ],
                          ),
                        ),
                      )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _createForm(null)),
    );
  }

  Future<void> _selectDatePicker() async {
    DateTime? _addAmountDatePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime.now().subtract(const Duration(days: 0)),
    );

    if (_addAmountDatePicked != null) {
      setState(() {
        _addDateController.text = _addAmountDatePicked.toString().split(" ")[0];
      });
    }
  }
}
