import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screen/expense_settings/add_amount/add_amount.dart';

class ExpenseAddDelete extends ConsumerWidget {
  const ExpenseAddDelete({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Material(
                    child: Container(
                      height: 60,
                      color: Colors.white,
                      child: TabBar(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10, left: 10),
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff5193BB).withOpacity(0.2),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Add Amount"),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Add Expense"),
                              ),
                            ),
                          ),
                          // Tab(
                          //   child: Container(
                          //     height: 50,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(30),
                          //         border: Border.all(
                          //             color: Colors.pinkAccent, width: 1)),
                          //     child: const Align(
                          //       alignment: Alignment.center,
                          //       child: Text("Call"),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // ListView.separated(
                        //   padding: EdgeInsets.all(15),
                        //   itemCount: 20,
                        //   separatorBuilder: (BuildContext context, int index) =>
                        //       const Divider(),
                        //   itemBuilder: (context, index) {
                        //     return ListTile(
                        //         onTap: () {},
                        //         title: Text("Chat List $index"),
                        //         subtitle: Text("History"),
                        //         trailing: IconButton(
                        //             onPressed: () {
                        //               print("Button Pressed");
                        //             },
                        //             icon: Icon(Icons.chat_bubble)));
                        //   },
                        // ),
                        const AddAmount(),
                        ListView.separated(
                          padding: EdgeInsets.all(15),
                          itemCount: 20,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                                onTap: () {},
                                title: Text("Status List $index"),
                                subtitle: Text("History"),
                                trailing: IconButton(
                                    onPressed: () {
                                      print("Button Pressed");
                                    },
                                    icon: Icon(Icons.stacked_bar_chart)));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
