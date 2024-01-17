import 'package:flutter/material.dart';

class ChooseReservationHospitalType extends StatefulWidget {
  const ChooseReservationHospitalType({super.key});

  @override
  State<ChooseReservationHospitalType> createState() =>
      _ChooseReservationHospitalTypeState();
}

bool showCustomWidget = false;

class _ChooseReservationHospitalTypeState
    extends State<ChooseReservationHospitalType> {
  @override
  Widget build(BuildContext context) {
    return !showCustomWidget
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Radio(
                    value: 1,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  const Text('حجز موعد في العيادة'),
                ].reversed.toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Radio(
                    value: 2,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  const Text('حجز موعد اونلاين'),
                ].reversed.toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Radio(
                    value: 3,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  const Text('استشارة سريعة'),
                ].reversed.toList(),
              ),
              const SizedBox(height: 20),
              const Text('اختر الموعد المناسب',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              TextFormField(
                decoration: const InputDecoration(
                  // labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    showCustomWidget = true;
                  });
                },
                color: Colors.green,
                child: const Text(
                  'حجز موعد',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.network(
                    'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678120-calendar-clock-512.png',
                    height: 100,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('تم حجز موعد لك في العيادة في ١٠/١٠/٢٠٢١',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
