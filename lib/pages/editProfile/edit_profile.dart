import 'package:salon/pages/screens.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key key}) : super(key: key);

  final nameController = TextEditingController(text: 'Samantha John');
  final emailController = TextEditingController(text: 'shahsamantha@gmail.com');
  final phoneNumberController = TextEditingController(text: '(+91) 1234567890');
  final passwordController = TextEditingController(text: 'Samantha John');

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
          'Edit Profile',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          profileImage(context),
          nameTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          emailTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          mobileNumberTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          passwordTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          updateButton(context),
        ],
      ),
    );
  }

  profileImage(context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Hero(
              tag: 'profilePic',
              child: Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 190,
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: whiteColor,
                size: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfilePick(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: whiteColor,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Choose Option',
                      textAlign: TextAlign.center,
                      style: black15SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.camera_alt,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Take picture',
                            style: black14MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.photo_library,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Select from gallery',
                            style: black14MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Name',
          style: grey13RegularTextStyle,
        ),
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: grey13RegularTextStyle,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  mobileNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: grey13RegularTextStyle,
        ),
        TextField(
          controller: phoneNumberController,
          keyboardType: TextInputType.phone,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
          ),
        ),
      ],
    );
  }

  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: grey13RegularTextStyle,
        ),
        TextField(
          obscureText: true,
          controller: passwordController,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: 1,
              bottom: 8,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  updateButton(context) {
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
          'Update Profile',
          style: white18SemiBoldTextStyle,
        ),
      ),
    );
  }
}
