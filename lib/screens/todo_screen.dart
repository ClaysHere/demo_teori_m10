import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _todos = [
    "Belajar Flutter",
    "Belajar Kriptografi",
    "Cabut 2 sks"
  ];

  final TextEditingController _todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Tambah Todo"),
                        content: Expanded(
                            child: TextField(
                          controller: _todo,
                          decoration: const InputDecoration(
                              hintText: "Masukkan todo..."),
                        )),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Batal")),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _todos.add(_todo.text);
                              });

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    const Text("Data berhasil di tambahkan"),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    setState(() {});
                                    _todos.removeLast();
                                  },
                                ),
                              ));
                            },
                            child: const Text("Oke"),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              ..._todos.map((e) => Text(e))
            ],
          ),
        ),
      ),
    );
  }
}
