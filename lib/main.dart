import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MaterialApp(
    home:DisclaimerPage(),
  ));

  Future.delayed(const Duration(seconds: 5), () {
    runApp(const MaterialApp(
      home: HomePage(),
    ));
  });
}

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Meditation Disclaimer'),
      ),
          body: const Center(
        child: Padding(
        padding:EdgeInsets.all(16.0),
    child: Text(
    'Before you begin your meditation, ensure you are in a comfortable and distraction free environment. Give your full attention to your meditative practice.',
    style: TextStyle(fontSize: 18.0),
    ),
    ),
          ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text('Power of the Mind'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
            label: 'Library'
          ),
        ],
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            //Navigate to home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            // Navigate to the media library
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MediaLibraryPage()),
            );
          }
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('assets/potmlogo.jpeg'),
              decoration:BoxDecoration(
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchURLString('https://powerofthemind.coach/potmapp');
              },
              child: ListTile(
                title: Text(
                  'Terms of Service',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/potmlogo.jpeg'), //add POTM logo image file
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
              children: [
                RoundedButton(
                  buttonText: 'Breath Techniques',
                  mediaList: subset1MediaList,
                  onPressed: (List<Media> mediaList) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibrarySubsetPage1(mediaList: mediaList),
                    ),
                    );
                  },
                ),
                SizedBox(height: 60.0),
                RoundedButton(
                  buttonText: 'Hypnosis Meditations',
                  mediaList: subset2MediaList,
                  onPressed: (List<Media> mediaList) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LibrarySubsetPage2(mediaList: mediaList),
                      ),
                    );
                  },
                ),
                SizedBox(height: 60.0),
                RoundedButton(
                  buttonText: 'Calm Music',
                  mediaList: subset3MediaList,
                  onPressed: (List<Media> mediaList) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LibrarySubsetPage3(mediaList: mediaList),
                      ),
                    );
                  },
                ),
              ],
              ),
            ),
      ],
              ),
            ),
        floatingActionButton: Align(
          alignment:Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 100,
              height: 100,
            child: FloatingActionButton(
              backgroundColor: Colors.white10,
              onPressed: () {
                  launchURLString('https://vimeo.com/932359685?share=copy');
              },
              child: Row(
                children: [
                  Text('Introduction',
                  style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                ],
              ),
            )
            )
          )
        ),
    ),
    );
  }
}

void launchURLString(url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final List<Media> mediaList; // Pass the subset of media as a parameter
  final Function onPressed;

   RoundedButton({super.key,
    required this.buttonText,
    required this.mediaList,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(mediaList);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(0.0)
        ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 22.0),
    )
      ),
    );
  }
}

class MediaLibraryPage extends StatelessWidget {

  // All Media
  static List<Media> mediaList = [
    Media(title: 'Regeneration Meditation', url: 'https://vimeo.com/915777799/6c0f19caea?share=copy', tags: 'meditate'),
    Media(title: 'Calm Meditation', url: 'https://vimeo.com/915777108/ca3e1dea8f?share=copy', tags: 'meditate'),
    Media(title: 'Meditate Meditation', url: 'https://vimeo.com/915776291/a7a7c16b0c?share=copy', tags: 'meditate'),
    Media(title: 'Unwavering Steadiness Meditation', url: 'https://vimeo.com/915018943/570f72fb11?share=copy', tags: 'meditate'),
    Media(title: 'Vitality Meditation', url: 'https://vimeo.com/915014734/52a76d559?share=copy', tags: 'meditate'),
    Media(title: 'Peak Performance Meditation', url: 'https://vimeo.com/915011266/3097eb87a8?share=copy', tags: 'meditate'),
    Media(title: 'Deep Sleep Meditation', url: 'https://vimeo.com/915008178/6e3d9a94be?share=copy', tags: 'meditate'),
    Media(title: 'Flow State Meditation', url: 'https://vimeo.com/915002305/3b0931ebac?share=copy', tags: 'meditate'),
    Media(title: 'Confidence Meditation', url: 'https://vimeo.com/914997809/457b22b72f?share=copy', tags: 'meditate'),
    Media(title: 'Focus Meditation', url: 'https://vimeo.com/914993046/e99bb45020?share=copy', tags: 'meditate'),
    Media(title:'Unlimited Power Meditation', url: 'https://vimeo.com/user110371947/unlimited-power', tags: 'meditate'),
    //cymatic videos^^

    Media(title:'Breathing Introduction', url: 'https://vimeo.com/909248400?share=copy', tags: 'breathe'),
    Media(title:'Ujjayi Breathing Technique', url: 'https://vimeo.com/909253454?share=copy', tags: 'breathe'),
    Media(title:'Alternate Nostrile Breathing', url: 'https://vimeo.com/909261331?share=copy', tags: 'breathe'),
    Media(title:'3 Part Breath', url: 'https://vimeo.com/909270267?share=copy', tags: 'breathe'),
    Media(title:'Retention Breath', url: 'https://vimeo.com/909277445?share=copy', tags: 'breathe'),
    Media(title:'Breath of Fire', url: 'https://vimeo.com/909285247?share=copy', tags: 'breathe'),
    //breath training^^

    Media(title:'Vision Meditation Music | Plutonick', url: 'https://youtu.be/pF0h1LUwuQA?si=NQ55DrLL2kxq5tqy', tags: 'listen'),
    Media(title:'Focus Meditation Music | Whole Tone Trance', url: 'https://youtu.be/8ZeO8lOCprA?si=Or3uPXBcHV_9gK9m', tags: 'listen'),
    Media(title:'Confidence Meditation Music | Chroma', url: 'https://youtu.be/7cd54MWrsRE?si=vdg1d7vGO-K7x-ri', tags: 'listen'),
    Media(title:'Flow State Meditation Music | Drive', url: 'https://youtu.be/wWQnZ4JUtrE?si=Ui3AvXC-Qfp_rgtu', tags: 'listen'),
    Media(title:'Peak Performance Meditation Music | Misty Cloud Forest Samba', url: 'https://youtu.be/8ZeO8lOCprA?si=k5j9YD_ygFmR5DPA', tags: 'listen'),
    Media(title:'Deep Sleep Meditation Music | Sleep', url: 'https://youtu.be/kwTkUQVU3ow?si=pejen1P28i4nBhZP', tags: 'listen'),
    Media(title:'Vitality Meditation Music | Llegaremos Alli', url: 'https://youtu.be/KWQoMkiNmxs?si=qKSHbvQ6nXFJEAJa', tags: 'listen'),
    Media(title:'Unwavering Steadiness Meditation Music | Perpetual', url: 'https://youtu.be/aCUBs2DyjZo?si=1AHcQsEOUgOww1O0', tags: 'listen'),
    Media(title:'Meditate Meditation Music | Resonance', url: 'https://youtu.be/qdwTZ8vnasA?si=eQgL_e1gFBZR5fwu', tags: 'listen'),
    Media(title:'Calm Meditation Music | Elemental', url: 'https://youtu.be/wFbIyf4H59s?si=g18xo4tWvavNMjJt', tags: 'listen'),
    Media(title:'Regeneration Meditation Music | Weightless', url: 'https://youtu.be/QIgHZnOIr5U?si=2ZHnGTz3eChu5Trp', tags: 'listen'),
    //meditation music^^
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Media Library'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (var media in mediaList)
              RoundedMediaButton(
                  mediaTitle: media.title,
                  mediaUrl: media.url
              ),
          ],
        )
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library'
          ),
        ],
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            //Navigate to home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            // Navigate to the media library
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MediaLibraryPage()),
            );
          }
        },
      ),
    );
  }
}

class Media {
  final String title;
  final String url;

  var tags;

  Media({
    required this.title, 
    required this.url, 
    required this.tags,
  });
}

class RoundedMediaButton extends StatelessWidget {
  final String mediaTitle;
  final String mediaUrl;

  const RoundedMediaButton({super.key, required this.mediaTitle, required this.mediaUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlString(mediaUrl,
        mode: LaunchMode.inAppWebView
        ); // Open the media URL with the default media player
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(0.0),
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(CupertinoIcons.play_arrow_solid,
          size:40.0,
          color: Colors.black,
          ),
        SizedBox(height: 8.0),
        Text(
            mediaTitle,
            style: const TextStyle(fontSize: 18.0),
        ),
    ],
      ),
      ),
    );
  }
  void launchURLString(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class LibrarySubsetPage1 extends StatelessWidget {
  final List<Media> mediaList;

LibrarySubsetPage1 ({required this.mediaList});

@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text('Breath Techniques'),
    ),
    body: ListView(
      children: [
        // Displays media buttons based on specific tags
        for (var media in mediaList)
          RoundedMediaButton(
            mediaTitle: media.title,
            mediaUrl: media.url,
          )
      ],
    ),
    backgroundColor: Colors.black,
  );
}
}

class LibrarySubsetPage2 extends StatelessWidget {
  final List<Media> mediaList;

  LibrarySubsetPage2 ({required this.mediaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Hypnosis Meditations'),
        ),
        body: ListView(
          children: [
            // Displays media buttons based on specific tags
            for (var media in mediaList)
              RoundedMediaButton(
                mediaTitle: media.title,
                mediaUrl: media.url,
              )
          ],
        ),
      backgroundColor: Colors.black,
    );
  }
}

class LibrarySubsetPage3 extends StatelessWidget {
  final List<Media> mediaList;

  LibrarySubsetPage3 ({required this.mediaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Calm Music'),
        ),
        body: ListView(
          children: [
            // Displays media buttons based on specific tags
            for (var media in mediaList)
              RoundedMediaButton(
                mediaTitle: media.title,
                mediaUrl: media.url,
              )
          ],
        ),
      backgroundColor: Colors.black,
    );
  }
}

// Auto generated Media Library Subset 1
String desiredTag1 = 'breathe';
List<Media> subset1MediaList = MediaLibraryPage.mediaList.where((media) => media.tags.contains(desiredTag1)).toList();

// Auto generated Media Library Subset 2
String desiredTag2 = 'meditate';
List<Media> subset2MediaList = MediaLibraryPage.mediaList.where((media) => media.tags.contains(desiredTag2)).toList();

// Auto generated Media Library Subset 3
String desiredTag3 = 'listen';
List<Media> subset3MediaList = MediaLibraryPage.mediaList.where((media) => media.tags.contains(desiredTag3)).toList();