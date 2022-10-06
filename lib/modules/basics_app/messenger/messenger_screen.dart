import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://www.google.com/search?q=mo+salah&sxsrf=ALiCzsaAdPPj8lehRPJc-F9JL4wdSjMi9A:1655566469710&tbm=isch&source=iu&ictx=1&vet=1&fir=vRGESTcjfDFzSM%252CW52u_XWeb8_uMM%252C%252Fm%252F0j3r_bk%253BvlOb7rN8WIjPSM%252Cd5sr1liL_2n6rM%252C_%253BK__hiA0bH4nZ5M%252CJlResFtXO6gZGM%252C_%253BNu0LGSKL9YDr_M%252Cw5NHT-qkonLNCM%252C_%253B37VBe3unysQurM%252CtCyIl6_G-tlopM%252C_%253BVUxJXhV7g-qLgM%252Cthj9Nr0zeBOPDM%252C_&usg=AI4_-kT9EbKq5dbD62-N0_WEG6YINIgN6g&sa=X&ved=2ahUKEwjIs9Daqbf4AhXRiP0HHWVvB4kQ_B16BAhbEAE#imgrc=vRGESTcjfDFzSM'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        titleSpacing: 20.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                  itemBuilder: (context, index)
                  {
                    return buildStoryItem();
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0,
                ),
                itemBuilder: (context, index)
                {
                  return buildItem();
                },
                itemCount: 3,
              ),
              ////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://www.google.com/search?q=%D9%85%D8%AD%D9%85%D8%AF+%D8%B5%D9%84%D8%A7%D8%AD&sxsrf=ALiCzsbg77fUVR2f8dAgtR3zkWNXqzmmXA:1655577664450&tbm=isch&source=iu&ictx=1&vet=1&fir=PyCWn2QwkE5cwM%252CGWIRY5UUhi0aOM%252C_%253B760Nva9xLOtgiM%252CwBaZqu9sprwRbM%252C_%253B-jmKo8IuVBHnpM%252C7re4lEB2yQLeVM%252C_&usg=AI4_-kTU8jjlqCLb_AQweJbc-Ammxu8oqw&sa=X&ved=2ahUKEwiNo9m007f4AhVByRoKHYWvCdAQ_h16BAhLEAE#imgrc=1kpGm6sp4yzZ1M'),
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),

            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        const Text(
          'Mostafa Mohamed Ahmed Abd Elghany',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
  Widget buildItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://www.google.com/search?q=%D9%85%D8%AD%D9%85%D8%AF+%D8%B5%D9%84%D8%A7%D8%AD&sxsrf=ALiCzsbg77fUVR2f8dAgtR3zkWNXqzmmXA:1655577664450&tbm=isch&source=iu&ictx=1&vet=1&fir=PyCWn2QwkE5cwM%252CGWIRY5UUhi0aOM%252C_%253B760Nva9xLOtgiM%252CwBaZqu9sprwRbM%252C_%253B-jmKo8IuVBHnpM%252C7re4lEB2yQLeVM%252C_&usg=AI4_-kTU8jjlqCLb_AQweJbc-Ammxu8oqw&sa=X&ved=2ahUKEwiNo9m007f4AhVByRoKHYWvCdAQ_h16BAhLEAE#imgrc=1kpGm6sp4yzZ1M'),

                child: Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mostafa Abd Elghany',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Hello my name\'s mostafa',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text(
                      '08:00 am',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

}
