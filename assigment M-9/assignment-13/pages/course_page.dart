import 'package:flutter/material.dart';
import '../widgets/course_card.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  final List<Map<String, String>> courses = [
    {
      "image": "https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg",
      "batch": "ব্যাচ ১৯",
      "seats": "৮৬ সিট বাকি",
      "days": "৬০ দিন বাকি",
      "title": "Full Stack Web Development with JavaScript (MERN)",
    },
    {
      "image": "https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg",
      "batch": "ব্যাচ ৬",
      "seats": "৬৮ সিট বাকি",
      "days": "৪০ দিন বাকি",
      "title": "Full Stack Web Development with Python, Django & React",
    },
    {
      "image":"https://cdn.ostad.app/course/photo/2024-12-18T15-29-34.261Z-Untitled-1%20(23).jpg",
      "batch": "ব্যাচ ৭",
      "seats": "৭৫ সিট বাকি",
      "days": "৩৯ দিন বাকি",
      "title": "Full Stack Web Development with ASP.Net Core",
    },
    {
      "image": "https://cdn.ostad.app/course/photo/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg",
      "batch": "ব্যাচ ১৩",
      "seats": "৬৫ সিট বাকি",
      "days": "৪৯ দিন বাকি",
      "title": "SQA: Manual & Automated Testing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: courses.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ২ কলাম
          childAspectRatio: 0.70,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        },
      ),
    );
  }
}