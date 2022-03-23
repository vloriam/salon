import 'package:salon/pages/screens.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key key}) : super(key: key);

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
          'Invitar Amigo',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          Text(
            'Obten un descuento por\ninvitar a tus amigos',
            textAlign: TextAlign.center,
            style: black16MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',
            textAlign: TextAlign.center,
            style: black13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          codeTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          shareButton(context),
        ],
      ),
    );
  }

  codeTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: TextEditingController(text: 'D1Q7PK'),
        cursorColor: primaryColor,
        style: black14SemiBoldTextStyle,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: fixPadding, top: 6),
          suffixIcon: Icon(
            Icons.copy,
            color: blackColor,
            size: 15,
          ),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  shareButton(context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
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
          'Compartir',
          style: white18SemiBoldTextStyle,
        ),
      ),
    );
  }
}
