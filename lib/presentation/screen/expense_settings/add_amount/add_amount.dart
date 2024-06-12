import 'package:cherry_toast/cherry_toast.dart';
import 'package:expense_manager/presentation/screen/expense_settings/add_amount/provider/provider.dart';
import 'package:expense_manager/presentation/global_widget/custom_elevated_button.dart';
import 'package:expense_manager/presentation/global_widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/validation_services.dart';
import '../../../global_widget/custom_date_picker.dart';
import '../../../global_widget/date_helper.dart';
import '../../../../theme/app_style.dart';

class AddAmount extends ConsumerWidget {
  const AddAmount({super.key});

  static final TextEditingController _addAmount = TextEditingController();
  static final TextEditingController _incomeSource = TextEditingController();
  static final TextEditingController _addDate = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Source of Income: ',
                  style: AppStyle.font16Weight400Black,
                ),
                CustomTextField(
                  controller: _incomeSource,
                  hintText: "Add a income source",
                  textInputType: TextInputType.number,
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
                  controller: _addAmount,
                  hintText: "Add the number of amount",
                  textInputType: TextInputType.number,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Date", style: AppStyle.font16Weight400Black),
                FormField(builder: (FormFieldState state) {
                  return CustomDatePicker(
                    addExpenseDateProvider,
                    readOnly: true,
                    buttonCallback: () => DateHelpers.selectDate(
                        context, ref, addExpenseDateProvider),
                    validator: () => Validators.datePickerValidator(
                        ref.watch(addExpenseDateProvider)),
                  );
                }),
              ],
            ),
            CustomElevatedButton(
                text: "Add Amount",
                buttonCallback: () {
                  CherryToast.success(
                          title: const Text("Amount Added",
                              style: TextStyle(color: Colors.black)))
                      .show(context);
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Added History",
                style: AppStyle.dashboardTitleBoldTextStyle,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text("Salary"),
                  subtitle: Text("10-05-2024"),
                  trailing: Text("10000"),
                  style: ListTileStyle.drawer,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
