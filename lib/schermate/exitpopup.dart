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
                Text("Uscire dall'APP?"),
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
                        label: Text('Conferma'),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop(false);
                        },
                        child: Text("Annulla",
                            style: TextStyle(color: Colors.white)),
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
