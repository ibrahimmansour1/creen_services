import 'package:creen_services/lose_weight/widget/payment_methods_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

bool payWithWebsite = false;
bool payWithBank = false;

class TrainerWidget extends StatefulWidget {
  const TrainerWidget({super.key});

  @override
  State<TrainerWidget> createState() => _TrainerWidgetState();
}

class _TrainerWidgetState extends State<TrainerWidget>
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
    int? selectedMonths;

    return GridView.builder(
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
                  return const FittedBox(
                    child: AlertDialog(
                      title: Text(
                        'اختر وسيلة الدفع',
                        textAlign: TextAlign.center,
                      ),
                      content: PaymentMethodsWidget(),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}