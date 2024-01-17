import 'package:creen_services/health/widgets/choose_reservation_hospital_type_widget.dart';
import 'package:creen_services/health/widgets/doctor_name_and_rating_widgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

bool showCustomWidget = false;

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DoctorNameAndRatingWidget(),
              Text("مستشفى عام", style: TextStyle(fontSize: 24)),
              Divider(),
              ChooseReservationHospitalType(),
            ],
          ),
        ),
      ),
    );
  }
}
