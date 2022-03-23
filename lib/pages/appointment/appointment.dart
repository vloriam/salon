import 'package:expandable/expandable.dart';
import 'package:salon/pages/screens.dart';
import 'package:salon/widget/column_builder.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final upcomingList = [
    {
      'salonName': 'Yate1',
      'address': 'Cancún',
      'day': 'Miércoles',
      'date': '24 Agosto, 2022',
      'time': '2:00 pm',
      'specialist': 'Fulano de Tal',
      'speciality': 'Capitán',
      'services': [
        {
          'service': 'Recorrido a mara abierto',
          'price': 50000.00,
        },
        {
          'service': 'Bebidas y Alimentos',
          'price': 50000.00,
        },
      ],
      'total': '\$100000.00',
    },
  ];

  final pastList = [
    {
      'salonName': 'Yate2',
      'address': 'Cancún',
      'day': 'Martes',
      'date': '17 June, 2023',
      'time': '2:00 pm',
      'specialist': 'Fulano2',
      'speciality': 'Capitán',
      'services': [
        {
          'service': 'Salida a mar abierto',
          'price': 70000.00,
        },
      ],
      'total': '\$70000.00',
    },
    {
      'salonName': 'Yate3',
      'address': 'Cancún',
      'day': 'Lunes',
      'date': '18 Noviembre, 2021',
      'time': '4:00 pm',
      'specialist': 'Fulano5',
      'speciality': 'Capitán',
      'services': [
        {
          'service': 'Bebidas',
          'price': 3500.00,
        },
      ],
      'total': '\$3500.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Reservaciones',
            style: black18SemiBoldTextStyle,
          ),
          bottom: const TabBar(
            indicatorWeight: 2,
            indicatorColor: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            unselectedLabelColor: greyColor,
            labelColor: primaryColor,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Fahkwang',
            ),
            tabs: <Widget>[
              Tab(
                text: 'Próximos',
              ),
              Tab(
                text: 'Pasados',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            upcomingList.isEmpty ? upcomingBookingListEmpty() : upcoming(),
            past(),
          ],
        ),
      ),
    );
  }

  upcomingBookingListEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/icons/appointment.png',
            height: 50,
            width: 50,
            color: primaryColor,
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'No hay próximos Eventos',
          textAlign: TextAlign.center,
          style: grey15BoldTextStyle,
        )
      ],
    );
  }

  upcoming() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: upcomingList.length,
        itemBuilder: (context, index) {
          final item = upcomingList[index];
          return Container(
            margin: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.0,
              fixPadding * 2.0,
              0,
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
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                iconColor: blackColor,
                iconPadding: EdgeInsets.zero,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['salonName'],
                    style: black14MediumTextStyle,
                  ),
                  Text(
                    item['address'],
                    style: grey13RegularTextStyle,
                  ),
                  Text(
                    '${item['day']} • ${item['date']} • ${item['time']}',
                    style: grey13RegularTextStyle,
                  ),
                  heightSpace,
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calling.png',
                        height: 12,
                        width: 12,
                        color: primaryColor,
                      ),
                      widthSpace,
                      widthSpace,
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Chat()),
                        ),
                        child: Image.asset(
                          'assets/icons/chat.png',
                          height: 12,
                          width: 12,
                          color: primaryColor,
                        ),
                      ),
                      widthSpace,
                      widthSpace,
                      const Icon(
                        Icons.near_me,
                        color: primaryColor,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              collapsed: divider(),
              expanded: upcomingBookingDetails(item, index),
            ),
          );
        });
  }

  upcomingBookingDetails(item, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        divider(),
        Text(
          'Anfitrión',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          '${item['specialist']} • ${item['speciality']}',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Servicios',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        services(item['services']),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: primaryColor13SemiBoldTextStyle,
            ),
            Text(
              item['total'],
              style: primaryColor13SemiBoldTextStyle,
            ),
          ],
        ),
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  upcomingList.removeAt(index);
                });
              },
              child: Text(
                'Cancelar Reservación',
                style: green13BoldTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  past() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: pastList.length,
        itemBuilder: (context, index) {
          final item = pastList[index];
          return Container(
            margin: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.0,
              fixPadding * 2.0,
              0,
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
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                iconColor: blackColor,
                iconPadding: EdgeInsets.zero,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['salonName'],
                    style: black14MediumTextStyle,
                  ),
                  Text(
                    item['address'],
                    style: grey13RegularTextStyle,
                  ),
                  Text(
                    '${item['day']} • ${item['date']} • ${item['time']}',
                    style: grey13RegularTextStyle,
                  ),
                  heightSpace,
                  Row(
                    children: [
                      Text(
                        'Completado',
                        style: green13BoldTextStyle,
                      ),
                      widthSpace,
                      widthSpace,
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ScheduleAppointment()),
                        ),
                        child: Text(
                          'Reservar de Nuevo',
                          style: primaryColor13BoldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              collapsed: divider(),
              expanded: pastBookingDetails(item),
            ),
          );
        });
  }

  pastBookingDetails(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        divider(),
        Text(
          'Responsable',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          '${item['specialist']} • ${item['speciality']}',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Servicios',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        services(item['services']),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: primaryColor13SemiBoldTextStyle,
            ),
            Text(
              item['total'],
              style: primaryColor13SemiBoldTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  services(service) {
    return ColumnBuilder(
      itemCount: service.length,
      itemBuilder: (context, index) {
        final items = service[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                items['service'],
                style: grey13RegularTextStyle,
              ),
              Text(
                '\$${items['price'].toString()}',
                style: grey13RegularTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.3),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
