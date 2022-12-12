import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/drawer.dart';
// import 'package:scrappy/components/feedback/recentFeedback.dart';
import 'package:scrappy/providers/userProvider.dart';

// import 'feedbackform.dart';

class AboutUsHomePage extends StatelessWidget {
  const AboutUsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(""),
              
              ExpansionTile(
                leading: Icon(Icons.question_mark),
                backgroundColor: Color(0xFF003320),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                collapsedIconColor: Color(0xFF003320),
                title: Text("What is Scrap.py?"),
                textColor: Color.fromARGB(255, 255, 255, 255),
                children: [
                  const Text(""),
                  const Text("Cleaning the environment, one scrap at a time", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Scrap.py is a waste-bank that was created to facilitate the community in managing waste in a sustainable manner. Scrap.py exists as our responsibility to the environment through 3R (reduce, reuse, recycle) activities.", style: TextStyle(color: Colors.white)),
                  const Text(""),
                ],
              ),

              const Text(""),

              ExpansionTile(
                leading: Icon(Icons.recycling),
                backgroundColor: Color(0xFF003320),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                collapsedIconColor: Color(0xFF003320),
                title: Text("Vision and Mission"),
                textColor: Color.fromARGB(255, 255, 255, 255),
                children: [
                  const Text(""),
                  const Text("Our Vision", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text("Providing ethical, independent, and responsible Waste Management Solutions to our community", style: TextStyle(color: Colors.white)),
                  const Text(""),
                  const Text("Our Mission", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text("1. Empowering Waste Segregation", style: TextStyle(color: Colors.white)),
                  const Text(""),
                  const Text("2. Increasing Community Participation in Environmental Management", style: TextStyle(color: Colors.white)),
                  const Text(""),
                  const Text("3. Creating a More Creative, Innovative, Inspirational and Independent Society in the Field of Environmental Management", style: TextStyle(color: Colors.white)),
                  const Text(""),
                ],
              ),

              const Text(""),

              ExpansionTile(
                leading: Icon(Icons.group),
                backgroundColor: Color(0xFF003320),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                collapsedIconColor: Color(0xFF003320),
                title: Text("Our Team"),
                textColor: Color.fromARGB(255, 255, 255, 255),
                children: [
                  const Text(""),
                  const Text("Arkan Alexei Andrei - 2106631463", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Givarrel Veivel Pattiwael - 2106640341", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Laela Putri Salsa Biella - 2106751562", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Abraham Javier Sebastian - 2106704364", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Inez Bungaria Octaviana - 2106751833", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text(""),
                ],
              ),

              const Text(""), 

              ExpansionTile(
                leading: Icon(Icons.phone),
                backgroundColor: Color(0xFF003320),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                collapsedIconColor: Color(0xFF003320),
                title: Text("Contact Us"),
                textColor: Color.fromARGB(255, 255, 255, 255),
                children: [
                  const Text(""),
                  const Text("Instagram : @Scrappy", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Twitter   : @Scrappy", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text("Facebook  : @Scrappy", style: TextStyle(color: Colors.white, fontSize: 24)),
                  const Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
