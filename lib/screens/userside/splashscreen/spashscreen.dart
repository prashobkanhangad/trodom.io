import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/db/function/market/marketfunctions.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';
import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/db/model/tradecategory/tradecategory.dart';

import '../../../db/function/signal/signalfunctions.dart';
import '../../../db/model/learn/learndatamodel.dart';
import '../../../db/model/marketmodel/marketdatamodel.dart';
import '../../../db/model/signalmodel/signaldatamodel.dart';
import '../../../db/model/tradeideamodel/tradeideadatamodel.dart';
import '../loginscreen/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();

    final _catogorytrade = CategoryModel(
        type: CategoryType.intraday,
        id: '0',
        entryprice: '225.0',
        stockname: 'Reliance',
        stoploss: '200.5',
        targetprice: '250.5');

    CategoryDB().insertCategory(_catogorytrade);

    String marketimage = 'asset/chart.jpg';

    final _marketdata = marketmodel(
        markettitle: markettitle,
        marketnews: marketnews,
        marketimage: null.toString(),
        marketdate: '10-11-2022');

    log(marketimage);

    addPredifindmarket(_marketdata, 0);
    // market data ends here

    final _learndata_0 = learnmodel(
        learntitle: learn_title[0],
        learncontent: learn_news[0],
        learnimage: null.toString());

    final _learndata_1 = learnmodel(
        learntitle: learn_title[1],
        learncontent: learn_news[1],
        learnimage: null.toString());

    final _learndata_2 = learnmodel(
        learntitle: learn_title[2],
        learncontent: learn_news[2],
        learnimage: null.toString());

    final _learndata_3 = learnmodel(
        learntitle: learn_title[3],
        learncontent: learn_news[3],
        learnimage: null.toString());

    final _learndata_4 = learnmodel(
        learntitle: learn_title[4],
        learncontent: learn_news[4],
        learnimage: null.toString());

    addPredifinedlearn(_learndata_0, 0);
    addPredifinedlearn(_learndata_1, 1);
    addPredifinedlearn(_learndata_2, 2);
    addPredifinedlearn(_learndata_3, 3);
    addPredifinedlearn(_learndata_4, 4);

// learndata ends here

    final _signaldata_0 = signalmodel(
        signaltitle: signal_title[0], signalimage: null.toString(), id: 0);

    final _signaldata_1 = signalmodel(
        signaltitle: signal_title[1], signalimage: null.toString(), id: 0);

    final _signaldata_2 = signalmodel(
        signaltitle: signal_title[2], signalimage: null.toString(), id: 0);

    final _signaldata_3 = signalmodel(
        signaltitle: signal_title[3], signalimage: null.toString(), id: 0);

    final _signaldata_4 = signalmodel(
        signaltitle: signal_title[4], signalimage: null.toString(), id: 0);

    addPredifinedsignal(_signaldata_0, 0);
    addPredifinedsignal(_signaldata_1, 1);
    addPredifinedsignal(_signaldata_2, 2);
    addPredifinedsignal(_signaldata_3, 3);
    addPredifinedsignal(_signaldata_4, 4);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/splashScreen.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  final markettitle =
      'Another Close Above 18,000 Magnet! V-Shaped Recoveries - Post Market Analysis';

  final marketnews =
      'NIFTY opened the day at 18,044 with a gap-down of 112 pts. After the first half of the volatile drama, it broke 18k after 12 PM. But 17,970 acted as good support and the index formed a double bottom pattern. With the help of 3 PM buying, Nifty closed the day at 18,028, down by 128 points or 0.71%. But 17,970 acted as good support and the index formed a double bottom pattern. With the help of 3 PM buying, Nifty closed the day at 18,028, down by 128 points or 0.71%';

  List learn_title = [
    'What are Blue Chip Stocks?',
    'Who are Domestic Institutional Investors (DIIs)?',
    'What are Unit-Linked Insurance Plans (ULIPs)?',
    'Who are Foreign Institutional Investors (FII)?',
    'Understanding the Different Types of Cryptocurrencies'
  ];

  List learn_news = [
    'Blue-chip stocks are stocks of established companies that are the leading entities in their sector and are highly reputed. These are large, organised and fundamentally strong companies that have been operating for many years.These blue-chip stocks are also known for paying out regular dividends to their shareholders over time. Most of these stocks generate stable returns for investors and are known to have much lower downside risk in times of market recessions, inflation, and economic downturns.',
    'Domestic Institutional InvestorDIIs are institutions based in India such as mutual funds, insurance companies, pension funds, and banks & other financial institutions. They pool funds from clients and invest them in equity as well as other financial assets such as debt and gold. Let us look at how DIIs have performed in the financial year 2021-22 (FY 22) so far',
    'Buying an insurance plan/policy is essential to make yourself financially secure to face any unexpected or sudden problems in life. It provides a cover against any sudden loss. However, did you know that there is a financial product that combines insurance and investment benefits in a single planUnit-Linked Insurance Plans (ULIPs) provide a mix of both life insurance and investment. Insurance companies offer ULIPs so that their clients can get life cover and also reap the benefits of investing in equity and debt funds. It creates a habit of regular and disciplined savings.',
    'Foreign institutional investors (FIIs) are those investors or funds that are based out of a foreign country and invest in the securities market of other countries. The term is most commonly used in India, where it refers to outside entities investing in the nations financial markets.FIIs can include hedge funds, insurance companies, pension funds, investment banks, and mutual funds. FIIs are important sources of capital in developing economies. However, India has placed limits on the total value of assets an FII can purchase and the number of equity shares they can buy.',
    'Cryptocurrencies have become extremely popular across the globe over the past few years. Multiple crypto exchanges have sprung up in India, making it easier for you and me to invest or trade in the tens of thousands of cryptocurrencies available today. However, it is vital that we understand the various categories of cryptos and their features before investing in them. In this article, we shall discuss different types of cryptocurrencies. '
  ];

  List signal_title = [
    'Bank Nifty breaking the support near recent all- time high',
    'Bank nifty takes support from 42,000',
    'Nifty is trying to break the opening candle, beautiful',
    'Most of the indices are witnessing profit booking',
    'Finnifty breaks the day low and falls below 42k'
  ];
}
