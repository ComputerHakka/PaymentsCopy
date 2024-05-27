import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            const Text(
              'Адреса',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            const Text(
              'Куда отправлять документы и справки',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFFADBECE),
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
        color: const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Адрес проживания'),
                Text('Краснодарский Край'),
                Text('Изменить'),
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
          )
        ],
      ),
    );
  }
}
