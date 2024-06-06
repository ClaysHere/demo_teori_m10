import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  bool koneksi = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner Screen"),
      ),
      body: Center(
        child: SwitchListTile(
          secondary: const Icon(Icons.wifi),
          onChanged: (value) {
            setState(() {
              koneksi = value;
            });
            if (koneksi == false) {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  leading: const Icon(Icons.wifi),
                  content: const Text(
                      "Koneksi kamu terputus, aplikasi harus online."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            koneksi = true;
                          });
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        child: const Text("Nyalakan Internet"))
                  ]));
            }
          },
          value: koneksi,
          title: const Text("Connection"),
        ),
      ),
    );
  }
}
