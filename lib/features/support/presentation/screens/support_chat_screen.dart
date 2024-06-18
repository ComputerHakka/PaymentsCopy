import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/support/domain/entities/message.dart';
import 'package:personal_payment_app/features/support/presentation/bloc/bloc/messages_bloc.dart';
import 'package:personal_payment_app/injection_container.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTextField(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: containersColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            HeadCallWidget(),
            MessageListWidget(),
            InputBarWidget(),
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
    return Expanded(
      child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          if (state is MessageSendDoneState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: state.sessionMessages!.length,
              itemBuilder: (context, index) {
                return MessageBox(message: state.sessionMessages![index]);
              },
            );
          }
          if (state is MessagesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final alignment =
        message.userId == 1 ? MainAxisAlignment.end : MainAxisAlignment.start;
    final color = message.userId == 1 ? accentColor : const Color(0xFFE1EAFF);
    final textColor = message.userId == 1 ? Colors.white : Colors.black;
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(color: textColor),
                  textAlign:
                      message.userId == 1 ? TextAlign.right : TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.jm('ru').format(message.date),
                      style: TextStyle(color: textColor),
                      textAlign: TextAlign.left,
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

class HeadCallWidget extends StatelessWidget {
  const HeadCallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Чат поддержки',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          width: 70,
          height: 30,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green),
              iconColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            onPressed: () {},
            child: const Icon(Icons.call),
          ),
        ),
      ],
    );
  }
}

class InputBarWidget extends StatelessWidget {
  const InputBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.file_present),
        ),
        Expanded(
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<MessagesBloc>(context).add(
                SendMessageEvent(
                  message: MessageEntity(
                    text: value,
                    userId: 1,
                    date: DateTime.now(),
                  ),
                ),
              );
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: 'Сообщение',
              hintStyle: const TextStyle(color: unselectedItemColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: containersColor,
            ),
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_upward),
        // ),
      ],
    );
  }
}

//TODO запихнуть все в отедльный виджет он находитяс на четырех или более экранах

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: containersColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

// class DatePickerRangeWidget extends StatelessWidget {
//   const DatePickerRangeWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           final DateTimeRange? dateTimeRange = await showDateRangePicker(
//             context: context,
//             firstDate: DateTime(2000),
//             lastDate: DateTime(3000),
//             initialEntryMode: DatePickerEntryMode.calendarOnly,
//           );
//           if (dateTimeRange != null) {}
//         },
//         child: const Text('Показать ад'),
//       ),
//     );
//   }
// }
