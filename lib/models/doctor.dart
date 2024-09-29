import 'package:lung_ai/models/user_review.dart';

class Doctor {
  final int id;
  final String name;
  final String specialization;
  final String bio;
  final String profileImage;
  final int expertiesLevel; // 1-Beginner, 2-Good, 3-Expert
  final double avgRating;
  final double chargesPerHour;
  final double dicountOffer;
  final int likesCount;
  final List<UserReview> usersReviews;

  Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
    required this.specialization,
    required this.expertiesLevel,
    required this.avgRating,
    required this.chargesPerHour,
    this.dicountOffer = 0,
    this.likesCount = 0,
    this.usersReviews = const [],
  });
}
