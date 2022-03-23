import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:salon/pages/screens.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Agregar una Nueva Tarjeta',
              style: black15SemiBoldTextStyle,
            ),
          ),
          creditCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
            child: cardForm(),
          ),
        ],
      ),
    );
  }

  creditCard() {
    return CreditCardWidget(
      cardBgColor: primaryColor,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      labelCardHolder: 'NOMBRE DEL TITULAR',
      textStyle: white14MediumTextStyle,
      height: MediaQuery.of(context).size.height * 0.20,
      cardType: CardType.mastercard,
    );
  }

  cardForm() {
    return Column(
      children: <Widget>[
        CreditCardForm(
          cursorColor: primaryColor,
          formKey: formKey,
          obscureCvv: true,
          obscureNumber: true,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          cardHolderName: cardHolderName,
          expiryDate: expiryDate,
          themeColor: Colors.blue,
          cardNumberDecoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding * 1.2,
            ),
            border: OutlineInputBorder(),
            hintText: 'XXXX XXXX XXXX XXXX',
            labelText: 'Escribe el número de tarjeta',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Fahkwang',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          expiryDateDecoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding * 1.2,
            ),
            border: OutlineInputBorder(),
            hintText: 'XX/XX',
            labelText: 'Escribe vigencia',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Fahkwang',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          cvvCodeDecoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding * 1.2,
            ),
            border: OutlineInputBorder(),
            hintText: 'XXX',
            labelText: 'Escribe cvv',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Fahkwang',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          cardHolderDecoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding * 1.2,
            ),
            border: OutlineInputBorder(),
            labelText: 'Nombre del títular',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Fahkwang',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          onCreditCardModelChange: onCreditCardModelChange,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 3.0,
          ),
          child: InkWell(
            onTap: () {
              if (formKey.currentState.validate()) {
                Navigator.pop(context);
              } else {
                // ignore: avoid_print
                print('invalid!');
              }
            },
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
                'Agregar',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
