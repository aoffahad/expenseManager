import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Segment> segments = [
    const Segment(value: 25000, color: Colors.purple, label: Text("Total")),
    const Segment(value: 15000, color: Colors.deepOrange, label: Text("Used")),
    const Segment(value: 10000, color: Colors.green, label: Text("Remining")),
  ];

  @override
  Widget build(BuildContext context) {
    bool _animate = true;
    final progressBar = PrimerProgressBar(segments: segments);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.segment_sharp),
          actions: const [Icon(Icons.search)],
          title: Text(
            "Expense Manager",
            style: TextStyle(
                fontFamily: 'Whisper',
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Card
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0XFF043E6E), Color(0XFF2E6E98)])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // AvatarGlow(
                              //   startDelay: const Duration(milliseconds: 1000),
                              //   glowColor: Colors.white,
                              //   glowShape: BoxShape.circle,
                              //   animate: _animate,
                              //   repeat: true,
                              //   curve: Curves.fastOutSlowIn,
                              //   child: const Material(
                              //     elevation: 2.0,
                              //     shape: CircleBorder(),
                              //     color: Colors.transparent,
                              //     child: CircleAvatar(
                              //       backgroundImage:
                              //           AssetImage('images/download.jpeg'),
                              //       radius: 30.0,
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/download.jpeg'),
                                maxRadius: 30,
                                minRadius: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  "Md Omar Faruque Fahad",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Fund:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Used Fund:  ৳",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Remining Fund: 10000 ৳",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: progressBar,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories"),
                      Row(
                        children: [Text("View All"), Icon(Icons.arrow_forward)],
                      )
                    ],
                  ),
                ),
                categories_widget(),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Today's Report:")],
                ),
                // TodaysReport(),
                TodaysReportCard(
                  reportName: 'Food',
                  reportImage: 'images/categories/food.png',
                  todaysExpense: "50.00 \$",
                ),
                TodaysReportCard(
                  reportName: 'Bill',
                  reportImage: 'images/categories/bill.png',
                  todaysExpense: "50.00 \$",
                ),
                TodaysReportCard(
                  reportName: 'Restaurent',
                  reportImage: 'images/categories/restaurant.png',
                  todaysExpense: "50.00 \$",
                ),
                TodaysReportCard(
                  reportName: 'Living Expense',
                  reportImage: 'images/categories/house.png',
                  todaysExpense: "50.00 \$",
                ),
                TodaysReportCard(
                  reportName: 'Health',
                  reportImage: 'images/categories/health.png',
                  todaysExpense: "50.00 \$",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Categories Widget
class categories_widget extends StatelessWidget {
  categories_widget({
    super.key,
  });

  List<CategoriesItem> categoriesList = [
    CategoriesItem(name: 'Food', imageName: 'images/categories/food.png'),
    CategoriesItem(name: 'Bill', imageName: 'images/categories/bill.png'),
    CategoriesItem(
        name: 'Restaurant', imageName: 'images/categories/restaurant.png'),
    CategoriesItem(
        name: 'Living Expense', imageName: 'images/categories/house.png'),
    CategoriesItem(name: 'Health', imageName: 'images/categories/health.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                    color: const Color(0XFF5292BA),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(categoriesList[index].imageName)),
                    Text(
                      categoriesList[index].name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,

                      // maxLines: 2,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/// Today's Report Card (Not Used)

class TodaysReport extends StatelessWidget {
  TodaysReport({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoriesItem> todaysReport = [
      CategoriesItem(
          name: 'Food',
          imageName: 'images/categories/food.png',
          todaysExpense: '\$50'),
      CategoriesItem(
          name: 'Bill',
          imageName: 'images/categories/bill.png',
          todaysExpense: '\$20'),
      CategoriesItem(
          name: 'Restaurant',
          imageName: 'images/categories/restaurant.png',
          todaysExpense: '\$20'),
      CategoriesItem(
          name: 'Living Expense',
          imageName: 'images/categories/house.png',
          todaysExpense: '\$100'),
      CategoriesItem(
          name: 'Health',
          imageName: 'images/categories/health.png',
          todaysExpense: '\$150'),
    ];
    return Container(
        // height: MediaQuery.of(context).size.height,
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: todaysReport.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFF5193BB),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset(todaysReport[index].imageName),
                          ),
                          Text(todaysReport[index].name),
                        ],
                      ),
                      Column(
                        children: [
                          Text(todaysReport[index].todaysExpense!),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

class CategoriesItem {
  final String name;
  final String imageName;
  final String? todaysExpense;

  CategoriesItem(
      {required this.name, required this.imageName, this.todaysExpense});
}

class TodaysReportCard extends StatelessWidget {
  TodaysReportCard(
      {super.key,
      required this.reportName,
      required this.reportImage,
      this.todaysExpense});

  final String reportName;

  final String reportImage;

  final String? todaysExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0XFF5193BB),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    reportImage,
                    colorBlendMode: BlendMode.modulate,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    reportName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todaysExpense!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                  const Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
