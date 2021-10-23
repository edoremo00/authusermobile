import 'package:flutter/material.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Icon(Icons.exit_to_app_rounded),
                Expanded(child: Text("Uscire dall'App?")),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('yes selected');
                          //exit(0);

                          Navigator.of(context).pop(true);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        icon: Icon(Icons.check),
                        label: Text(
                          'Conferma',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop(false);
                        },
                        label: Text(
                          "Annulla",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        icon: Icon(Icons.cancel_sharp),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
