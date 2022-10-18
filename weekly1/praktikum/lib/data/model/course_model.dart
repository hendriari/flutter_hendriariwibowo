class CourseModel {
  final String courseImage;
  final String courseName;
  final int? totalCourse;
  final String? level;

  CourseModel({
    required this.courseImage,
    required this.courseName,
    this.totalCourse,
    this.level,
  });
}
