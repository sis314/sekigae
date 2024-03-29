import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

import '../app_theme.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({Key? key}) : super(key: key);

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background_color,
      appBar: AppBar(
        backgroundColor:AppTheme.app_bar_color ,
        title: const Text("結果の保存"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    child: const Text("出力"),
                    onPressed: () async {
                      String? path = await getSavePath(
                        acceptedTypeGroups: [
                          const XTypeGroup(label: 'pdf', extensions: ['pdf'])
                        ],
                        suggestedName: "seat.pdf",
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
