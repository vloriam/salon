import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/pages/salonsModel/salons_model.dart';
import 'package:salon/pages/screens.dart';

class Nearby extends StatefulWidget {
  const Nearby({Key key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  double height;
  double width;
  bool mapView = false;
  GoogleMapController _controller;
  PageController _pageController;
  List allMarkers = [];
  int prevPage;
  BitmapDescriptor locatoinIcon;

  final salonList = [
    {
      'image': 'assets/salon/salon2.png',
      'name': 'Yate1',
      'address': 'Cancún',
      'rating': '4.6',
      'review': '100',
      'time': '9:00 am - 9:00 pm',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/salon3.png',
      'name': 'Yate2',
      'address': 'Cancún',
      'rating': '4.6',
      'review': '100',
      'time': '9:00 am - 9:00 pm',
      'isFavorite': true,
    },
    {
      'image': 'assets/salon/salon4.png',
      'name': 'Yate3',
      'address': 'Cancún',
      'rating': '4.6',
      'review': '100',
      'time': '9:00 am - 9:00 pm',
      'isFavorite': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    getIcon();
    for (var element in nearbySalonList) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(element.salonName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.salonName, snippet: element.address),
          position: element.locationCoords,
        ),
      );
    }
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  getIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(50, 50)),
      'assets/icons/current_location_marker.png',
    );
    setState(() {
      locatoinIcon = icon;
    });
  }

  _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: mapView,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            mapView ? whiteColor.withOpacity(0.8) : Colors.transparent,
        // backwardsCompatibility: true,
        title: Text(
          'Yates Cercanos',
          style: black18SemiBoldTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Filter()),
            ),
            icon: const Icon(Icons.filter_alt),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/nearby.png',
                  height: 15,
                  width: 15,
                ),
                widthSpace,
                widthSpace,
                Text(
                  'Cancún\nMéxico',
                  style: black13RegularTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
      body: mapView ? salonMap() : salonsList(),
    );
  }

  search() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(
        left: fixPadding * 2.0,
        right: fixPadding * 2.0,
        top: fixPadding * 1.3,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: blackColor.withOpacity(0.1),
            spreadRadius: 1.5,
            blurRadius: 1.5,
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 6),
          hintText: 'Busca tú Yate...',
          hintStyle: grey13MediumTextStyle,
          prefixIcon: const Icon(
            Icons.search,
            color: primaryColor,
            size: 16,
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  salonsList() {
    return Stack(
      children: [
        Column(
          children: [
            search(),
            salons(),
          ],
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: InkWell(
            onTap: () {
              setState(() {
                mapView = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 2.5,
                    blurRadius: 2.5,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/map_view.png',
                color: whiteColor,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  salons() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0,
          fixPadding * 2.5,
          fixPadding * 2.0,
          0,
        ),
        itemCount: salonList.length,
        itemBuilder: (context, index) {
          final item = salonList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SalonDetail(
                    tag: salonList[index],
                    image: item['image'],
                    name: item['name'],
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: blackColor.withOpacity(0.1),
                      spreadRadius: 1.5,
                      blurRadius: 1.5,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: salonList[index],
                      child: Container(
                        height: height * 0.112,
                        width: width * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding,
                          vertical: fixPadding / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['name'],
                                  style: black15SemiBoldTextStyle,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      item['isFavorite'] = !item['isFavorite'];
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: item['isFavorite']
                                            ? const Text(
                                                'Yate agregado a Favoritos')
                                            : const Text(
                                                'Yate removido de Favoritos'),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    item['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: primaryColor,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item['address'],
                              style: grey12RegularTextStyle,
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: yellowColor,
                                  size: 15,
                                ),
                                widthSpace,
                                Text(
                                  '${item['rating']} (${item['review']} reviews)',
                                  style: grey12RegularTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item['time'],
                              style: grey12RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  salonMap() {
    return Stack(
      children: [
        googleMap(),
        salonsDetails(),
      ],
    );
  }

  googleMap() {
    return GoogleMap(
      markers: Set.from(allMarkers),
      initialCameraPosition: const CameraPosition(
        target: LatLng(40.729515, -73.985927),
        zoom: 13,
      ),
      onMapCreated: mapCreated,
    );
  }

  mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
    allMarkers.add(
      Marker(
        markerId: const MarkerId('location'),
        draggable: false,
        infoWindow: const InfoWindow(title: 'Tu localización'),
        position: const LatLng(40.729515, -73.985927),
        icon: locatoinIcon,
      ),
    );
  }

  moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: nearbySalonList[_pageController.page.toInt()].locationCoords,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }

  salonsDetails() {
    return Positioned(
      bottom: 20,
      child: SizedBox(
        height: height * 0.25,
        width: width,
        child: PageView.builder(
          controller: _pageController,
          itemCount: nearbySalonList.length,
          itemBuilder: (context, index) {
            return nearbySalonsList(index);
          },
        ),
      ),
    );
  }

  nearbySalonsList(index) {
    final item = nearbySalonList[index];
    return Container(
      alignment: Alignment.centerLeft,
      child: AnimatedBuilder(
        animation: _pageController,
        builder: (context, widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 185.0,
              width: Curves.easeInOut.transform(value) * 350.0,
              child: widget,
            ),
          );
        },
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                height: height * 0.5,
                width: width * 0.71,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SalonDetail(
                            tag: index,
                            image: item.image,
                            name: item.salonName,
                          ),
                        ),
                      ),
                      child: Hero(
                        tag: index,
                        child: Container(
                          height: height * 0.16,
                          width: width * 0.71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(item.image),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 95,
                left: 20,
                right: 20,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalonDetail(
                        tag: index,
                        image: item.image,
                        name: item.salonName,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(fixPadding / 2),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          blurRadius: 2.5,
                          spreadRadius: 2.5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.salonName,
                              style: white14SemiBoldTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  item.isFavorite = !item.isFavorite;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: item.isFavorite
                                        ? const Text(
                                            'Yate agregado a Favoritos')
                                        : const Text(
                                            'Yate removido de Favoritos'),
                                  ),
                                );
                              },
                              child: Icon(
                                item.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: whiteColor,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          item.address,
                          style: white13RegularTextStyle,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 15,
                            ),
                            widthSpace,
                            Text(
                              '${item.rating} (${item.reviews} Opiniones)',
                              style: white13RegularTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
