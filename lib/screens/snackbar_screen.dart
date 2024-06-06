import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              content: const Text("peringatan ada penyusup dikelas !"),
              action: SnackBarAction(label: "Usir", onPressed: () {}),
            ));
          },
          child: const Text("Show Snackbar"),
        ),
      ),
    );
  }
}
