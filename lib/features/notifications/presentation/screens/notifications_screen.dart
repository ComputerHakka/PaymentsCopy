import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/support/domain/entities/message.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
        centerTitle: false,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            MessageListWidget(),
          ],
        ),
      ),
    );
  }
}

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    final scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    final notifications = MessageEntity.notificationsMock;
    Set<DateTime> uniqueDays = notifications
        .map((n) => DateTime(n.date.year, n.date.month, n.date.day))
        .toSet();
    List<DateTime> uniqueDaysList = uniqueDays.toList()
      ..sort((a, b) => a.compareTo(b));
    return Expanded(
      child: ListView.builder(
        itemCount: uniqueDaysList.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var day = uniqueDaysList[index];
          final String date = DateFormat.yMMMMd('ru').format(day);
          var dayNotifications = notifications
              .where(
                (e) =>
                    e.date.year == day.year &&
                    e.date.month == day.month &&
                    e.date.day == day.day,
              )
              .toList();
          return DayMessagesWidget(
              dayTitle: date, notifications: dayNotifications);
        },
      ),
    );
    // return Expanded(
    //   child: ListView.builder(
    //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
    //     controller: scrollController,
    //     itemCount: notifications.length,
    //     itemBuilder: (context, index) {
    //       return MessageBox(message: notifications[index]);
    //     },
    //   ),
    // );
  }
}

class DayMessagesWidget extends StatelessWidget {
  const DayMessagesWidget(
      {super.key, required this.dayTitle, required this.notifications});
  final String dayTitle;
  final List<MessageEntity> notifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(dayTitle),
          const SizedBox(height: 5),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationBox(notification: notifications[index]);
            },
          ),
        ],
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  const NotificationBox({super.key, required this.notification});

  final MessageEntity notification;

  @override
  Widget build(BuildContext context) {
    //TODO тоже полнейшая залупа
    initializeDateFormatting();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          decoration: BoxDecoration(
            color: isDarkMode ? secondaryColor : const Color(0xFFE1EAFF),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    notification.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: isDarkMode ? Colors.black : null),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.jm('ru').format(notification.date),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: isDarkMode ? Colors.black : null),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
