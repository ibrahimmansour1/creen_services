import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorNameAndRatingWidget extends StatelessWidget {
  const DoctorNameAndRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage:
              NetworkImage('https://picsum.photos/200/300/?random/1'),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const Text('الدكتور محمد'),
            const Text('طبيب أسنان'),
            RatingBar(
              initialRating: 4.5,
              itemSize: 25,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                half: const Icon(Icons.star_half, color: Colors.amber),
                empty: const Icon(Icons.star_border, color: Colors.amber),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ].reversed.toList(),
    );
  }
}
