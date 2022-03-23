import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../screens.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({Key key}) : super(key: key);

  @override
  _ScheduleAppointmentState createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  double height;
  int isSelected = 0;
  String selectedTime = '02:00 pm';
  RangeValues _distanceRangeValues = const RangeValues(0, 6);
  final DatePickerController _controller = DatePickerController();
  // ignore: unused_field
  DateTime _selectedValue = DateTime.now();

  final specialistsList = [
    {
      'image': 'assets/specialists/specialist2.png',
      'name': 'Joya',
      'work': 'Hair stylist',
    },
    {
      'image': 'assets/salon/salon4.png',
      'name': 'Doe',
      'work': 'St.Barber',
    },
    {
      'image': 'assets/specialists/specialist3.png',
      'name': 'Helina',
      'work': 'M.Artist',
    },
    {
      'image': 'assets/specialists/specialist4.png',
      'name': 'Robat',
      'work': 'Hair Stylist',
    },
    {
      'image': 'assets/specialists/specialist5.png',
      'name': 'Jiya',
      'work': 'M.Artist',
    },
    {
      'image': 'assets/specialists/specialist4.png',
      'name': 'Robat',
      'work': 'Hair Stylist',
    },
  ];

  final slotList = [
    {'time': '09:30 am'},
    {'time': '10:00 am'},
    {'time': '10:30 am'},
    {'time': '11:00 am'},
    {'time': '11:30 am'},
    {'time': '12:00 am'},
    {'time': '01:30 pm'},
    {'time': '02:00 pm'},
    {'time': '02:30 pm'},
    {'time': '03:00 pm'},
    {'time': '03:30 pm'},
    {'time': '04:00 pm'},
    {'time': '04:30 pm'},
    {'time': '05:00 pm'},
    {'time': '06:00 pm'},
    {'time': '06:30 pm'},
    {'time': '07:00 pm'},
    {'time': '07:30 pm'},
    {'time': '08:00 pm'},
    {'time': '08:30 pm'},
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Selecciona el Horario',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          date(),
          heightSpace,
          heightSpace,
          heightSpace,
          slot(),
          heightSpace,
          heightSpace,
          heightSpace,
          distance(),
          heightSpace,
          heightSpace,
          heightSpace,
          services(),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      ),
      bottomNavigationBar: continueButton(),
    );
  }

  date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: Text(
            'Selecciona la Fecha',
            style: black16SemiBoldTextStyle,
          ),
        ),
        Container(
          height: 85,
          padding: const EdgeInsets.only(left: fixPadding * 2.0),
          child: DatePicker(
            DateTime.now(),
            width: 60,
            height: 85,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                _selectedValue = date;
              });
            },
          ),
        ),
      ],
    );
  }

  slot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Disponibilidad',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Wrap(
            children: slotList
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 7,
                      right: 7,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTime = e['time'];
                        });
                      },
                      child: Container(
                        width: 81,
                        padding: const EdgeInsets.symmetric(
                            vertical: fixPadding / 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: e['time'] == selectedTime
                              ? primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: e['time'] == selectedTime
                                  ? primaryColor
                                  : greyColor),
                        ),
                        child: Text(e['time'],
                            style: (e['time'] == selectedTime)
                                ? white13SemiBoldTextStyle
                                : grey13MediumTextStyle),
                      ),
                    ),
                  ),
                )
                .toList()
                .cast<Widget>(),
          ),
        ],
      ),
    );
  }

  services() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Servicios Seleccionados',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          serviceDetail(
            service: 'Navegación mas abierto por 6 horas',
            titleStyle: grey14MediumTextStyle,
            price: '\$35.00',
            priceStyle: grey13MediumTextStyle,
          ),
          heightSpace,
          serviceDetail(
            service: 'Bebidas',
            titleStyle: grey14MediumTextStyle,
            price: '\$149.00',
            priceStyle: grey13MediumTextStyle,
          ),
          heightSpace,
          serviceDetail(
            service: 'Alimentos',
            titleStyle: grey14MediumTextStyle,
            price: '\$25.00',
            priceStyle: grey13MediumTextStyle,
          ),
          heightSpace,
          serviceDetail(
            service: 'Impuesto de Puerto por Persona',
            titleStyle: grey14MediumTextStyle,
            price: '\$130.00',
            priceStyle: grey13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          serviceDetail(
            service: 'Total',
            titleStyle: black15SemiBoldTextStyle,
            price: '\$500.00',
            priceStyle: black13SemiBoldTextStyle,
          ),
        ],
      ),
    );
  }

  serviceDetail({String service, titleStyle, String price, priceStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          service,
          style: titleStyle,
        ),
        Text(
          price,
          style: priceStyle,
        ),
      ],
    );
  }

  distance() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Número de personas',
            style: black16SemiBoldTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: fixPadding * 2.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${_distanceRangeValues.end.toString()}personas',
                style: grey13MediumTextStyle,
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 5, disabledThumbRadius: 5),
              rangeValueIndicatorShape:
                  const PaddleRangeSliderValueIndicatorShape(),
              trackHeight: 2,
              valueIndicatorTextStyle: white13MediumTextStyle,
              valueIndicatorColor: primaryColor,
            ),
            child: RangeSlider(
              min: 0,
              max: 8,
              divisions: 8,
              activeColor: primaryColor,
              inactiveColor: greyColor.withOpacity(0.3),
              values: _distanceRangeValues,
              labels: RangeLabels(
                _distanceRangeValues.start.round().toString(),
                _distanceRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _distanceRangeValues = values;
                });
              },
            ),
          )
        ],
      ),
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
                  builder: (context) => const AppointmentDetails()),
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
                'Continuar',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
