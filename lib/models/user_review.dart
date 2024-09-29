class UserReview {
  int id;
  int patientId;
  double raitings;
  String comments;

  UserReview(this.comments,
      {required this.id, required this.patientId, required this.raitings});
}
