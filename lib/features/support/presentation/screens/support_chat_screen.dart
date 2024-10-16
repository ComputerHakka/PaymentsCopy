import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/core/util/theme/theme_cubit.dart';
import 'package:personal_payment_app/features/support/domain/entities/message.dart';
import 'package:personal_payment_app/features/support/presentation/bloc/bloc/messages_bloc.dart';

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
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.focusedChild?.unfocus();
                }
                GoRouter.of(context).pushNamed(RouteNames.notifiactionsScreen);
              },
              icon: SvgPicture.asset(
                'lib/core/assets/icons/notifications.svg',
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
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
    final scrollController = ScrollController();
    return Expanded(
      child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          if (state is MessageSendDoneState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            });
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              controller: scrollController,
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
    //TODO тоже полнейшая залупа
    initializeDateFormatting();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final alignment =
        message.userId == 1 ? MainAxisAlignment.end : MainAxisAlignment.start;
    final color = message.userId == 1
        ? accentColor
        : isDarkMode
            ? const Color.fromARGB(255, 85, 85, 85)
            : const Color(0xFFE1EAFF);
    final textColor = message.userId == 1
        ? Colors.white
        : isDarkMode
            ? Colors.white
            : Colors.black;
    return Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        message.userId != 1
            ? const Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('lib/core/assets/images/support.png'),
                ),
              )
            : const SizedBox.shrink(),
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
                message.userId != 1
                    ? const Text(
                        'Мария',
                        style: TextStyle(color: accentColor),
                      )
                    : const SizedBox.shrink(),
                Text(
                  message.text,
                  style: TextStyle(color: textColor),
                  textAlign: TextAlign.left,
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        color: context.read<ThemeCubit>().state.isDarkMode
            ? Colors.black
            : Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
      child: Row(
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
                overlayColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 83, 148, 85)),
                iconColor: WidgetStatePropertyAll(Colors.white),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 0),
                ),
              ),
              onPressed: () {},
              child: SvgPicture.asset(
                'lib/core/assets/icons/call.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputBarWidget extends StatefulWidget {
  const InputBarWidget({
    super.key,
  });

  @override
  State<InputBarWidget> createState() => _InputBarWidgetState();
}

class _InputBarWidgetState extends State<InputBarWidget> {
  final TextEditingController _textController = TextEditingController();

  void sendMessage(String text) {
    BlocProvider.of<MessagesBloc>(context).add(
      SendMessageEvent(
        message: MessageEntity(
          text: text,
          userId: 1,
          date: DateTime.now(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary),
              iconColor: const WidgetStatePropertyAll(unselectedItemColor),
            ),
            icon: SvgPicture.asset(
              'lib/core/assets/icons/add_file.svg',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _textController,
              // onSubmitted: (value) {
              //   if (value.isNotEmpty) {
              //     sendMessage(value);
              //   }
              //   setState(() {
              //     _textController.clear();
              //   });
              // },
              keyboardType: TextInputType.multiline,
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
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                sendMessage(_textController.text);
                _textController.clear();
              }
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(accentColor),
              iconColor: WidgetStatePropertyAll(Colors.white),
            ),
            icon: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
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
          borderSide: BorderSide.none,
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(color: unselectedItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: unselectedItemColor),
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary,
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
