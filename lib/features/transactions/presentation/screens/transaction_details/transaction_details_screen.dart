import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';
import 'package:personal_payment_app/features/transactions/domain/entities/transaction.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key, required this.currentTransaction});
  final TransactionEntity currentTransaction;

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  Color? dominantColor;

  @override
  void initState() {
    _updatePalette();
    super.initState();
  }

  Future<void> _updatePalette() async {
    if (widget.currentTransaction.imagePath != null) {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        AssetImage(
            widget.currentTransaction.imagePath!), // путь к вашему изображению
      );

      setState(() {
        // Получаем доминирующий цвет
        Color? color = paletteGenerator.dominantColor?.color;

        if (color != null) {
          // Делаем его темнее и более прозрачным
          dominantColor = color.withOpacity(0.2);
        } else {
          dominantColor = Colors.white.withOpacity(0.2);
        }
      });
    }
  }

  // Метод для затемнения цвета
  Color _darkenColor(Color color, {double factor = 0.3}) {
    return Color.fromRGBO(
      (color.red * (1 - factor)).round(),
      (color.green * (1 - factor)).round(),
      (color.blue * (1 - factor)).round(),
      1, // Непрозрачный компонент alpha, так как прозрачность регулируем через withOpacity
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final String date =
        DateFormat.yMMMMd('ru').format(widget.currentTransaction.date);
    final String dateTime =
        DateFormat.Hm('ru').format(widget.currentTransaction.date);
    final String symbol =
        widget.currentTransaction.type == TransactionType.debit ? '-' : '+';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height / 3.3),
        child: AppBar(
          title: Text('$date, $dateTime'),
          centerTitle: false,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(16.0),
            color: dominantColor ?? Theme.of(context).colorScheme.tertiary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 33.5,
                  backgroundImage: widget.currentTransaction.imagePath != null
                      ? AssetImage(widget.currentTransaction.imagePath!)
                      : null,
                ),
                const SizedBox(height: 15),
                Text(widget.currentTransaction.name),
                Text(
                  widget.currentTransaction.category.name,
                  style: const TextStyle(
                    color: unselectedItemColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text('$symbol${widget.currentTransaction.sum} р',
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.currentTransaction.type == TransactionType.debit
                  ? 'Оплата со счета'
                  : 'Поступление на счет',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Text(
              'Документы',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
