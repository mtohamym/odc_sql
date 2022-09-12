import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_sql/add_plant.dart';
import 'package:odc_sql/database.dart';
import 'package:odc_sql/plant_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Plant> allPlants = [];

  @override
  void initState() {
    SQLHelper.initDb();
    getAllPlants();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          secondaryHeaderColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.green)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "ODC Plants",
            style: GoogleFonts.roboto(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: allPlants.length == 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "جرجير ",
                          style: GoogleFonts.lalezar(
                              fontSize: 30, color: Colors.green),
                        ),
                        Text(
                          "ملقتش داتا جبتلك",
                          style: GoogleFonts.lalezar(fontSize: 30),
                        ),
                      ],
                    ),
                    Image.asset("assets/images/garger.png"),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "All Plants ",
                      style: GoogleFonts.roboto(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allPlants.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => new AddPlant.withPlant(allPlants[index])));
                              },
                              leading: Image.asset("assets/images/garger.png"),
                              title: Text(allPlants[index].name),
                              subtitle: Text(allPlants[index].description),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new AddPlant()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void getAllPlants()  {
    //todo get plants from db
     SQLHelper.getPlants().then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          allPlants.add(Plant.fromDbMap(value[i]));
        });
      }
    });
  }
}
