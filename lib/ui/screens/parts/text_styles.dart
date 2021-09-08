import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle styleBottomAppTitle() {
  return TextStyle(
    fontSize: 13.0,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}

TextStyle styleSmallLogo() {
  return GoogleFonts.bellotaText(
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleSmallButton() {
  return GoogleFonts.bellotaText(
    fontSize: 15,
    color: Colors.amber,
    fontWeight: FontWeight.w700,
  );
}

TextStyle stylePromoSearch() {
  return GoogleFonts.raleway(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

TextStyle styleAccountTextFields() {
  return GoogleFonts.roboto(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}

TextStyle stylePromoPopularTitle() {
  return GoogleFonts.raleway(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

TextStyle stylePromoUrlSmall() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(1, 1),
        blurRadius: 1.0,
      ),
    ],
  );
}

TextStyle stylePromoUrlMain() {
  return GoogleFonts.raleway(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(1, 1),
        blurRadius: 1.0,
      ),
    ],
  );
}

TextStyle styleCoffeeLabel() {
  return GoogleFonts.comfortaa(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle styleCoffeeWeight() {
  return GoogleFonts.comfortaa(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.grey
  );
}


TextStyle styleCoffeeLabelBold() {
  return GoogleFonts.comfortaa(
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
}

TextStyle styleCoffeePrice1() {
  return GoogleFonts.bellota(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCoffeePrice2() {
  return GoogleFonts.firaCode(
    fontSize: 18,
    color: Colors.red,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCoffeeButton1() {
  return GoogleFonts.firaCode(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}

TextStyle styleCoffeeButton2() {
  return GoogleFonts.firaCode(
    fontSize: 15,
    color: Colors.green,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCoffeeDiscount() {
  return GoogleFonts.firaCode(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCategoryTitle() {
  return GoogleFonts.firaCode(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleDetailsPrice() {
  return GoogleFonts.firaCode(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleDetailsPriceDiscount() {
  return GoogleFonts.firaCode(
    fontSize: 22,
    color: Colors.red,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleDetailsWeight() {
  return GoogleFonts.comfortaa(
    fontSize: 18,
    color: Colors.grey,
    fontWeight: FontWeight.w300,
  );
}

TextStyle styleDetailsLabel() {
  return GoogleFonts.comfortaa(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );
}

TextStyle styleDetailsParam() {
  return GoogleFonts.comfortaa(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );
}

TextStyle styleDetailsValue() {
  return GoogleFonts.comfortaa(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );
}

TextStyle styleDetailsValueRed() {
  return GoogleFonts.comfortaa(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w800,
  );
}

TextStyle styleAppBarTitle() {
  return GoogleFonts.comfortaa(
    fontSize: 22.0,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleAppBarTitleSmallBlack() {
  return GoogleFonts.comfortaa(
    fontSize: 17.0,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleAppBarTitleSmallGrey() {
  return GoogleFonts.comfortaa(
    fontSize: 15.0,
    color: Colors.grey,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCatalogElem() {
  return GoogleFonts.comfortaa(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleFavTileBrand() {
  return GoogleFonts.comfortaa(
    fontSize: 14.0,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
}

TextStyle styleFavTileLabel() {
  return GoogleFonts.comfortaa(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleCountLabel() {
  return GoogleFonts.comfortaa(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleFavTileWeight() {
  return GoogleFonts.comfortaa(
    fontSize: 14.0,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}

TextStyle styleFavTileWeightDiscount() {
  return GoogleFonts.comfortaa(
    fontSize: 14.0,
    color: Colors.red,
    fontWeight: FontWeight.w700,
  );
}

TextStyle styleFavTileTotal() {
  return GoogleFonts.comfortaa(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}

TextStyle stylePicTitle() {
  return GoogleFonts.comfortaa(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}

Widget placeholderCoffee() {
  return const Image(
    image: AssetImage('assets/img/placeholder_coffee.jpg'),
  );
}






