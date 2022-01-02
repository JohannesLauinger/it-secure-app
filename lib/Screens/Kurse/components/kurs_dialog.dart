import 'package:flutter/material.dart';
import '../model/kurs.dart';

class KursDialog extends StatefulWidget {
  final Kurs? kurs;
  final Function(String name, int time, String category, String imagePath,
      String videoPath) onClickedDone;

  const KursDialog({
    Key? key,
    this.kurs,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  _KursDialogState createState() => _KursDialogState();
}

class _KursDialogState extends State<KursDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final timeController = TextEditingController();
  final categoryController = TextEditingController();
  final imagePathController = TextEditingController();
  final videoPathController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.kurs != null) {
      final kurs = widget.kurs!;

      nameController.text = kurs.name;
      timeController.text = kurs.time.toString();
      categoryController.text = kurs.category;
      imagePathController.text = kurs.imagePath;
      videoPathController.text = kurs.videoPath;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    timeController.dispose();
    categoryController.dispose();
    imagePathController.dispose();
    videoPathController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.kurs != null;
    final title = isEditing ? 'Kurs bearbeiten' : 'Kurs hinzufügen';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              buildName(),
              SizedBox(height: 8),
              buildTime(),
              SizedBox(height: 8),
              buildCategory(),
              SizedBox(height: 8),
              buildImagePath(),
              SizedBox(height: 8),
              buildVideoPath(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildName() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Kursname',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Kursnamen eingeben!' : null,
      );

  Widget buildTime() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Zeit in Minuten',
        ),
        keyboardType: TextInputType.number,
        validator: (amount) => amount != null && double.tryParse(amount) == null
            ? 'Bitte gültige Zahl eingeben!'
            : null,
        controller: timeController,
      );

  Widget buildCategory() => TextFormField(
        controller: categoryController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Kategorie',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Kategorie eingeben!' : null,
      );

  Widget buildImagePath() => TextFormField(
        controller: imagePathController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Bild-Pfad',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Bitte Pfad angeben!' : null,
      );

  Widget buildVideoPath() => TextFormField(
        controller: videoPathController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Video-Pfad',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Bitte Pfad angeben!' : null,
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Zurück'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Sichern' : 'Hinzufügen';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = nameController.text;
          final time = int.tryParse(timeController.text) ?? 0;
          final category = categoryController.text;
          final imagePath = imagePathController.text;
          final videoPath = videoPathController.text;

          widget.onClickedDone(name, time, category, imagePath, videoPath);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
