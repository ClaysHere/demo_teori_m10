import 'package:demo_teori_m10/screens/test_screen.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Tambah User"),
                          content: const SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              children: [TextField(), TextField()],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Batal")),
                            TextButton(
                                onPressed: () {}, child: const Text("Oke")),
                          ],
                        );
                      });
                },
                child: const Text("Open Alert Dialog")),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Pilihan"),
                      children: [
                        const checkTest(),
                        SimpleDialogOption(
                          child: CheckboxListTile(
                              title: const Text("Pilihan 2"),
                              value: false,
                              onChanged: (value) {}),
                        ),
                      ],
                    );
                  });
            },
            child: const Text("Open Simple Dialog"),
          ),
          TextButton(
              onPressed: () {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Dialog.fullscreen(
                //       child: Column(
                //         children: [
                //           const Center(
                //             child: Text("Full Screen Dialog"),
                //           ),
                //           IconButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //               icon: const Icon(Icons.close))
                //         ],
                //       ),
                //     );
                //   },
                // );

                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return const TestScreen();
                  },
                ));
              },
              child: const Text("Open Full Screen Dialog"))
        ],
      ),
    );
  }
}

class checkTest extends StatefulWidget {
  const checkTest({
    super.key,
  });

  @override
  State<checkTest> createState() => _checkTestState();
}

class _checkTestState extends State<checkTest> {
  bool opsi = false;
  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: CheckboxListTile(
          title: const Text("Pilihan 1"),
          value: opsi,
          onChanged: (value) {
            setState(() {
              opsi = value!;
            });
          }),
    );
  }
}
