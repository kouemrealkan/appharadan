import 'package:haradanapp/Client/api_manager.dart';
import 'package:haradanapp/Client/services.dart';
import 'package:haradanapp/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:haradanapp/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:haradanapp/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:haradanapp/Library/carousel_pro/src/carousel_pro.dart';
import 'package:haradanapp/Library/countdown_timer/countDownTimer.dart';
import 'package:haradanapp/Model/BrandDataList.dart';
import 'package:haradanapp/Model/Haradan/CorporateAdvertModel.dart';
import 'package:haradanapp/Model/Haradan/SliderWidgetModel.dart';
import 'package:haradanapp/Model/Haradan/WindowAdvertsModel.dart';
import 'package:haradanapp/Model/HomeGridItemRecomended.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/AppBar_Component/AppbarGradient.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/CategoryDetail.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/DetailProduct.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/MenuDetail.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/PromotionDetail.dart';
import 'package:haradanapp/Screen/B1_HomeScreen/HomeUIComponent/Flash_Sale/FlashSale.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

/// Component all widget in home
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;

  bool isStarted = false;
  Future<WindowAdverts> _windowAdverts;
  Future<SliderModel> _sliderModels;
  Future<WindowAdverts> _lastAdverts;
  Future<EkuriModel> _corporateAdverts;
  @override
  void initState() {
    // TODO: implement initState
    _windowAdverts = ApiManager().getWindowAdverts();
    _sliderModels = ApiManager().getSliders();
    _lastAdverts = ApiManager().getLastAdverts();
    _corporateAdverts = ApiManager().getCorporateAdvertSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    var onClickMenuIcon = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new menuDetail(),
          transitionDuration: Duration(milliseconds: 750),

          /// Set animation with opacity
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to promoDetail.dart if user Click icon in Week Promotion
    var onClickWeekPromotion = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new promoDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to categoryDetail.dart if user Click icon in Category
    var onClickCategory = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new categoryDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    var imageSlider = Container(
      height: 182.0,
      child: FutureBuilder<SliderModel>(
        future: _sliderModels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 400.0, autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
                // aspectRatio: 16/9,
              ),
              items: snapshot.data.data.map((image) {
                return Container(
                  margin: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://haradan.com/slider" + image.media),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            /* return new Carousel(
              boxFit: BoxFit.cover,
              dotColor: Color(0xFF6991C7).withOpacity(0.8),
              dotSize: 5.5,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: true,
              overlayShadow: true,
              overlayShadowColors: Colors.white.withOpacity(0.9),
              overlayShadowSize: 0.9,
              images: [
                 snapshot.data.data
                    .map((e) =>
                        Image.network("https://haradan.com/slider" + e.media))
                    .toList().join(',')

               /* Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[0].media),

                Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[1].media),
                Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[2].media),  */

              /*  if (snapshot.data.data.length>1){
                  Image.network("https://haradan.com/slider" + snapshot.data.data[1].media),
                  if (snapshot.data.data.length>2){
                    Image.network("https://haradan.com/slider" + snapshot.data.data[2].media),

                    if (snapshot.data.data.length>3){
                      Image.network("https://haradan.com/slider" + snapshot.data.data[3].media),

                      if (snapshot.data.data.length>4){
                        Image.network("https://haradan.com/slider" + snapshot.data.data[4].media),

                      }
                    }
                  }

                }  */
              ],
            );       */
            return CircularProgressIndicator();
          }
        },
      ),
    );

    /// CategoryIcon Component
    var categoryIcon = Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context).tr('menu'),
              style: TextStyle(
                  fontSize: 13.5,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),

          /// Get class CategoryIconValue
          CategoryIconValue(
            tap1: onClickMenuIcon,
            icon1: "assets/icon/camera.png",
            title1: AppLocalizations.of(context).tr('camera'),
            tap2: onClickMenuIcon,
            icon2: "assets/icon/food.png",
            title2: AppLocalizations.of(context).tr('food'),
            tap3: onClickMenuIcon,
            icon3: "assets/icon/handphone.png",
            title3: AppLocalizations.of(context).tr('handphone'),
            tap4: onClickMenuIcon,
            icon4: "assets/icon/game.png",
            title4: AppLocalizations.of(context).tr('gamming'),
          ),
          Padding(padding: EdgeInsets.only(top: 23.0)),
          CategoryIconValue(
            icon1: "assets/icon/fashion.png",
            tap1: onClickMenuIcon,
            title1: AppLocalizations.of(context).tr('fashion'),
            icon2: "assets/icon/health.png",
            tap2: onClickMenuIcon,
            title2: AppLocalizations.of(context).tr('healthCare'),
            icon3: "assets/icon/pc.png",
            tap3: onClickMenuIcon,
            title3: AppLocalizations.of(context).tr('computer'),
            icon4: "assets/icon/mesin.png",
            tap4: onClickMenuIcon,
            title4: AppLocalizations.of(context).tr('equipment'),
          ),
          Padding(padding: EdgeInsets.only(top: 23.0)),
          CategoryIconValue(
            icon1: "assets/icon/otomotif.png",
            tap1: onClickMenuIcon,
            title1: AppLocalizations.of(context).tr('otomotif'),
            icon2: "assets/icon/sport.png",
            tap2: onClickMenuIcon,
            title2: AppLocalizations.of(context).tr('sport'),
            icon3: "assets/icon/ticket.png",
            tap3: onClickMenuIcon,
            title3: AppLocalizations.of(context).tr('ticketCinema'),
            icon4: "assets/icon/book.png",
            tap4: onClickMenuIcon,
            title4: AppLocalizations.of(context).tr('books'),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0))
        ],
      ),
    );

    var PromoHorizontalList = Container(
      color: Colors.white,
      height: 230.0,
      padding: EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 15.0, bottom: 3.0, right: 20.0),
              child: Text(
                AppLocalizations.of(context).tr('weekPromotion'),
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              )),
          Expanded(
            child: FutureBuilder<EkuriModel>(
                future: _corporateAdverts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: InkWell(
                                onTap: onClickWeekPromotion,
                                child: Image.network(Services.base_url+"/ekuri-ilani"+
                                    snapshot.data.data[index].media)),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    );

    /// ListView a WeekPromotion Component
    /* var PromoHorizontalList = Container(
      color: Colors.white,
      height: 230.0,
      padding: EdgeInsets.only(bottom: 40),
      child: FutureBuilder<EkuriModel>(
        future: _corporateAdverts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider(
              options: CarouselOptions(height: 400.0,autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
                // aspectRatio: 16/9,
              ),
              items: snapshot.data.data.map((image) {
                return Container(
                  margin: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://haradan.com/slider" + image.media), fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            );

          } else {


            /* return new Carousel(
              boxFit: BoxFit.cover,
              dotColor: Color(0xFF6991C7).withOpacity(0.8),
              dotSize: 5.5,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: true,
              overlayShadow: true,
              overlayShadowColors: Colors.white.withOpacity(0.9),
              overlayShadowSize: 0.9,
              images: [
                 snapshot.data.data
                    .map((e) =>
                        Image.network("https://haradan.com/slider" + e.media))
                    .toList().join(',')

               /* Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[0].media),

                Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[1].media),
                Image.network(
                    "https://haradan.com/slider" + snapshot.data.data[2].media),  */

              /*  if (snapshot.data.data.length>1){
                  Image.network("https://haradan.com/slider" + snapshot.data.data[1].media),
                  if (snapshot.data.data.length>2){
                    Image.network("https://haradan.com/slider" + snapshot.data.data[2].media),

                    if (snapshot.data.data.length>3){
                      Image.network("https://haradan.com/slider" + snapshot.data.data[3].media),

                      if (snapshot.data.data.length>4){
                        Image.network("https://haradan.com/slider" + snapshot.data.data[4].media),

                      }
                    }
                  }

                }  */
              ],
            );       */
            return CircularProgressIndicator();
          }
        },
      ),

    );   */

    /// FlashSale component
    var FlashSell = Container(
      height: 290.0,
      color: Colors.white,

      /// To set FlashSale Scrolling horizontal
      child: FutureBuilder<WindowAdverts>(
        future: _lastAdverts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...List.generate(snapshot.data.data.length, (index) {
                  return LastAdvertItem(snapshot.data.data[index]);
                }),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );

    /// Category Component in bottom of flash sale
    var categoryImageBottom = Container(
      height: 310.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context).tr('category'),
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Sans"),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        CategoryItemValue(
                          image: "assets/imgItem/category2.png",
                          title: AppLocalizations.of(context).tr('fashionMan'),
                          tap: onClickCategory,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        CategoryItemValue(
                          image: "assets/imgItem/category1.png",
                          title: AppLocalizations.of(context).tr('fashionGirl'),
                          tap: onClickCategory,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category3.png",
                        title: AppLocalizations.of(context).tr('smartphone'),
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category4.png",
                        title: AppLocalizations.of(context).tr('computer'),
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category5.png",
                        title: AppLocalizations.of(context).tr('sport'),
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category6.png",
                        title: AppLocalizations.of(context).tr('fashionKids'),
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category7.png",
                        title: AppLocalizations.of(context).tr('health'),
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category8.png",
                        title: AppLocalizations.of(context).tr('makeup'),
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    ///  Grid item in bottom of Category
    var Grid = SingleChildScrollView(
      child: FutureBuilder<WindowAdverts>(
        future: _windowAdverts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 20.0, right: 20.0),
                    child: Text(
                      AppLocalizations.of(context).tr('Vitrin İlanları'),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0,
                      ),
                    ),
                  ),

                  /// To set GridView item
                  GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 17.0,
                      childAspectRatio: 0.545,
                      crossAxisCount: 2,
                      primary: false,
                      children: List.generate(
                        snapshot.data.data.length,
                        (index) => ItemGrid(snapshot.data.data[index]),
                      ))
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        /// Use Stack to costume a appbar
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 58.5)),

                  /// Call var imageSlider
                  imageSlider,

                  /// Call var categoryIcon
                  categoryIcon,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),

                  /// Call var a FlashSell, i am sorry Typo :v
                  FlashSell,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  categoryImageBottom,
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                  ),

                  /// Call a Grid variable, this is item list in Recomended item
                  Grid,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),

                  /// Call var PromoHorizontalList
                  PromoHorizontalList,
                ],
              ),
            ),

            /// Get a class AppbarGradient
            /// This is a Appbar in home activity
            AppbarGradient(),
          ],
        ),
      ),
    );
  }
}

/// ItemGrid in bottom item "Recomended" item
class ItemGrid extends StatelessWidget {
  /// Get data from HomeGridItem.....dart class
  ///
  ///

  GridItem gridItem;
  Advert windowAdvert;
  ItemGrid(this.windowAdvert);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => new detailProduk(gridItem),
            transitionDuration: Duration(milliseconds: 900),

            /// Set animation Opacity in route to detailProduk layout
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Set Animation image to detailProduk layout
                Hero(
                  tag: "hero-grid-${windowAdvert.identifier}",
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new Material(
                                color: Colors.black54,
                                child: Container(
                                  padding: EdgeInsets.all(30.0),
                                  child: InkWell(
                                    child: Hero(
                                        tag: "hero-grid-${gridItem.id}",
                                        child: Image.asset(
                                          windowAdvert.imageUrl,
                                          width: 300.0,
                                          height: 300.0,
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                        )),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            },
                            transitionDuration: Duration(milliseconds: 500)));
                      },
                      child: Container(
                        height: 146.5, //mediaQueryData.size.height / 3.3,
                        width: 185.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0)),
                            image: DecorationImage(
                                image: NetworkImage(Services.base_url +
                                    (windowAdvert.imageUrl == null
                                        ? '/img/default-ad.png'
                                        : windowAdvert.imageUrl)),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    windowAdvert.city,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    windowAdvert.title.toString(),
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        windowAdvert.price.toString(),
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Component FlashSaleItem
class LastAdvertItem extends StatelessWidget {
  Advert lastAdverts;
  LastAdvertItem(this.lastAdverts);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10.0)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850)));
              },
              child: Container(
                height: 270.0,
                width: 145.0,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 140.0,
                      width: 145.0,
                      child: Image.network(Services.base_url +
                          (lastAdverts.imageUrl == null
                              ? '/img/default-ad.png'
                              : lastAdverts.imageUrl)),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
                      child: Text(lastAdverts.title,
                          style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                      child: Text(lastAdverts.price.toString(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF7F7FD5),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 10.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 10.0, right: 10.0),
                      child: Container(
                        height: 5.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

/// Component category item bellow FlashSale
class CategoryItemValue extends StatelessWidget {
  String image, title;
  GestureTapCallback tap;

  CategoryItemValue({
    this.image,
    this.title,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 105.0,
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            color: Colors.black.withOpacity(0.25),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Berlin",
              fontSize: 18.5,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w800,
            ),
          )),
        ),
      ),
    );
  }
}

/// Component item Menu icon bellow a ImageSlider
class CategoryIconValue extends StatelessWidget {
  String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  GestureTapCallback tap1, tap2, tap3, tap4;

  CategoryIconValue(
      {this.icon1,
      this.tap1,
      this.icon2,
      this.tap2,
      this.icon3,
      this.tap3,
      this.icon4,
      this.tap4,
      this.title1,
      this.title2,
      this.title3,
      this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: tap1,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon1,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title1,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap2,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon2,
                height: 26.2,
              ),
              Padding(padding: EdgeInsets.only(top: 0.0)),
              Text(
                title2,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap3,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon3,
                height: 22.2,
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Text(
                title3,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap4,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon4,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title4,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
