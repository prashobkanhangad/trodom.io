import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/tutorialscreen/tutorialscreeninside.dart';
import 'package:flutter/services.dart';

class TutorialScrenn extends StatelessWidget {
  TutorialScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 132, 122),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 10),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TutorialScreenInside(
                    title: coursesList[index],
                    id: index,
                    description: description[index],
                  ),
                )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      coursesList[index],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: coursesList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
                // height: 0,
                );
          },
        ),
      ),
    );
  }

  List coursesList = [
    'Introduction To Stock MArket',
    'Basics of stock market',
    'Intraday trading in equity',
    'Swing Trading',
    'Futures and options'
  ];
  List description = [
    'The stock market is a component of a free-market economy. It allows companies to raise money by offering stock shares and corporate bonds and allows investors to participate in the financial achievements of the companies, make profits through capital gains, and earn income through dividends. The stock market works as a platform through which savings and investments of individuals are efficiently channeled into productive investment opportunities and add to the capital formation and economic growth of the country.',
    'Stock trading involves buying and selling stocks frequently in an attempt to time the market. The goal of stock traders is to capitalize on short-term market events to sell stocks for a profit, or buy stocks at a low. Some stock traders are day traders, which means they buy and sell several times throughout the day. Others are simply active traders, placing a dozen or more trades per month. (Interested in individual stocks? View our list of the best-performing stocks this year. Investors who trade stocks do extensive research, often devoting hours a day to following the market. They rely on technical stock analysis, using tools to chart a stocks movements in an attempt to find trading opportunities and trends. Many online brokers offer stock trading information, including analyst reports, stock research and charting tools. (Learn the basics of how to read stock charts.)',
    'Intraday trading refers to buying and selling of stocks on the same day. It is done using online trading platforms. Suppose a person buys stock for a company, they have to specifically mention ‘intraday’ in the portal of the platform used. This enables the user to buy and sell the same number of stocks of the same company on the same day before the market closes. The purpose is earning profits through the movement of market indices. It is also referred to as Day Trading by manStock market earns you great returns if you are a long-term investor. But even on the short term, they can help you earn profits. Suppose a stock opens trade at Rs 500 in the morning. Soon, it climbs to Rs. 550 within an hour or two. If you had bought 1,000 stocks in the morning and sold at Rs 550, you would have made a cool profit of Rs 50,000 – all within a few hours. This is called intraday trading.',
    'Each type of trading has its advantages and disadvantages. Swing trading refers to the practice of trying to profit from market swings of a minimum of 1 day and as long as several weeks. If losses can be kept to acceptable levels using stop loss techniques, swing trading can be profitable and provide a good perspective to learn about both the short-term and long-term market movements. The downside of swing trading is that you must work hard all the time to manage trades, which means you might miss out on potential profits due to market moves.',
    'Each type of trading has its advantages and disadvantages. Swing trading refers to the practice of trying to profit from market swings of a minimum of 1 day and as long as several weeks. If losses can be kept to acceptable levels using stop loss techniques, swing trading can be profitable and provide a good perspective to learn about both the short-term and long-term market movements. The downside of swing trading is that you must work hard all the time to manage trades, which means you might miss out on potential profits due to market moves.'
  ];
}
