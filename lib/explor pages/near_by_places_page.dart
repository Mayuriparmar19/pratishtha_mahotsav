import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class NearByPlacesPage extends StatefulWidget {
  const NearByPlacesPage({super.key});

  @override
  State<NearByPlacesPage> createState() => _NearByPlacesPageState();
}

class _NearByPlacesPageState extends State<NearByPlacesPage> {
  String? place = "Bhavnagar";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            height: 5,
            width: 5,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text("Near By Places",
            style: TextStyle(
                fontSize: 19,
                fontFamily: "Droid-Serif",
                fontWeight: FontWeight.bold,
                color: Color(0xFF9E4F01))),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFFFE9B8)],
                ),
                image: DecorationImage(
                    image: AssetImage("assets/images/half_madala_mask.png"),
                    fit: BoxFit.fill)),
            width: double.maxFinite,
            height: height * 0.2,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                      blurRadius: 20,
                      color: Colors.grey),
                ],
              ),
              child: SingleChildScrollView(

                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      // child: CustomTextFormDropDown(
                      //   title: "Select Place",
                      //   isRequired: false,
                      //   value: place,
                      //   items: const ["Bhavnagar"],
                      //   onChanged: (value) => place = value,
                      // ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 15,offset: Offset(0, 2))],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                    flex: 0,
                                    child: Image.asset(
                                        "assets/temp/nearbypageimg.png",
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover)),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Paramagam Mandir",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Roboto-M",
                                              color: Color(0xFF032323),
                                              ),
                                        ),
                                        const Text(
                                          "The Songadh Jain temple is a historical temple...",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 12,
                                            fontFamily: "Roboto-R"
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,
                                                    size: 16),
                                                SizedBox(width: 2,),
                                                Text("Songadh",style: TextStyle(
                                                  fontFamily: "Roboto-R",
                                                  fontSize: 14,
                                                  color: Color(0xFF848484)
                                                )),
                                              ],
                                            ),
                                            Align(
                                              child: IconButton(
                                                onPressed: () async {
                                                  await launchUrl(
                                                  Uri.parse("https://www.google.com/maps/dir//Paramagam Mandir Songadh,,+Gujarat/"),
                                                  mode: LaunchMode.externalApplication,
                                                  );
                                                },
                                                icon: const Icon(Icons.directions,
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
