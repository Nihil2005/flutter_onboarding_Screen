import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Pages of the onboarding screen
                OnboardingPage(
                  imagePath: '',
                  title: 'Welcome to Our App',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
                  isLastPage: false, // Set to false for the first two pages
                ),
                OnboardingPage(
                  imagePath: '',
                  title: 'Discover New Features',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
                  isLastPage: false, // Set to false for the second page
                ),
                OnboardingPage(
                  imagePath: '',
                  title: 'Get Started Now',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.',
                  isLastPage: true, // Set to true for the last page
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Dot Indicator
          DotIndicator(
            numPages: 3, // Change this to the total number of pages
            currentPage: _currentPage,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  const OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.5, // Adjust image size according to your preference
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        if (isLastPage) SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Navigate to the home screen
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          child: Text('Get Started'),
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int numPages;
  final int currentPage;

  const DotIndicator({
    required this.numPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        numPages,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
