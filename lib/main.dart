import 'package:creen_services/health_screen.dart';
import 'package:creen_services/lose_weight_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'الخدمات'),
            Tab(text: 'الاشتراكات'),
            Tab(text: 'خدماتي'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'محمد عبدالله',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' الرصيد المتاح',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const Text(
                '26324.75 SAR',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: const Text('النقاط'),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: const Text('سحب'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'شحن الرصيد',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'مدى',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Mada_Logo.svg/1200px-Mada_Logo.svg.png',
                                          width: 80,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'ماستر كارد',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png',
                                          width: 80,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'فيزا',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1000px-Visa_Inc._logo.svg.png',
                                          width: 80,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'أبل باي',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.network(
                                          'https://iconape.com/wp-content/uploads/1/12/Apple-Pay-Logo-0%D9%A3.png',
                                          width: 80,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    debugPrint('stc pay');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Stc Pay',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 30),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.network(
                                            'https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/e2/0b/97/e20b9754-541c-3352-d83d-84c40decf641/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/512x512bb.jpg',
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: const Text('شحن'),
                  ),
                ],
              )
            ],
          ),
          const Center(child: Text('الاشتراكات')),
          GridView.count(
            crossAxisCount: 3,
            childAspectRatio: .8,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(servicesImage.length, (index) {
              final imageUrl = servicesImage[index];
              final label = servicesName[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => servicesScreen[index],
                  ),
                ),
                child: GridTile(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              imageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20.0)
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 100),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              label,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

List<Widget> servicesScreen = [
  const HealthScreen(),
  const LoseWeightScreen(),
  const HealthScreen(),
];
List<String> servicesImage = [
  'assets/images/bueaty.jpeg',
  'assets/images/lose_weight.jpeg',
  'assets/images/health.jpeg',
  'assets/images/fashion.jpeg',
  'assets/images/human_development.jpeg',
  'assets/images/body_building.jpeg',
  'assets/images/resturants.jpeg',
  'assets/images/delivery.jpeg',
  'assets/images/shipping.jpeg',
  'assets/images/book_flight.jpeg',
  'assets/images/terriosm.jpeg',
  'assets/images/taxi.jpeg',
  'assets/images/education.jpeg',
  'assets/images/hotels.jpeg',
  'assets/images/settings.jpeg',
];
List<String> servicesName = [
  "الجمال",
  "انقاص وزن",
  "الصحة",
  "الموضة",
  "تنمية بشرية",
  "بناء الجسم",
  "مطاعم",
  "توصيل طلبات",
  "شحن",
  "حجز طيران",
  "سياحة",
  "تكسي",
  "كورسات",
  "فنادق",
  "الإعدادات",
];
