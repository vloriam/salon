import 'package:salon/pages/screens.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool psw = true;
  bool confirmpsw = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Crea una cuenta',
            style: black18SemiBoldTextStyle,
          ),
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 119,
              child: Column(
                children: [
                  nameTextField(),
                  emailTextField(),
                  mobileNumberTextField(),
                  passwordTextField(),
                  confirmPasswordTextField(),
                  signupButton(),
                  otherOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  nameTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/profile.png',
            color: greyColor,
            height: 18,
            width: 18,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              onChanged: (value) {},
              keyboardType: TextInputType.name,
              cursorColor: primaryColor,
              style: black16SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Usuario',
                hintStyle: grey16SemiBoldTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  emailTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.email,
            color: greyColor,
            size: 18,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              cursorColor: primaryColor,
              style: black16SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Email',
                hintStyle: grey16SemiBoldTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mobileNumberTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.phone_android,
            color: greyColor,
            size: 18,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              onSubmitted: (value) {},
              keyboardType: TextInputType.phone,
              cursorColor: primaryColor,
              style: black16SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Número de Teléfono',
                hintStyle: grey16SemiBoldTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  passwordTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lock,
            color: greyColor,
            size: 18,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              onChanged: (value) {},
              obscureText: !psw,
              cursorColor: primaryColor,
              style: black16SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Contraseña',
                hintStyle: grey16SemiBoldTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                psw = !psw;
              });
            },
            child: Icon(
              psw ? Icons.visibility : Icons.visibility_off,
              color: greyColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  confirmPasswordTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lock,
            color: greyColor,
            size: 18,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: TextField(
              obscureText: !confirmpsw,
              cursorColor: primaryColor,
              style: black16SemiBoldTextStyle,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Confirmar Contraseña',
                hintStyle: grey16SemiBoldTextStyle,
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                confirmpsw = !confirmpsw;
              });
            },
            child: Icon(
              confirmpsw ? Icons.visibility : Icons.visibility_off,
              color: greyColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  signupButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 3.0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Otp()),
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
            'Registrarme',
            style: white18SemiBoldTextStyle,
          ),
        ),
      ),
    );
  }

  otherOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        children: [
          Row(
            children: [
              divider(),
              widthSpace,
              widthSpace,
              Text(
                'Registrate con otras plataformas',
                style: grey15MediumTextStyle,
              ),
              widthSpace,
              widthSpace,
              divider(),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: const Color(0xff4267b2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  'assets/icons/facebook.png',
                  height: 22,
                  width: 22,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: const Color(0xffea4335),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  'assets/icons/google.png',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes una cuenta? ',
                style: grey15MediumTextStyle,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                ),
                child: Text(
                  'Iniciar Sesión',
                  style: primaryColor15SemiBoldTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  divider() {
    return Expanded(
      child: Container(
        color: greyColor,
        height: 1,
        width: double.infinity,
      ),
    );
  }
}
