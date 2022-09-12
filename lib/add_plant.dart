import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_sql/database.dart';
import 'package:odc_sql/plant_model.dart';

import 'components/custom_text.dart';
import 'home.dart';

class AddPlant extends StatelessWidget {
  AddPlant();

  AddPlant.withPlant(this.plantDetail) {
    nameEt.text = plantDetail!.name;
    descriptionEt.text = plantDetail!.description;
  }

  Plant? plantDetail;

  TextEditingController nameEt = TextEditingController();
  TextEditingController descriptionEt = TextEditingController();

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
          elevation: 2,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new Home()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text("Add Plant",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CustomTextInput("Enter Name", nameEt, TextInputType.text, false),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              CustomTextInput(
                  "Enter Decription", descriptionEt, TextInputType.text, false),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  if (plantDetail == null) {
                    //todo add plant to db
                    SQLHelper.addPlant(
                        nameEt.text.toString(), descriptionEt.text.toString());
                  } else {
                    //todo update plant from ui
                    SQLHelper.updatePlant(plantDetail!.id,
                        nameEt.text.toString(), descriptionEt.text.toString());
                  }
                },
                child: Text(plantDetail == null ? "Add Plant to DB" : "Update"),
              ),
              plantDetail == null
                  ? SizedBox()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        //todo delete plant from ui
                        SQLHelper.deletePlant(plantDetail!.id);

                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Home()));
                      },
                      child: Text("Delete"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
