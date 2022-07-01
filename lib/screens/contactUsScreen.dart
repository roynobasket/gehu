import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContactUs(
        cardColor: const Color(0xDA4285F4),
        textColor: Colors.white,
        logo: const NetworkImage(
            "https://www.gehu.ac.in/content/dam/geu/pdf/notice/geu_logo.png"),
        companyName: 'Graphic Era University',
        companyColor: Colors.black54,
        tagLine: 'Dehradun',
        taglineColor: Colors.black54,
        dividerThickness: 5,
        website: 'https://www.gehu.ac.in/',
        phoneNumber: '+917617770113',
        email: 'gehu.ac.in',
        twitterHandle: 'GraphicEraHill1',
        instagram: 'graphicerahilluniversity',
        linkedinURL: 'https://in.linkedin.com/school/graphicerahilluniversity/',
      ),
    );
  }
}
