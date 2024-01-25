import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/button_back.dart';
import '../widgets/button_setting.dart';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ShowScanScreen extends StatefulWidget {
  final String imagePath;
  const ShowScanScreen({super.key, required this.imagePath});
  @override
  State<ShowScanScreen> createState() => _ShowScanScreenState();
}

class _ShowScanScreenState extends State<ShowScanScreen> {
  //final InputImage inputImage;
  //final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                    BorderSide(color: AppTheme.primaryOrange, width: 1.5),
                  ),
                  color: AppTheme.greyWhite),
              height: 60,
              child: const Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  ButtonBack(),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.document_scanner_outlined),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(
                            'SCAN',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonSetting(),
                  Padding(padding: EdgeInsets.only(right: 10)),
                ],
              ),
            ),
            Stack(children: [
                Expanded(child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
                //recognizedText = await textRecognizer.processImage(inputImage);
              ]
            )
          ],
        ),
      ),
    );
  }
}


// Image.file(File(widget.imagePath)),