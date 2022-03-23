import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon/pages/screens.dart';

class Signin extends StatefulWidget {
  const Signin({Key key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  DateTime currentBackPressTime;
  bool visible = true;

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
      child: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Iniciar Sesión',
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
                    passwordTextField(),
                    signinButton(),
                    otherOptions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Presiona de Nuevo para Salir.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  nameTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 2.0,
      ),
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
              onSubmitted: (value) {},
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

  passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
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
                    onSubmitted: (value) {},
                    obscureText: !visible,
                    cursorColor: primaryColor,
                    style: black16SemiBoldTextStyle,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Contraseña',
                      hintStyle: grey16SemiBoldTextStyle,
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: Icon(
                    visible ? Icons.visibility : Icons.visibility_off,
                    color: greyColor,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          Text(
            '¿Olvidaste la Contraseña?',
            style: grey13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  signinButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 3.0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Signup()),
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
            'Iniciar Sesión',
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
                'Inicia Sesión con otras plataformas',
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
                '¿No tienes una cuenta? ',
                style: grey15MediumTextStyle,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()),
                ),
                child: Text(
                  'REGISTRARME',
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

  cornerImage() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        'assets/bg.png',
        height: 115.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
