import 'package:creen_services/lose_weight/widget/trainer_widget.dart';
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
        children: const [
          Text("اشتراكات"),
          Text("خدمات"),
          TrainerWidget(),
        ],
      ),
    );
  }
}
