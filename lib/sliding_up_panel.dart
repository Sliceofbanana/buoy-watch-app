import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class SlidingUpPanelWidget extends StatelessWidget {
  const SlidingUpPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        Color getColor() {
          switch (weatherProvider.condition) {
            case 'alert':
              return Colors.red;
            case 'moderate':
              return Colors.orange;
            default:
              return Colors.green;
          }
        }

        String getCurrentDateTime() {
          final now = DateTime.now();
          return "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
        }

        return Container(
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey,
              ),
            ],
          ),
          margin: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "Date and Time:",
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                Text(
                  getCurrentDateTime(),
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Weather Condition:",
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                Text(
                  weatherProvider.status,
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Implement your admin alert logic here
                    print("Alert sent to admin with current location and date");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color
                    padding: EdgeInsets.all(10), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                  ),
                  child: Text(
                    'EMERGENCY ALERT',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
