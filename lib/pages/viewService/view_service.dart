import 'package:salon/pages/screens.dart';
import 'package:salon/widget/column_builder.dart';

class ViewService extends StatefulWidget {
  const ViewService({Key key}) : super(key: key);

  @override
  _ViewServiceState createState() => _ViewServiceState();
}

class _ViewServiceState extends State<ViewService> {
  int selectedHairWash = 0;
  int selectedHairColoring = 0;
  int selectedHairCutting = 0;

  final hairWashList = [
    {
      'type': 'Hair wash herbal',
      'price': '\$35.00',
      'time': '20 min',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'type': 'Professional hair wash',
      'price': '\$28.00',
      'time': '35 min',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'type': 'Hair Spa wash',
      'price': '\$49.00',
      'time': '35 min',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
  ];

  final hairColoringList = [
    {
      'type': 'Hair color',
      'price': '\$149.00',
      'time': '1 hour 30 min',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
  ];

  final hairCuttingList = [
    {
      'type': 'Simple hair cutting - hair wash',
      'price': '\$25.00',
      'time': '30 min',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
          'Hairstyle',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          hairWash(),
          heightSpace,
          hairColoring(),
          heightSpace,
          hairCutting(),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      ),
      bottomNavigationBar: continueButton(),
    );
  }

  hairWash() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hair Wash',
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        ColumnBuilder(
          itemCount: hairWashList.length,
          itemBuilder: (context, index) {
            final item = hairWashList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedHairWash = index;
                });
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['type'],
                              style: black14MediumTextStyle,
                            ),
                            heightSpace,
                            heightSpace,
                            Text(
                              'Duration : ${item['time']}',
                              style: grey14RegularTextStyle,
                            ),
                            Text(
                              item['detail'],
                              style: grey13RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedHairWash == index
                                  ? whiteColor
                                  : greyColor.withOpacity(0.3),
                              border: Border.all(
                                color: selectedHairWash == index
                                    ? primaryColor
                                    : Colors.transparent,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: selectedHairWash == index
                                ? Container(
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : Container(),
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            item['price'],
                            style: TextStyle(
                              color: selectedHairWash == index
                                  ? primaryColor
                                  : greyColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  divider(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  hairColoring() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hair Coloring',
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        ColumnBuilder(
          itemCount: hairColoringList.length,
          itemBuilder: (context, index) {
            final item = hairColoringList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedHairColoring = index;
                });
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['type'],
                              style: black14MediumTextStyle,
                            ),
                            heightSpace,
                            heightSpace,
                            Text(
                              'Duration : ${item['time']}',
                              style: grey14RegularTextStyle,
                            ),
                            Text(
                              item['detail'],
                              style: grey13RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedHairColoring == index
                                  ? whiteColor
                                  : greyColor.withOpacity(0.3),
                              border: Border.all(
                                color: selectedHairColoring == index
                                    ? primaryColor
                                    : Colors.transparent,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: selectedHairColoring == index
                                ? Container(
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : Container(),
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            item['price'],
                            style: TextStyle(
                              color: selectedHairColoring == index
                                  ? primaryColor
                                  : greyColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  divider(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  hairCutting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hair Cutting',
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        ColumnBuilder(
          itemCount: hairCuttingList.length,
          itemBuilder: (context, index) {
            final item = hairCuttingList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedHairCutting = index;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['type'],
                          style: black14MediumTextStyle,
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          'Duration : ${item['time']}',
                          style: grey14RegularTextStyle,
                        ),
                        Text(
                          item['detail'],
                          style: grey13RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedHairCutting == index
                              ? whiteColor
                              : greyColor.withOpacity(0.3),
                          border: Border.all(
                            color: selectedHairCutting == index
                                ? primaryColor
                                : Colors.transparent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: selectedHairCutting == index
                            ? Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(),
                      ),
                      widthSpace,
                      widthSpace,
                      Text(
                        item['price'],
                        style: TextStyle(
                          color: selectedHairCutting == index
                              ? primaryColor
                              : greyColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  continueButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
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
                  builder: (context) => const ScheduleAppointment()),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Text(
                'Continue',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
