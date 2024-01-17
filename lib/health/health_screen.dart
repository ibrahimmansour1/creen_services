import 'package:creen_services/health/doctor_screen.dart';
import 'package:creen_services/health/widgets/clinic_item_widget.dart';
import 'package:creen_services/health/widgets/doctor_item_widget.dart';
import 'package:creen_services/health/widgets/hospital_item_widget.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);
  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen>
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
        title: const Text('الصحة'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'مستشفيات'),
            Tab(text: 'عيادات'),
            Tab(text: 'أطباء'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HospitalItemWidget(),
          ClinicItemWidget(),
          DoctorItemWidget(),
        ],
      ),
    );
  }
}
