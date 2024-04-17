import 'package:bitcoin_icons/bitcoin_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../auth/login_screen.dart';
import '../controller/crypto_controller.dart';
import '../model/crypto_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final CryptoService cryptoService =
      CryptoService(); // Instantiate the service class

  /// Future to fetch crypto data
  Future<CryptoModel?> fetchCryptoData() async {
    return await cryptoService.fetchCryptoData();
  }

  String userName = "User Name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black12,
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 18,
                                    child: Icon(Icons.flutter_dash_rounded),
                                  ),
                                ),
                                Text(
                                  userName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white12,
                            ),
                            child: IconButton(
                              icon: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹64,235",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                Text(
                                  ".00",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 17.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white24,
                          ),
                          child: Text(
                            "+4.58%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          3,
                          (index) => Container(
                                padding: const EdgeInsets.all(8.0),
                                height: 10.h,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      colors: [
                                        Colors.white.withOpacity(0.4),
                                        Colors.transparent,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          _getIconData(index),
                                          size: 30.sp,
                                          color: Colors.white70,
                                        ),
                                        Text(
                                          _getText(index),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    )
                                  ],
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size(30.w, 6.h),
                              backgroundColor: Colors.black12,
                              shape: const StadiumBorder(),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {},
                          child: Text(
                            "Add",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size(30.w, 6.h),
                              backgroundColor: Colors.black54,
                              shape: const StadiumBorder(),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {},
                          child: Text(
                            "Withdraw",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Crypto Currencies",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.lightBlueAccent)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 8.0),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Column(
                      children: [
                        Flexible(
                          child: FutureBuilder<CryptoModel>(
                            future: cryptoService.fetchCryptoData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text(
                                        'Failed to load data: ${snapshot.error}'));
                              } else if (snapshot.hasData) {
                                final cryptoModel = snapshot.data;

                                if (cryptoModel == null ||
                                    cryptoModel.data == null ||
                                    cryptoModel.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No data available'));
                                }
                                return ListView.builder(
                                  itemCount: cryptoModel.data!.length,
                                  itemBuilder: (context, index) {
                                    final crypto = cryptoModel.data![index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Card(
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        color: Colors.white30,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: CachedNetworkImage(
                                                  imageUrl: crypto.image!,
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  crypto.name ?? 'NA',
                                                  style: TextStyle(
                                                    fontSize: 15.0.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    crypto
                                                        .priceChangePercentage24H
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$ ${crypto.currentPrice.toString()}',
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: Text('Unknown error'));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      },
        child: const Icon(Icons.logout, color: Colors.red,),
      ),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return BitcoinIcons.bitcoin;
      case 1:
        return CryptoFontIcons.etc;
      case 2:
        return CryptoFontIcons.shib;
      default:
        return Icons.error;
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return '+0.091 BTC';
      case 1:
        return '+0.74 ETH';
      case 2:
        return '-9.379 SHIB';

      default:
        return 'Error';
    }
  }
}
