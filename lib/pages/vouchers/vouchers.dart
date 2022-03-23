import 'package:salon/pages/screens.dart';

class Vouchers extends StatelessWidget {
  Vouchers({Key key}) : super(key: key);

  final vouchersList = [
    {
      'image': 'assets/salon/salon2.png',
      'salonName': 'Yate1',
      'address': 'Cancún',
      'offer': 'Salida a Mar abierto',
      'off': '\$1000',
      'validTill': 'Agosto 31, 2022',
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
          'Recibos',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: vouchers(),
    );
  }

  vouchers() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: vouchersList.length,
      itemBuilder: (context, index) {
        final item = vouchersList[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 2.5,
          ),
          padding: const EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['salonName'],
                        style: black15MediumTextStyle,
                      ),
                      Text(
                        item['address'],
                        style: grey13RegularTextStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['offer'],
                        style: black13SemiBoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              divider(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: item['off'],
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Fahkwang',
                      ),
                    ),
                    const TextSpan(
                      text: '  MXN',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Fahkwang',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Válido Hasta:  ${item['validTill']}',
                style: grey14MediumTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      child: Row(
        children: List.generate(
          600 ~/ 10,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? primaryColor : Colors.transparent,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
