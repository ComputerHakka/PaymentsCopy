import 'package:flutter/material.dart';
import 'package:personal_payment_app/config/theme/app_themes.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Адреса',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            const Text(
              'Куда отправлять документы и справки',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: unselectedItemColor,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 7.5),
                children: const [
                  AddressCellWidget(isSelected: true),
                  AddressCellWidget(isSelected: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCellWidget extends StatefulWidget {
  const AddressCellWidget({super.key, required this.isSelected});
  final bool isSelected;

  @override
  State<AddressCellWidget> createState() => _AddressCellWidgetState();
}

class _AddressCellWidgetState extends State<AddressCellWidget> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Адрес проживания',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: unselectedItemColor),
                ),
                Text(
                  'Краснодарский Край, г. Краснодар, Ул. Рашпилевская, д. 315, кв 1',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  'Изменить',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: accentColor),
                ),
              ],
            ),
          ),
          Radio<bool>(
            value: false,
            groupValue: isSelected,
            onChanged: (value) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
        ],
      ),
    );
  }
}
