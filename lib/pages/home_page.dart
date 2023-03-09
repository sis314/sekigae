import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sekigae/pages/customize_page.dart';
import 'package:sekigae/pages/info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("席替え侍"),
            Expanded(child: SizedBox()),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InfoPage()));
                },
                icon: Icon(Icons.info_outline),
                label: Text("情報"),
            )
          ],
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "席替え侍",
          style: TextStyle(fontSize: 50),
        ),
        const Text(
          "開発版",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          child: const Text("CSVファイルを選ぶ"),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
                dialogTitle: "CSVファイルを選んでください");
            if (result != null) {
              print(result.paths);
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomizePage()));
            } else {}
          },
        ),
      ])),
    );
  }
}
