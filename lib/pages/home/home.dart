import 'package:salon/pages/screens.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  double width;

  final categoryList = [
    {
      'image': 'assets/icons/all.png',
      'category': 'Todos',
      'color': const Color(0xff33b0b5),
    },
    {
      'image': 'assets/icons/yate 3.png',
      'category': 'Chill',
      'color': const Color(0xff33b0b5),
    },
    {
      'image': 'assets/icons/yate.png',
      'category': 'Elegance',
      'color': const Color(0xff33b0b5),
    },
    {
      'image': 'assets/icons/yate2.png',
      'category': 'Luxury',
      'color': const Color(0xff33b0b5),
    },
    {
      'image': 'assets/icons/yate 6.png',
      'category': 'VIP',
      'color': const Color(0xff33b0b5),
    },
    {
      'image': 'assets/icons/bote.png',
      'category': 'Sport',
      'color': const Color(0xff33b0b5),
    },
  ];

  final salonList = [
    {
      'image': 'assets/salon/angelina.jpeg',
      'name': 'Angelina',
      'rating': '5',
      'review': '100',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/Joana.jpeg',
      'name': 'Joana',
      'rating': '5',
      'review': '100',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/Bigtime.jpeg',
      'name': 'Big Time',
      'rating': '5',
      'review': '100',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/kraken.jpeg',
      'name': 'Kraken',
      'rating': '5',
      'review': '100',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/Happy.jpeg',
      'name': 'Happy',
      'rating': '5',
      'review': '100',
      'isFavorite': false,
    },
  ];

  final offerList = [
    {
      'image': 'assets/offer/offer1.png',
      'salonName': 'Yate VIP',
      'title': 'Nuevos Usuarios',
      'off': '25%',
    },
    {
      'image': 'assets/offer/offer1.png',
      'salonName': 'Yate Elegance',
      'title': 'Nuevos Usuarios',
      'off': '15%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: nestedScrollView(),
      ),
    );
  }

  nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, b) {
        return [
          SliverAppBar(
            expandedHeight: height * 0.27,
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/salon/salon1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: blackColor.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/nearby.png',
                                color: whiteColor,
                                height: 15,
                                width: 15,
                              ),
                              widthSpace,
                              widthSpace,
                              Text(
                                'Victor Loria',
                                style: white18SemiBoldTextStyle,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()),
                            ),
                            child: const Icon(
                              Icons.filter_alt,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Cancún',
                        style: white13RegularTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Text(
                        'Encuentra y Reserva los mejores Yates',
                        style: white18SemiBoldTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          cursorColor: whiteColor,
                          style: white14MediumTextStyle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 6),
                            hintText: 'Encontrar mi Yate...',
                            hintStyle: white13MediumTextStyle,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: whiteColor,
                              size: 15,
                            ),
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          category(),
          salon(),
          offers(),
        ],
      ),
    );
  }

  category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Categorías',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.072,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final item = categoryList[index];
              Color color = item['color'];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding * 2.0,
                ),
                child: InkWell(
                  onTap: item['category'] == 'All'
                      ? () {}
                      : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetail(
                                category: item['category'],
                              ),
                            ),
                          ),
                  child: Container(
                    width: width * 0.149,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image'],
                          color: whiteColor,
                          height: 18,
                          width: 18,
                        ),
                        heightSpace,
                        Text(
                          item['category'],
                          style: white12SemiBoldTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  salon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Los mejor evaluados',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.218,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: salonList.length,
            itemBuilder: (context, index) {
              final item = salonList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding / 2,
                  fixPadding * 2.0,
                  fixPadding / 2,
                ),
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
                  child: Stack(
                    children: [
                      Hero(
                        tag: salonList[index],
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.5,
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
                        ),
                      ),
                      Positioned(
                        top: 85,
                        left: 10,
                        right: 10,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['name'],
                                    style: white13SemiBoldTextStyle,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        item['isFavorite'] =
                                            !item['isFavorite'];
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: item['isFavorite']
                                              ? const Text(
                                                  'Agregado a Favoritos')
                                              : const Text(
                                                  'Removido de Favoritos'),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      item['isFavorite']
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: whiteColor,
                                      size: 16,
                                    ),
                                  ),
                                ],
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
                                    '${item['rating']} (${item['review']} reviews)',
                                    style: white12RegularTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  offers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Promociones',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.179,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: offerList.length,
            itemBuilder: (context, index) {
              final item = offerList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding / 2,
                  fixPadding * 2.0,
                  fixPadding / 2,
                ),
                child: Container(
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: whiteColor,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          fixPadding,
                          fixPadding,
                          fixPadding * 6.5,
                          fixPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['salonName'],
                              style: black15MediumTextStyle,
                            ),
                            Text(
                              item['title'],
                              style: black18BoldTextStyle,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: fixPadding * 1.9),
                              padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '${item['off']} off',
                                style: white14MediumTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
