import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../Provider/theme_change.dart';
import '../Services/call_urls.dart';
import 'country_data_screen.dart';

class WorldData extends StatefulWidget {
  const WorldData({Key? key}) : super(key: key);

  @override
  State<WorldData> createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  List<MaterialColor> colors = [Colors.red, Colors.green, Colors.blue];
  var switchValue = false;
  @override
  Widget build(BuildContext context) {
    print("build again");
    CallUrls callUrls = CallUrls();
    final provider = Provider.of<ThemeChangeProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text("World data "),
          actions: [
            Switch(
                // inactiveTrackColor: Colors.black,
                activeColor: Colors.blueGrey,
                value: switchValue,
                onChanged: (value) {
                  print("VALUE $value");
                  provider.setTheme();
                  switchValue = value;
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FutureBuilder(
                future: callUrls.fetchWorldData(),
                builder: (BuildContext context, snapshot) {
                  print("world data === $snapshot");
                  return !snapshot.hasData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            PieChart(
                              dataMap: {
                                "Total": snapshot.data!.todayCases!.toDouble(),
                                "Recovered":
                                    snapshot.data!.todayRecovered!.toDouble(),
                                "Death": snapshot.data!.todayDeaths!.toDouble(),
                              },
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.5,
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                //chartValueBackgroundColor: Colors.lightGreenAccent
                                showChartValuesOutside: true,
                              ),
                              colorList: colors,
                              chartType: ChartType.ring,
                              legendOptions: const LegendOptions(
                                legendShape: BoxShape.circle,
                                legendPosition: LegendPosition.left,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 350,
                              width: double.infinity,
                              child: Card(
                                  child: ListView(
                                children: [
                                  ListTile(
                                    leading: const Text("Cases"),
                                    trailing: Text(
                                        snapshot.data?.cases.toString() ?? ""),
                                  ),
                                  ListTile(
                                    leading: const Text("Active"),
                                    trailing: Text(
                                        snapshot.data?.active.toString() ?? ""),
                                  ),
                                  ListTile(
                                    leading: const Text("AffectedCountries"),
                                    trailing: Text(snapshot
                                            .data?.affectedCountries
                                            .toString() ??
                                        ""),
                                  ),
                                  ListTile(
                                    leading: const Text("Critical"),
                                    trailing: Text(
                                        snapshot.data?.critical.toString() ??
                                            ""),
                                  ),
                                  ListTile(
                                    leading: const Text("Deaths"),
                                    trailing: Text(
                                        snapshot.data?.deaths.toString() ?? ""),
                                  ),
                                  ListTile(
                                    leading: const Text("Recovered"),
                                    trailing: Text(
                                        snapshot.data?.recovered.toString() ??
                                            ""),
                                  ),
                                  ListTile(
                                    leading: const Text("Tests"),
                                    trailing: Text(
                                        snapshot.data?.tests.toString() ?? ""),
                                  ),
                                ],
                              )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CountryScreen()));
                                    },
                                    child: const Text("Track Countries")))
                          ],
                        );
                }),
          ),
        ));
  }
}
