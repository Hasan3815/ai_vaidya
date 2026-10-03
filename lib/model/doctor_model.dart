class DoctorModel {
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String reviews;
  final String imageUrl;
  final String availability;
  final bool isAvailableNow;

  final String about;
  final String qualification;
  final String hospital;
  final String languages;
  final String fee;

  const DoctorModel({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.availability,
    required this.isAvailableNow,
    this.about =
        'Dr. Leslie Alexander is a dedicated and experienced doctor with over a decade of practice. She is committed to providing comprehensive care and promoting health through patient education and advanced treatment options.',
    this.qualification = 'MD, FACC - Stanford University School of Medicine',
    this.hospital = 'City General Hospital',
    this.languages = 'English, Spanish',
    this.fee = '\$150 per session',
  });
}