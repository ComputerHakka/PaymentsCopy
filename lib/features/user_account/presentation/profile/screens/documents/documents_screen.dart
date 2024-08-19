import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class UserDocumentsScreen extends StatelessWidget {
  const UserDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
        centerTitle: false,
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              ContratsListWidget(
                title: 'Договоры',
                count: 3,
                type: 1,
              ),
              SizedBox(height: 17),
              ContratsListWidget(
                title: 'Удостоверения личности',
                count: 2,
                type: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContratsListWidget extends StatelessWidget {
  const ContratsListWidget({
    super.key,
    required this.title,
    required this.count,
    required this.type,
  });

  final String title;
  final int count;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        SizedBox(
          height: 137,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return DocumentCellWidget(type: type);
            },
          ),
        ),
      ],
    );
  }
}

class DocumentCellWidget extends StatelessWidget {
  const DocumentCellWidget({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Ink(
        decoration: BoxDecoration(
          color: containersColor,
          borderRadius: BorderRadius.circular(15),
        ),
        //width: 118,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () async {
            final file = await _loadPdfFile();
            if (file != null) {
              OpenFile.open(file.path);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 17.5,
                  backgroundColor: documentIconColor,
                  child: SvgPicture.asset(type == 2
                      ? 'lib/core/assets/images/documents/passport.svg'
                      : 'lib/core/assets/images/documents/contract.svg'),
                ),
                const SizedBox(height: 11),
                const Text(
                  'Алексей Иванов',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: unselectedItemColor),
                ),
                const Text(
                  'Купли-продажа',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<File?> _loadPdfFile() async {
    try {
      // Чтение файла из assets
      final byteData =
          await rootBundle.load('lib/core/assets/pdf/document.pdf');
      final file = File('${(await getTemporaryDirectory()).path}/document.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      return file;
    } catch (e) {
      print('Error opening PDF: $e');
      return null;
    }
  }
}
