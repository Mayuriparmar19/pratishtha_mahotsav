import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'models/videoAlbumModel.dart';
import 'models/videoGalleryModel.dart';
import 'api/api_helper.dart';
import 'customwidgets/customColor.dart';
import 'home_and_profile/customwidgets.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  List videos = [
    {'id': "1", 'url': 'z_eC54VOJDU'},
    {'id': "2", 'url': 'Inc-gFq7MNc'},
    {'id': "3", 'url': 'RQOR9VlYRbY'},
    {'id': "4", 'url': '92C4D3hjS9s'},
    {'id': "5", 'url': 'e16yyXHD1J0'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/icons/back_arrow.svg")),
        centerTitle: false,
        surfaceTintColor: Colors.black.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        title: const Text("Video Gallery",
            style: TextStyle(
                color: Color(0xff9E4F01),
                fontFamily: "Droid-Bold",
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Stack(children: [
        Center(
          child: SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: SvgPicture.asset("assets/images/full_mandala.svg",
                height: size.height * 0.5,
                fit: BoxFit.fill,
                color: const Color(0xFF8E0B0B).withOpacity(0.5)),
          ),
        ),
        FutureBuilder(
            future: ApiHelper.getVideosAlbumCall(),
            builder: (context, AsyncSnapshot<VideoAlbumModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data!.rows!.length,
                    itemBuilder: (context, aindex) {
                      return Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20.0,
                              offset: const Offset(
                                0,
                                0,
                              ),
                            )
                          ],
                        ),
                        child: Material(
                          color: const Color(0xFFFEF6DE),
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: const Color(0xff000000),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  //color: Colors.black,
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/image_place_holder.png'),
                                          radius: 22,
                                          // foregroundImage: NetworkImage(snapshot
                                          //     .data!.rows![aindex].image
                                          //     .toString()),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                            snapshot.data!.rows![aindex].title
                                                .toString(),
                                            style: customFonts(
                                                fSize: 16,
                                                family: "Roboto-M",
                                                color: aboutColor)),
                                      ],
                                    ),
                                    Text("View All",
                                        style: customFonts(
                                            fSize: 14,
                                            color: textColor,
                                            family: "Roboto-R"))
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  height: size.height * 0.18,
                                  child: FutureBuilder(
                                      future: ApiHelper.getVideosCall(
                                          id: snapshot.data!.rows![aindex]
                                              .videoAlbumId),
                                      builder: (context,
                                          AsyncSnapshot<VideoGalleryModel>
                                              snapshot1) {
                                        if (snapshot1.hasData) {
                                          return ListView.builder(
                                              itemCount:
                                                  snapshot1.data!.rows!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.02,
                                                      vertical:
                                                          size.height * 0.01),
                                                  decoration: BoxDecoration(
                                                      // image: DecorationImage(
                                                      //   image: NetworkImage(),
                                                      //   fit: BoxFit.fill,
                                                      // ),
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: size.height * 0.13,
                                                  width: size.width * 0.25,
                                                );
                                              });
                                        } else {
                                          return Center(
                                            child: Text(
                                              "No Photos available",
                                              style: customFonts(
                                                  fSize: 16,
                                                  family: "Roboto-R",
                                                  color: aboutColor),
                                            ),
                                          );
                                        }
                                      }))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: textColor,
                  ),
                );
              }
            })
      ]),
    );
  }
}
// Scaffold(
// extendBodyBehindAppBar: true,
// appBar: AppBar(
// leading: InkWell(
// onTap: () {
// Navigator.pop(context);
// },
// child: SvgPicture.asset("assets/icons/back_arrow.svg")),
// centerTitle: false,
// surfaceTintColor: Colors.black.withOpacity(0.2),
// backgroundColor: Colors.transparent,
// title: const Text("Video Gallery",
// style: TextStyle(
// color: Color(0xff9E4F01),
// fontFamily: "Droid-Bold",
// fontSize: 20,
// fontWeight: FontWeight.bold)),
// ),
// body: GridView.builder(
// itemCount: videos.length,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// ),
// itemBuilder: (context, index) {
// return SizedBox(
// height: size.height * 0.20,
// width: size.height * 0.20,
// child: InkWell(
// onTap: () => Navigator.of(context).push(MaterialPageRoute(
// builder: (context) =>
// VideoGallery(videoId: videos[index]['url']),
// )),
// child: Padding(
// padding: const EdgeInsets.all(6.0),
// child: Image.network(
// YoutubeThumbnail(youtubeId: videos[index]['url']).hd(),
// fit: BoxFit.fill),
// )),
// );
// }),
// )
