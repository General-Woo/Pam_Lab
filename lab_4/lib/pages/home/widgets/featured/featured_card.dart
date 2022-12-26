import 'package:domain/models/featured.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_4/resources/custom_collors.dart';
import 'package:lab_4/resources/text_styles.dart';

class FeaturedCard extends StatelessWidget {
  final Featured featured;
  FeaturedCard({super.key, required this.featured});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      margin: EdgeInsets.only(left: 16, right: 8),
      height: 252,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image(
              height: 252,
              width: 310,
              image: NetworkImage(
                  featured.cover),
                fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                  color: Colors.black.withOpacity(0.2) // 0: Light, 1: Dark
              ),
          ),),
          Positioned.fill(
              left:12,
              bottom: 68,
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(featured.title,
                style: TextStyles.textStyleSourceSansPro20(color: Colors.white, fontWeight: FontWeight.w600)),
          )),
          Positioned.fill(
            bottom: 24,
            left: 12,
            child: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 93,
              height: 36,
              child: TextButton(
                onPressed: () async {
                },
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.geraldine, // Background Color
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
                ),
                child: Text(
                  'Read Now',
                  style: TextStyles.textStyleSourceSansPro14(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
    ),
          )),
        ],
      ),
    );
  }
}
