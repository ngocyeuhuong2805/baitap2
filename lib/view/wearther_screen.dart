import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/untils/constant.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey[100]!,
              Colors.blueGrey[500]!,
              Colors.blueGrey[800]!,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.keyboard_backspace, size: 30, color: Colors.white,)),
            actions: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(Icons.settings,),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(Icons.home),
                  ),
                ],
              )
            ],
          ),
          body: _buildUI(context),
        ),
      ),
    );
  }

  Padding _buildUI(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('21:30', style: kText2Style,),
              const Text('Hà Nội', style: kText3Style,),
              Container(
                width: MediaQuery.sizeOf(context).width/3.5,
                color: Colors.white,
                height: 1,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              const Text('Clear & Sunny\nDay', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-ha-noi.jpg',
                        width: MediaQuery.sizeOf(context).width/1.1,
                        height: MediaQuery.sizeOf(context).height/4.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                          width: MediaQuery.sizeOf(context).width/2.5,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(text: "21", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: "h", style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: ":", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: "30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: "m", style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: ":", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: "56", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23)),
                                TextSpan(text: "s", style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w700, fontSize: 23)),
                              ]
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                            ),
                            child: const Icon(Icons.location_on, size: 20, color: Colors.red,),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.sizeOf(context).width/2.5,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 10,),
                                Text('livestreetview.com', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                                Icon(Icons.link, size: 20, color: Colors.black,),
                                SizedBox(width: 10,),
                              ],
                            ),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Text('Details', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherWidget(title: 'Wind', icon: Icons.wind_power, content: '3.4 km/h'),
                    WeatherWidget(title: 'Humidity', icon: Icons.water_drop_rounded, content: '78%'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherWidget(title: 'UV Index', icon: Icons.ac_unit_rounded, content: '=> (2)'),
                    WeatherWidget(title: 'Pressure', icon: Icons.access_time, content: '1016hpa'),
                  ],
                ),
              ),
              buildChartWeather()


            ],
          ),
        );
  }

  Container buildChartWeather() {
    return Container(
                margin: const EdgeInsets.only(top: 20),
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10 ),
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),

                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 24,
                          interval: 1,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text;
                            switch (value.toInt()) {
                              case 0:
                                text = 'Now';
                                break;
                              case 1:
                                text = '22:00';
                                break;
                              case 2:
                                text = '23:00';
                                break;
                              case 3:
                                text = '00:00';
                                break;
                              case 4:
                                text = '01:00';
                                break;
                              default:
                                return const SizedBox.shrink();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(text, style: const TextStyle(color: Colors.white)),
                            );
                          },
                        ),
                      ),

                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 24,
                          interval: 1,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            String text;
                            switch (value.toInt()) {
                              case 0:
                                text = '10°';
                                break;
                              case 1:
                                text = '9°';
                                break;
                              case 2:
                                text = '8°';
                                break;
                              case 3:
                                text = '6°';
                                break;
                              case 4:
                                text = '6°';
                                break;
                              default:
                                return const SizedBox.shrink();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(text, style: const TextStyle(color: Colors.white)),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 10),
                          const FlSpot(1, 9),
                          const FlSpot(2, 8),
                          const FlSpot(3, 6),
                          const FlSpot(4, 6),
                        ],
                        isCurved: true,
                        color: Colors.white,
                        barWidth: 1,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 1,
                              strokeColor: Colors.white,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.white,
                        getTooltipItems: (List<LineBarSpot> spots) {
                          return spots.map((spot) {
                            return LineTooltipItem(
                              '${spot.y.toInt()}°',
                              const TextStyle(color: Colors.black),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              );
  }
}

class WeatherWidget extends StatelessWidget {
  final String title;
  final IconData icon; 
  final String content;
  const WeatherWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width/2.6,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20,),
              const SizedBox(width: 5,),
              Text(title, style: kText2Style,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(content, style: kText2Style,),
        ),
      ],
    );
  }
}
