import 'package:expense_manager/presentation/global_widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../sql_helper/add_expense_helper.dart';
import '../../../../theme/app_style.dart';

class AddAmount extends ConsumerStatefulWidget {
  const AddAmount({super.key});

  // static final TextEditingController _addAmount = TextEditingController();
  // static final TextEditingController _incomeSource = TextEditingController();
  // static final TextEditingController _addDate = TextEditingController();
  // static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully deleated a journal!')));
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
                        onTapCallback: () {},
                      ),
                    ],
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Date: ',
                  //       style: AppStyle.font16Weight400Black,
                  //     ),
                  //     CustomTextField(
                  //       controller: _addDateController,
                  //       hintText: "DD-MM-YYYY",
                  //       textInputType: TextInputType.number,
                  //       onTapCallback: () {},
                  //     ),
                  //   ],
                  // ),
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
                            if (id == null) {
                              await _addItem();
                            }
                            if (id != null) {
                              await _updateItem(id);
                            }
                            // clear the text field
                            _incomeSourceController.text = '';
                            _addAmountController.text = '';
                            _addDateController.text = '';
                            //close the bottom sheet
                            Navigator.of(context).pop();
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
                              child: Text('Delete'))
                          : Container()
                    ],
                  ),
                ],
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
                      // TextField(
                      //   controller: _addDateController,
                      //   decoration: const InputDecoration(
                      //     labelText: "Select a Date",
                      //     filled: true,
                      //     prefixIcon: Icon(Icons.date_range),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.blue),
                      //     ),
                      //   ),
                      //   enableInteractiveSelection: false,
                      //   // enabled: false,
                      //   onTap: () {
                      //     _selectDatePicker();
                      //   },
                      // ),
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
                            if (id == null) {
                              await _addItem();
                            }
                            // if (id != null) {
                            //   await _updateItem(id);
                            // }
                            // clear the text field
                            _incomeSourceController.text = '';
                            _addAmountController.text = '';
                            _addDateController.text = '';
                            //close the bottom sheet
                            Navigator.of(context).pop();
                          },
                          child: Text('Create New')),
                    ],
                  ),
                ],
              ),
            ));
    _incomeSourceController.clear();
    _addAmountController.clear();
    _addDateController.clear();
  }

  // @override
  // void dispose() {
  //   _incomeSourceController.dispose();
  //   _addAmountController.dispose();
  //   _addDateController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Added History",
                  style: AppStyle.dashboardTitleBoldTextStyle,
                ),
              ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _addAmount.length,
                  itemBuilder: (context, index) => Card(
                        color: Color(0XFF5193BB),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      _addAmount[index]['source_of_income'],
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    _addAmount[index]['add_amount_date_time'],
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Text(
                                    _addAmount[index]['add_amount'],
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                  onPressed: () =>
                                      _showForm(_addAmount[index]['id']),
                                  icon: Icon(Icons.arrow_forward_ios)),
                            )
                          ],
                        ),
                      )),
              // ListView.builder(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 5,
              //   itemBuilder: (BuildContext context, int index) {
              //     return const ListTile(
              //       title: Text("Salary"),
              //       subtitle: Text("10-05-2024"),
              //       trailing: Text("10000"),
              //       style: ListTileStyle.drawer,
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _createForm(null)),
    );
  }

  Future<void> _selectDatePicker() async {
    print("Date time method called");
    DateTime? _addAmountDatePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime.now().subtract(Duration(days: 0)),
    );

    if (_addAmountDatePicked != null) {
      setState(() {
        _addDateController.text = _addAmountDatePicked.toString().split(" ")[0];
      });
    }
  }
}
