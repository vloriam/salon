import 'package:salon/pages/screens.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({Key key}) : super(key: key);

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
          'Detalles del Servicio',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          details(),
        ],
      ),
      bottomNavigationBar: bookNowButton(context),
    );
  }

  details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/salon/salon2.png'),
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
                  'Yate1',
                  style: black14MediumTextStyle,
                ),
                const SizedBox(height: 3),
                Text(
                  'Cancún',
                  style: grey12RegularTextStyle,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: yellowColor,
                          size: 18,
                        ),
                        widthSpace,
                        Text(
                          '4.6 (100 Reviews)',
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        'Listo para zarpar',
                        style: white10BoldTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Servicios',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Navegación 6 horas con bebidas y alimentos',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Capitán',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Joya Patel ',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Fecha y Hora de Salida',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Miércoles • 14 Agosto, 2022 • 2:00 pm',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: black15SemiBoldTextStyle,
            ),
            Text(
              '\$20009.00',
              style: black15SemiBoldTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  bookNowButton(context) {
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
              MaterialPageRoute(builder: (context) => const PaymentMethod()),
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
                'Reservar',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
