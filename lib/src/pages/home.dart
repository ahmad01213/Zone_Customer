import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:markets/new/widgets/helpers.dart';
import 'package:markets/src/elements/DrawerWidget.dart';
import 'package:markets/src/models/address.dart';
import 'package:markets/src/repository/market_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../generated/l10n.dart';
import '../controllers/home_controller.dart';
import '../elements/CardsCarouselWidget.dart';
import '../elements/CaregoriesCarouselWidget.dart';
import '../elements/HomeSliderWidget.dart';
import '../elements/ProductsCarouselWidget.dart';
import '../elements/ReviewsListWidget.dart';
import '../elements/SearchBarWidget.dart';
import '../repository/settings_repository.dart' as settingsRepo;
class HomeWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;
  HomeWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<HomeWidget> {
  HomeController _con;
  _HomeWidgetState() : super(HomeController()) {
    _con = controller;
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // this will hide Drawer hamburger icon
          actions: <Widget>[Container()],
          elevation: 1,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(
                    Icons.sort,
                    size: 30,
                    color: Color(0xFF343A40),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    LocationResult result =await showLocationPicker(
                        context,
                        Platform.isIOS?"AIzaSyDJ6UDHt4avEm0mjMYTBD5SHdHkd4Odau4":
                        'AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4'
                        ,
                        initialCenter: LatLng(31.1975844, 29.9598339),
                        myLocationButtonEnabled: true,
                        layersButtonEnabled: false,
                        language: "ar",
                        appBarColor:Colors.white,
                        searchBarBoxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )
                      // countries: ['AE', 'NG'],
                    );
                    Address address = Address.fromJSON({"latitude": result.latLng.latitude, "longitude": result.latLng.longitude});
                    settingsRepo.deliveryAddress =  ValueNotifier(address);
                    setState(() {
                      addressName = result.address;
                    });
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "التوصيل إلي",
                            style: TextStyle(color: Colors.orange, fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:MediaQuery.of(context).size.width-170,
                                child: Text(addressName,
                                    maxLines: 1,
                                    style:
                                    TextStyle(color: Colors.grey, fontSize: 14)),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 21,
                                color: mainColor,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.location_on,
                        size: 35,
                        color: mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      )    ,
      drawer: DrawerWidget()
      , body: RefreshIndicator(
        onRefresh: _con.refreshHome,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(settingsRepo.setting.value.homeSections.length, (index) {
              String _homeSection = settingsRepo.setting.value.homeSections.elementAt(index);
              switch (_homeSection) {

                case 'slider':
                  return HomeSliderWidget(slides: _con.slides);
                case 'search':
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: SearchBarWidget(
                      onClickFilter: (event) {
                        widget.parentScaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  );
                case 'top_markets_heading':
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).top_markets,
                                style: Theme.of(context).textTheme.headline4,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     if (currentUser.value.apiToken == null) {
                            //       _con.requestForCurrentLocation(context);
                            //     } else {
                            //       var bottomSheetController = widget.parentScaffoldKey.currentState.showBottomSheet(
                            //         (context) => DeliveryAddressBottomSheetWidget(scaffoldKey: widget.parentScaffoldKey),
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            //         ),
                            //       );
                            //       bottomSheetController.closed.then((value) {
                            //         _con.refreshHome();
                            //       });
                            //     }
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.all(Radius.circular(5)),
                            //       color: settingsRepo.deliveryAddress.value?.address == null
                            //           ? Theme.of(context).focusColor.withOpacity(0.1)
                            //           : Theme.of(context).accentColor,
                            //     ),
                            //     child: Text(
                            //       S.of(context).delivery,
                            //       style: TextStyle(
                            //           color:
                            //               settingsRepo.deliveryAddress.value?.address == null ? Theme.of(context).hintColor : Theme.of(context).primaryColor),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(width: 7),
                            // InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //       settingsRepo.deliveryAddress.value?.address = null;
                            //     });
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.all(Radius.circular(5)),
                            //       color: settingsRepo.deliveryAddress.value?.address != null
                            //           ? Theme.of(context).focusColor.withOpacity(0.1)
                            //           : Theme.of(context).accentColor,
                            //     ),
                            //     child: Text(
                            //       S.of(context).pickup,
                            //       style: TextStyle(
                            //           color:
                            //               settingsRepo.deliveryAddress.value?.address != null ? Theme.of(context).hintColor : Theme.of(context).primaryColor),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        if (settingsRepo.deliveryAddress.value?.address != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              S.of(context).near_to + " " + (settingsRepo.deliveryAddress.value?.address),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                      ],
                    ),
                  );
                case 'top_markets':
                  return CardsCarouselWidget(marketsList: _con.topMarkets, heroTag: 'home_top_markets');
                case 'trending_week_heading':
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                    child: Text(
                      S.of(context).trending_this_week,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                case 'trending_week':
                  return ProductsCarouselWidget(productsList: _con.trendingProducts, heroTag: 'home_product_carousel');
                case 'categories_heading':
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      leading: Icon(
                        Icons.category_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                      title: Text(
                        S.of(context).product_categories,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  );
                case 'categories':
                  return Column(
                    children: [


                      CategoriesCarouselWidget(
                        categories: _con.categories,
                      ),
                    ],
                  );
                case 'popular_heading':
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      S.of(context).most_popular,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                case 'popular':
                  return       CardsCarouselWidget(marketsList: _con.popularMarkets, heroTag: 'home_markets');


                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: GridWidget(
                  //     marketsList: _con.popularMarkets,
                  //     heroTag: 'home_markets',
                  //   ),
                  // );
                case 'recent_reviews_heading':
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      leading: Icon(
                        Icons.recent_actors_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                      title: Text(
                        S.of(context).recent_reviews,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  );
                case 'recent_reviews':
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReviewsListWidget(reviewsList: _con.recentReviews),
                  );
                default:
                  return SizedBox(height: 0);
              }
            }),
          ),
        ),
      ),
    );
  }
}
