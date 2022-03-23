import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:salon/pages/screens.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  double height;
  double width;

  final favoriteList = [
    {
      'image': 'assets/salon/salon3.png',
      'name': 'Yate1',
      'address': 'Cancún',
      'rating': '4.6',
      'review': '100',
      'time': '9:00 am - 9:00 pm',
    },
    {
      'image': 'assets/salon/salon4.png',
      'name': 'Yate2',
      'address': 'Cancún',
      'rating': '4.6',
      'review': '100',
      'time': '9:00 am - 9:00 pm',
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
          'Favoritos',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: favoriteList.isEmpty ? favoriteListEmpty() : favoritesList(),
    );
  }

  favoriteListEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.favorite_border,
            color: greyColor,
            size: 50,
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'No hay Favoritos',
          textAlign: TextAlign.center,
          style: grey15BoldTextStyle,
        )
      ],
    );
  }

  favoritesList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        final item = favoriteList[index];
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Padding(
              padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
              child: IconSlideAction(
                caption: 'Eliminar',
                color: primaryColor,
                icon: Icons.delete,
                foregroundColor: whiteColor,
                onTap: () {
                  setState(() {
                    favoriteList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Se Removió de Favoritos.'),
                  ));
                },
              ),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              0,
              fixPadding * 2.0,
              fixPadding * 2.0,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SalonDetail(
                    tag: favoriteList[index],
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
                      tag: favoriteList[index],
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
                            Text(
                              item['name'],
                              style: black15SemiBoldTextStyle,
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
                                  '${item['rating']} (${item['review']} Opiniones)',
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
          ),
        );
      },
    );
  }
}
