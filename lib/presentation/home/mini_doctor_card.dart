import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:lung_ai/models/doctor.dart';
import 'package:lung_ai/shared/theme_colors.dart';

class MiniDoctorCard extends StatelessWidget {
  final Doctor doctor;
  const MiniDoctorCard({super.key, required this.doctor});

  String formatDiscountedPrice(double chargesPerHour, double discountOffer) {
    // Calculate the discounted price
    int discountedPrice =
        (chargesPerHour - ((chargesPerHour * discountOffer) / 100)).ceil();

    // Format the price with comma separators and no decimal points
    final formatter = NumberFormat('#,##,###');
    return 'Rs. ${formatter.format(discountedPrice)}';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: width * 0.09),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Card without Likes and Experience-Level Chip
          Container(
            width: width * 0.55,
            height: height * 0.34,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteBG,
            ),
            child: Column(
              children: [
                // Doctor Image
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          doctor.profileImage,
                        ),
                      ),
                    ),
                  ),
                ), // Doctor Image End

                // Name, Specialization, Prices
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name and Specialization
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "(${doctor.specialization})",
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ), // Name and Specialization End

                      // Charges per Hour
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Discounted Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatDiscountedPrice(
                                    doctor.chargesPerHour, doctor.dicountOffer),
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '/hr',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          // Original Price
                          Row(
                            children: [
                              Text(
                                formatDiscountedPrice(doctor.chargesPerHour, 0),
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const Text(
                                '/hr',
                                style: TextStyle(
                                  fontSize: 7,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ), // Charges per Hour End
                    ],
                  ),
                ), // Name, Specialization, Prices End

                // Raiting and CTA
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: doctor.avgRating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Colors.orange[500],
                        ),
                        itemCount: 5,
                        itemSize: 15,
                        unratedColor: Colors.grey[300],
                        direction: Axis.horizontal,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: secondaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(width),
                          ),
                          child: const Text(
                            "Book Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ), // Raiting and CTA End

                //
              ],
            ),
          ),

          Positioned(
            top: 20,
            right: -width * 0.07,
            child: Column(
              children: [
                Container(
                  width: width * 0.175,
                  height: height * 0.04,
                  decoration: BoxDecoration(
                    color: whiteBG,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: accentColor, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [accentPink, secondaryColor, accentColor],
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        doctor.likesCount.toString(),
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                doctor.expertiesLevel == 1
                    ? Container(
                        width: width * 0.175,
                        height: height * 0.04,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: whiteBG, width: 1),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "New",
                          style: TextStyle(
                            color: whiteBG,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : doctor.expertiesLevel == 2
                        ? Container(
                            width: width * 0.175,
                            height: height * 0.04,
                            margin: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: whiteBG, width: 1),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Good",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Container(
                            width: width * 0.175,
                            height: height * 0.04,
                            margin: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  accentPink,
                                  secondaryColor,
                                  accentColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: whiteBG, width: 1),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Expert",
                              style: TextStyle(
                                color: whiteBG,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
