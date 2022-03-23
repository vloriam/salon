import 'package:salon/pages/screens.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'image': 'assets/salon/salon2.png',
      'title': 'Yate1',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ',
      'time': '42 min ago',
    },
    {
      'image': 'assets/salon/salon3.png',
      'title': 'Yate2',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ',
      'time': '2 days ago',
    },
    {
      'image': 'assets/salon/salon2.png',
      'title': 'Yate1',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ',
      'time': '5 days ago',
    },
    {
      'image': 'assets/salon/salon4.png',
      'title': 'Yate3',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ',
      'time': '8 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Notificaciones',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body:
          notificationList.isEmpty ? notificationListEmpty() : notifications(),
    );
  }

  notificationListEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.notifications_off_outlined,
            color: greyColor,
            size: 50,
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Sin Notificaciones por el momento',
          textAlign: TextAlign.center,
          style: grey15BoldTextStyle,
        )
      ],
    );
  }

  notifications() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        final item = notificationList[index];
        return Dismissible(
          key: Key('$item'),
          background: Container(
              margin: const EdgeInsets.only(bottom: fixPadding * 2.0),
              color: primaryColor),
          onDismissed: (direction) {
            setState(() {
              notificationList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item['title']} Eliminado")));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              0,
              fixPadding * 2.0,
              fixPadding * 2.0,
            ),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: whiteColor, width: 2),
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
                widthSpace,
                widthSpace,
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['title'],
                            style: black14MediumTextStyle,
                          ),
                          Text(
                            item['time'],
                            style: black10SemiBoldTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        item['detail'],
                        style: grey11RegularTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
