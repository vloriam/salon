import 'package:salon/pages/screens.dart';

class Policy extends StatelessWidget {
  const Policy({Key key}) : super(key: key);

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
          'Privacy Policy',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          Text(
            '        Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '        Lorem Ipsum has been the it industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and eiti scrambled it to pi make a type specimen book.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '        It has survived not only five centuries, but also an the leap into electronic typesetting, remaining essent essentially unchanged.',
            style: grey13RegularTextStyle,
          ),
        ],
      ),
    );
  }
}
