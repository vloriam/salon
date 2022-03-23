import 'package:flutter/cupertino.dart';
import 'package:salon/pages/screens.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool notification = true;
  bool call = false;
  bool location = true;

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
          'Ajustes',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          settings(),
          heightSpace,
          heightSpace,
          heightSpace,
          general(),
        ],
      ),
    );
  }

  settings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Settings'),
        notifications(),
        calls(),
        locations(),
      ],
    );
  }

  notifications() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notificaciones',
            style: black15RegularTextStyle,
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: greyColor.withOpacity(0.6),
              value: notification,
              onChanged: (bool value) {
                setState(() {
                  notification = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  calls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Llamadas',
            style: black15RegularTextStyle,
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: greyColor.withOpacity(0.6),
              value: call,
              onChanged: (bool value) {
                setState(() {
                  call = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  locations() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Localización',
            style: black15RegularTextStyle,
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: greyColor.withOpacity(0.6),
              value: location,
              onChanged: (bool value) {
                setState(() {
                  location = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  general() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('General'),
        heightSpace,
        heightSpace,
        heightSpace,
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding / 2,
            ),
            child: Row(
              children: [
                Text(
                  'Sobre la app',
                  style: black15RegularTextStyle,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Policy()),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding / 2,
            ),
            child: Row(
              children: [
                Text(
                  'Política de Privacidad',
                  style: black15RegularTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  title(title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: blackColor.withOpacity(0.1),
            spreadRadius: 1.5,
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Text(
        title,
        style: black15SemiBoldTextStyle,
      ),
    );
  }
}
