import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

bool payWithWebsite = false;
bool payWithBank = false;

class LoseWeightScreen extends StatefulWidget {
  const LoseWeightScreen({Key? key}) : super(key: key);
  @override
  State<LoseWeightScreen> createState() => _LoseWeightScreenState();
}

class _LoseWeightScreenState extends State<LoseWeightScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleWebsitePaymentVisibility() {
    setState(() {
      payWithWebsite = !payWithWebsite;
      payWithBank = false;
    });
  }

  void toggleBankPaymentVisibility() {
    setState(() {
      payWithBank = !payWithBank;
      payWithWebsite = false;
    });
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {}
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var selectedMonths;

    return Scaffold(
      appBar: AppBar(
        title: const Text('انقاص الوزن'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'اشتراكات'),
            Tab(text: 'خدمات'),
            Tab(text: 'المدربين'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Text("اشتراكات"),
          const Text("خدمات"),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FittedBox(
                          child: AlertDialog(
                            title: const Text(
                              'اختر وسيلة الدفع',
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: toggleWebsitePaymentVisibility,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/4771/4771399.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                          ),
                                          const Text(
                                            'الدفع عن طريق الموقع',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: toggleBankPaymentVisibility,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/6963/6963703.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                          ),
                                          const Text(
                                            'حوالة بنكية',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: payWithWebsite,
                                  child: Column(
                                    children: [
                                      const Text("عدد الشهور"),
                                      DropdownButton<int>(
                                        value: selectedMonths,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedMonths = value;
                                          });
                                        },
                                        items: List.generate(12, (index) {
                                          return DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text(
                                                '${index + 1} Months ${50 * (index + 1)} SAR'),
                                          );
                                        }),
                                      ),
                                      MaterialButton(
                                        color: Colors.blue,
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Insufficient Balance'),
                                                  content: const Text(
                                                      'You do not have enough balance to make the payment.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          });
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "الدفع عن طريق المحفظة",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(width: 10),
                                            Icon(
                                              Icons.wallet_giftcard,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: payWithBank,
                                  child: const Column(
                                    children: [
                                      Text("مؤسسة موقع كرين"),
                                      Text("IBAN: SA 1234567891234567891234"),
                                      Divider(),
                                      Text("عدد الشهور"),
                                      Text("صورة الحوالة"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            'https://picsum.photos/200/300/?random/$index',
                            fit: BoxFit.fill,
                          ),
                          Column(
                            children: [
                              const Spacer(),
                              Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.5),
                                padding: const EdgeInsets.all(10),
                                child: const Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'المدربة هاجر',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'اشتراك',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
