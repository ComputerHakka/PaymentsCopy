import 'package:flutter/material.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final DateTimeRange? dateTimeRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
              initialEntryMode: DatePickerEntryMode.calendarOnly,
            );
            if (dateTimeRange != null) {}
          },
          child: const Text('Показать ад'),
        ),
      ),
    );
  }
}
