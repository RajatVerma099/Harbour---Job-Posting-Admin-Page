import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harbour/tools/navigation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'home_page.dart';



class GetJobReady extends StatelessWidget {
  final List<String> mainTitles = [
    'Dynamic Programming',
    'Query Languages',
    'Programming Languages',
    'Computer Networking',
    'Operating System',
    'Aptitude with Reasoning',
    'Be a Dev',
    'AI / ML',
    'Future Techs',
  ];

  final List<List<VideoInfo>> videoData = [
    [
      VideoInfo(
        title: 'Take U Forward by Striver',
        subtitle: 'The playlist aims to teach you Dynamic Programming in depth. The focus of the playlist is to cover all the concepts, and then follow it up with a lot of problems so that the concepts go into your head and stay there.The focus is on logic, so no matter in which language you code, you can easily convert it into code, as we will be writing the pseudocode while teaching.',
        link: 'https://youtu.be/tyB0ztf0DNY?si=iJ-79OC5fVd2YeFK',
      ),
      VideoInfo(
        title: 'DP by Aditya Verma',
        subtitle: 'The playlist explains DP in a consise way. Explaining how to approach a dynamic programming problem and moreover how to identify it first',
        link: 'https://youtu.be/nqowUJzG-iM?si=7fy0ylleVCZ5cvZe',
      ),
      VideoInfo(
        title: 'Code help by Babbar Sir',
        subtitle: 'Message by sir :)\nMnn to boht krega ki chor yrr apne se nahi hoga ya maza nahi aara, Just ask 1 question "Why I started"',
        link: 'https://youtu.be/PGsgv6nXhLw?si=NXQjG4AJLsFC1dpV',
      ),
      VideoInfo(
        title: 'I Deserve',
        subtitle: 'Programming Interviews\' Dynamic Programming Problems',
        link: 'https://youtu.be/U4yPae3GEO0?si=Ozm51l9AvwmugEbN',
      ),
      VideoInfo(
        title: 'Code story with MIK',
        subtitle: 'In this playlist we will solve and understand popular problems on DP asked by Top Companies like Amazon, Meta, Google, Microsoft, Adobe, Netflix, and many more ...',
        link: 'https://youtu.be/smTnSl6UKi0?si=oihhK9KDHFXw-xar',
      ),

    ],
    [
      VideoInfo(
        title: 'Structured Query Language By Gate Smashers',
        subtitle: 'Gate Smashers is India\'s no 1 Free education platform for those aspirants who want to just smash the entrance exam like GATE,UGC NET,KVS,NVS,HTET,CTET etc in Computer Science but they are lagging behind due to lack of proper guidance.      This channel is a brainchild of Varun Singla and Naina Wadhwa Singla,they have added smartwork into the long journey of hardwork of students.',
        link: 'https://youtu.be/323H_mOOWQ4?si=ZWgVIYa98EdMpC0O',
      ),
      VideoInfo(
        title: 'PostgreSQL Course by Manish Sharma',
        subtitle: 'Whether you\'re new to PostgreSQL or you\'re already familiar with it, this course will provide you with the knowledge and skills you need to become proficient in using this popular database management system.',
        link: 'https://youtu.be/4wYs94EqeKE?si=0LPvB1ts6Ce2j8b5',
      ),
      VideoInfo(
        title: 'MySQL With Python And Data Science',
        subtitle: 'One of the most concise and apt course for mysql.',
        link: 'https://youtu.be/us1XyayQ6fU?si=DzE0M8da8mozikZt',
      ),

    ],
    [
      VideoInfo(
        title: 'Java (core) by Telusko ',
        subtitle: 'A complete playlist having course notes in the description itself :)',
        link: 'https://youtu.be/bm0OyhwFDuY?si=62jRhv-7BZr-SU_j',
      ),
      VideoInfo(
        title: 'Python by Telusko ',
        subtitle: 'Python is one of the best programming language and easy to learn. Python is used in Machine Learning, Data Science, Big Data, Web Development, Scripting.',
        link: 'https://youtu.be/QXeEoD0pB3E?si=Y0WcpX6BOw-J6Pd1',
      ),

      VideoInfo(
        title: 'JS By Thapa Sir ',
        subtitle: 'Complete JavaScript Tutorial for Beginners in Hindi in 2024. We will cover Basic to Advanced JavaScript, Modern JavaScript, and OOPS in JavaScript in Hindi. ',
        link: 'https://youtu.be/KGkiIBTq0y0?si=7Ekn_ZGBMJiuvrOz',
      ),
      VideoInfo(
        title: 'C by Apna College ',
        subtitle: 'C Language Tutorial for Beginners (with Notes & Practice Questions) ',
        link: 'https://youtu.be/irqbmMNs2Bo?si=YlFGmd7Jhj-DuRrN',
      ),
      VideoInfo(
        title: 'C++ Full Course ',
        subtitle: 'Complete C++ Placement Course with DSA  ',
        link: 'https://youtu.be/z9bZufPHFLU?si=U69VyXZ7dCauJOC1',
      ),
    ],
    [
      VideoInfo(
        title: 'Neso Academy\'s Computer Networks',
        subtitle: 'It\'s one of the finest and free playlist to grasp deep concepts of CNs.   ',
        link: 'https://youtu.be/VwN91x5i25g?si=7nL8hoDrkBp59Czi',
      ),
    ],
    [
      VideoInfo(
        title: 'Operating System',
        subtitle: 'Watch Jenny Ma\'am\'s lectures to get deep insights in OS and her yt page has much more to explore',
        link: 'https://youtu.be/RozoeWzT7IM?si=JQTlILkBc-Xjn3ME',
      ),
    ],
    [
      VideoInfo(
        title: 'Coding Ninjas - Aptitude For Placements  ',
        subtitle: 'Have trouble getting ready for your placement? Would you like a preparation guide for aptitude tests? Now you can advance your learning of aptitude preparation with our Lesson 1 of the Aptitude placement series.',
        link: 'https://youtu.be/YUq-UgZ0dis?si=Y6rJgnEeCBzxvvtZ',
      ),
      VideoInfo(
        title: 'Aptitude Preparation for Placements',
        subtitle: 'A complete playlist - Aptitude for Campus Placement TCS/Wipro/Infosys and all other',
        link: 'https://youtu.be/hlyal4sR0m8?si=egBsr0ui3QZ54vaB',
      ),
    ],
    [
      VideoInfo(
        title: 'Web Development Course',
        subtitle: 'World\'s most premium Web Development Course',
        link: 'https://youtu.be/l1EssrLxt7E?si=hPRpgbTjeZina1Gw',
      ),
      VideoInfo(
        title: 'MERN Stack',
        subtitle: 'MongoDB, Express. js, React. js, and Node. js',
        link: 'https://youtu.be/fSmp7Cv-c_0?si=qAK4OUcImEdoa3TX',
      ),
      VideoInfo(
        title: 'MERN StackMEAN Stack Full Course',
        subtitle: 'We will start this complete MEAN Stack training with angular js, which is a front-end Development tool for Creating web applications. We will cover topics like features of angular, architecture, components, and many more. Next, we will cover Node js which is a JavaScrit runtime that allows developers to write server-side code in JavaScript. In node js, we will cover topics like NPM, REST API, and Node.js Authentication With JWT. Moving ahead, we will see Express js. Express is a lightweight framework that allows developers to create server-side web applications quickly and easily. ',
        link: 'https://youtu.be/48SUuk8e55c?si=k_oaLJKsK2EJsI2C',
      ),
    ],
    [
      VideoInfo(
        title: 'Complete Machine Learning',
        subtitle: 'It\'s acomplete road map to be a expert in python programming.',
        link: 'https://youtu.be/bPrmA1SEN2k?si=UuxCetitCiwrKw4J',
      ),
      VideoInfo(
        title: 'Machine Learning Full Course with Practical (6 Hours)',
        subtitle: 'In this Machine Learning tutorial for beginners from WsCube Tech, you will learn basics about machine learning with practical examples for better understanding.Machine Learning (ML) is included in day-to-day life and for staying updated. It will improve the working process of the computer algorithm.',
        link: 'https://youtu.be/O0Ka_nBRtN0?si=-Qbm_emhm2-8_V1U',
      ),
    ],
    [
      VideoInfo(
        title: 'Data Science Course',
        subtitle: 'Data scientist has become the most popular job in the market today and there is a huge career scope if you know how to do data science. ',
        link: 'https://youtu.be/JL_grPUnXzY?si=jY5Cgf_J_ywN6HzJ',
      ),
      VideoInfo(
        title: 'DevOps Bootcamp',
        subtitle: 'Check out the complete DevOps bootcamp consisting of outstanding content to get you from beginner to advance in the field. Get remote work opportunities with 40+ LPA base packages and help with contributing to large scale open source projects.',
        link: 'https://youtu.be/ZbG0c87wcM8?si=NQ_A1V8qKrz2MrsT',
      ),
      VideoInfo(
        title: 'Cloud Computing Course ',
        subtitle: 'n this cloud computing full course tutorial, you will learn cloud computing from end to end. This cloud computing tutorial for beginners has got everything from scratch so that even if you are a beginner you find it easy to grasp the concepts explained in this video.',
        link: 'https://youtu.be/gIWel4gFZaY?si=XcssBX8b8H-_AmgU',
      ),
      VideoInfo(
        title: 'Big Data & Hadoop Full Course',
        subtitle: 'This Edureka Big Data & Hadoop Full Course video will help you understand and learn Hadoop concepts in detail. This Big Data & Hadoop Tutorial is ideal for both beginners as well as professionals who want to master the Hadoop Ecosystem',
        link: 'https://youtu.be/1vbXmCrkT3Y?si=1zT1BZAXbMz2tsqY',
      ),
      VideoInfo(
        title: ' Learn Cybersecurity In 11 Hours',
        subtitle: 'This Simplilearn video on "Cyber Security Full Course" will help you understand and learn the fundamentals of Cyber Security. This Cyber Security Tutorial is ideal for both beginners as well as professionals who want to master the Cyber Security concepts',
        link: 'https://youtu.be/g-h0r85Dp2Y?si=Pwz4CnNSHZHX6JSP',
      ),


    ]

  ];

   GetJobReady({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black), // Back button icon
            onPressed: () {
              goBack(context) ;// Navigate back to the previous screen
            },
          ),
        title: Text(
          'Get Job Ready',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20, // Slightly larger font size
              color: Colors.black, // Change text color for better contrast
              fontWeight: FontWeight.bold, // Make the text bold for emphasis
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/img/job_ready_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Your existing Container with the CarouselSlider
          Container(
            color: Colors.transparent, // Make container transparent
            child: CarouselSlider.builder(
              itemCount: mainTitles.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                aspectRatio: 16 / 9,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.vertical,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return VerticalCarousel(
                  mainTitle: mainTitles[index],
                  videoData: videoData[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class VerticalCarousel extends StatelessWidget {
  final String mainTitle;
  final List<VideoInfo> videoData;

  const VerticalCarousel({super.key, 
    required this.mainTitle,
    required this.videoData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 8.0),
        CarouselSlider.builder(
          itemCount: videoData.length,
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return VideoCard(
              videoInfo: videoData[index],
            );
          },
        ),
      ],
    );
  }
}

class VideoCard extends StatelessWidget {
  final VideoInfo videoInfo;

  const VideoCard({super.key, 
    required this.videoInfo,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoInfo.link) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoInfo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  videoInfo.subtitle,
                  style: const TextStyle(fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoInfo {
  final String title;
  final String subtitle;
  final String link;

  VideoInfo({
    required this.title,
    required this.subtitle,
    required this.link,
  });
}
