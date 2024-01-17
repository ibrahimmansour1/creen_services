import 'package:flutter/material.dart';

bool payWithWebsite = false;
bool payWithBank = false;

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({super.key});

  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
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

  @override
  Widget build(BuildContext context) {
    int? selectedMonths;

    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: toggleWebsitePaymentVisibility,
              child: Column(
                children: [
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/4771/4771399.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.15,
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
                    width: MediaQuery.of(context).size.width * 0.3,
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
                    child: Text('${index + 1} Months ${50 * (index + 1)} SAR'),
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
                          title: const Text('Insufficient Balance'),
                          content: const Text(
                              'You do not have enough balance to make the payment.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الدفع عن طريق المحفظة",
                      style: TextStyle(color: Colors.white),
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
    );
  }
}
