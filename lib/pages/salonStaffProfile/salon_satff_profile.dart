import 'package:expandable_text/expandable_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/pages/screens.dart';
import 'package:salon/widget/column_builder.dart';

class SalonStaffProfile extends StatefulWidget {
  final Object tag;
  final String salonImage;
  final String salonName;
  final String image;
  final String name;
  final String work;
  const SalonStaffProfile(
      {Key key,
      this.salonImage,
      this.salonName,
      this.image,
      this.name,
      this.work,
      this.tag})
      : super(key: key);

  @override
  _SalonStaffProfileState createState() => _SalonStaffProfileState();
}

class _SalonStaffProfileState extends State<SalonStaffProfile> {
  double height;
  double width;
  bool isFavorite = false;
  GoogleMapController mapController;
  final Set<Marker> marker = {};

  final photosList = [
    {'image': 'assets/hairstyle/hairstyle1.png'},
    {'image': 'assets/hairstyle/hairstyle2.png'},
    {'image': 'assets/hairstyle/hairstyle3.png'},
    {'image': 'assets/hairstyle/hairstyle4.png'},
    {'image': 'assets/hairstyle/hairstyle4.png'},
  ];

  final reviewList = [
    {
      'image': 'assets/users/user1.png',
      'name': 'Mitali John',
      'rating': 4,
      'time': '2 min',
      'review':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Raj Mehta',
      'rating': 3,
      'time': '2 days',
      'review':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          staffMemberDetail(),
          aboutDetail(),
          divider(),
          openingHours(),
          divider(),
          location(),
          divider(),
          photos(),
          divider(),
          review(),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  staffMemberDetail() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: height * 0.31,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.salonImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: height * 0.25,
                      color: blackColor.withOpacity(0.2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: whiteColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: isFavorite
                                      ? const Text('Item add to favorite')
                                      : const Text('Item remove from favorite'),
                                ),
                              );
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160,
              left: 158,
              child: Hero(
                tag: widget.tag,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 2),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        heightSpace,
        Text(
          widget.name,
          textAlign: TextAlign.center,
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        Text(
          '${widget.work} at ${widget.salonName}',
          textAlign: TextAlign.center,
          style: grey14MediumTextStyle,
        ),
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ratingStars(4),
            widthSpace,
            Text(
              '(159 reviews)',
              style: grey13RegularTextStyle,
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor),
                  ),
                  child: Image.asset(
                    'assets/icons/calling.png',
                    color: primaryColor,
                    height: 15,
                    width: 15,
                  ),
                ),
                heightSpace,
                Text(
                  'Llamar',
                  style: grey12SemiBoldTextStyle,
                ),
              ],
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                    child: Image.asset(
                      'assets/icons/chat.png',
                      color: primaryColor,
                      height: 15,
                      width: 15,
                    ),
                  ),
                  heightSpace,
                  Text(
                    'Chat',
                    style: grey12SemiBoldTextStyle,
                  ),
                ],
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScheduleAppointment()),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                    child: Image.asset(
                      'assets/icons/appointment.png',
                      color: primaryColor,
                      height: 15,
                      width: 15,
                    ),
                  ),
                  heightSpace,
                  Text(
                    'Book',
                    style: grey12SemiBoldTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        heightSpace,
        heightSpace,
      ],
    );
  }

  aboutDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${widget.name}',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          ExpandableText(
            '          Lorem ipsum dolor sit amet, consectetur adipisc ing lii elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n          Ut enim ad minim veniam, qui quis nostrud comi exercitation ullamco laboris nisi ut aliqui aliquip ex ea commodo consequat lorem ipsum dolor\n\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.\n\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua. Ut enim ad minim veniam, quis nostrud con exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
            expandText: 'Read More',
            collapseText: 'Show Less',
            maxLines: 7,
            linkColor: primaryColor,
            linkStyle: primaryColor13BoldTextStyle,
            style: grey13RegularTextStyle,
          ),
        ],
      ),
    );
  }

  moreDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        Text(
          '          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          '          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua. Ut enim ad minim veniam, quis nostrud con exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
      ],
    );
  }

  openingHours() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Hours',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Monday-Friday',
                    style: grey13MediumTextStyle,
                  ),
                  Text(
                    '9:00 am - 9:00 pm',
                    style: primaryColor14MediumTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Monday-Friday',
                    style: grey13MediumTextStyle,
                  ),
                  Text(
                    '9:00 am - 9:00 pm',
                    style: primaryColor14MediumTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  location() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: black15SemiBoldTextStyle,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'A 9/a Sector 16,Gautam Budh Nagar',
                style: grey13RegularTextStyle,
              ),
              heightSpace,
              Row(
                children: [
                  const Icon(
                    Icons.near_me,
                    color: primaryColor,
                    size: 15,
                  ),
                  widthSpace,
                  Text(
                    'Get directions - 5.2km',
                    style: primaryColor11SemiBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          Expanded(
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: GoogleMap(
                  markers: marker,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(40.729515, -73.985927),
                    zoom: 10,
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                    marker.add(
                      Marker(
                        markerId: const MarkerId('location'),
                        infoWindow: InfoWindow(title: widget.name),
                        position: const LatLng(40.729515, -73.985927),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  photos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Photos of ${widget.name}\'s hair style',
            style: black15SemiBoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        SizedBox(
          height: height * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: photosList.length,
            itemBuilder: (context, index) {
              final item = photosList[index];
              return Container(
                width: width * 0.18,
                margin: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding / 2,
                  fixPadding * 2.0,
                  fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  review() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: black15SemiBoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: reviewList.length,
            itemBuilder: (context, index) {
              final item = reviewList[index];
              return Padding(
                padding: const EdgeInsets.only(top: fixPadding * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: black15MediumTextStyle,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                ratingStars(item['rating']),
                                widthSpace,
                                Text(
                                  '${item['time']} ago',
                                  style: grey13RegularTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    Text(
                      item['review'],
                      style: grey13RegularTextStyle,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  ratingStars(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (rating == 5 ||
                rating == 4 ||
                rating == 3 ||
                rating == 2 ||
                rating == 1)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4 || rating == 3 || rating == 2)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4 || rating == 3)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: fixPadding * 1.5,
        horizontal: fixPadding * 2.0,
      ),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
