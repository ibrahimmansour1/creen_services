import 'package:flutter/material.dart';

class ClinicItemWidget extends StatelessWidget {
  const ClinicItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                                'عيادة السلام',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'العنوان',
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
        );
      },
      itemCount: 10,
    );
  }
}
