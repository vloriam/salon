import 'package:salon/pages/screens.dart';

class CategoryDetail extends StatefulWidget {
  final String category;
  const CategoryDetail({Key key, this.category}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  double height;
  double width;

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
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.category,
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: salons(),
    );
  }

  salons() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 2.5,
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
                    color: primaryColor.withOpacity(0.1),
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
                                  size: 20,
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
    );
  }
}
