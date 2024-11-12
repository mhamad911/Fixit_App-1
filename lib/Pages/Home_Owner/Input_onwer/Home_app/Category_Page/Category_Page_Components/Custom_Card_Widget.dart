import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled14/Pages/Home_Owner/Input_onwer/Home_app/task_page.dart';

class CustomCard extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String category;
  final String local;

  const CustomCard({
    Key? key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Image with shadow and rounded border
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: image,
                  ),
                ),
                SizedBox(width: 12),
                // Name and Category
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.libreCaslonText(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        category,
                        style: GoogleFonts.libreCaslonText(
                          fontSize: screenWidth * 0.03,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Star Rating Display
                Row(
                  children: List.generate(4, (index) {
                    return Icon(Icons.star, color: Colors.green, size: screenWidth * 0.04);
                  })..add(Icon(Icons.star, color: Colors.grey, size: screenWidth * 0.04)),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Description
            Text(
              desc,
              style: GoogleFonts.libreCaslonText(
                fontSize: screenWidth * 0.035,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16),
            // Location, Email, and Phone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithText(
                  icon: Icons.location_on,
                  text: local,
                  screenWidth: screenWidth,
                ),
                IconWithText(
                  icon: Icons.email_rounded,
                  text: email,
                  screenWidth: screenWidth,
                ),
                IconWithText(
                  icon: Icons.phone_android_rounded,
                  text: number,
                  screenWidth: screenWidth,
                ),
              ],
            ),
            SizedBox(height: 16),
            // "Hire Again" Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Task page
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Taskpage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6A3BA8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Hire Again',
                  style: GoogleFonts.libreCaslonText(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display Icon and Text with responsive font size
class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double screenWidth;

  IconWithText({required this.icon, required this.text, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(0xff9747FF), size: screenWidth * 0.04),
        SizedBox(width: 5),
        Container(
          width: screenWidth * 0.3,  // Limits text width for responsiveness
          child: Text(
            text,
            style: GoogleFonts.libreCaslonText(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.03,
              color: Color(0xff7F7F7F),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}


