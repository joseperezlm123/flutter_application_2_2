import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Agregar tarjeta de credito '),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true, onCreditCardWidgetChange: (CreditCardBrand ) {  },
             ),
             Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber, 
                    expiryDate: expiryDate, 
                    cardHolderName: cardHolderName,
                     cvvCode: cvvCode,
                      onCreditCardModelChange: onCreditCardModelChange,
                       themeColor: Colors.blue, 
                       formKey: formKey,
                       cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Numero',
                        hintText: 'XXXX XXXX XXXX XXXX'
                       ),
                       expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Caduca',
                        hintText: 'XX/XX'
                       ),
                       cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX'
                       ),
                       cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Titular',
                       ),
                       ),
                       ElevatedButton(onPressed: (){
                        if (formKey.currentState!.validate()){
                          print('Validado');
                        }else {
                          print('Error');
                        }
                       }, 
                       style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        primary: Color(0xff1b447b)
                       ),
                       child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Text('Validar', style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_creddit_card'
                          ),),
                       ))
                ],
              ),
             ))
        ],
      )),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}