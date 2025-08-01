import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';

class DatePickerFormField extends StatefulWidget {
  final String label;

  const DatePickerFormField({super.key, required this.label});

  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  DateTime? selectedDate;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    controller.text =
        '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: const Icon(Icons.calendar_today),
            border: InputBorder.none,
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: ColorsConstants.primaryColor,
                      onPrimary: Theme.of(context).cardColor,
                      onSurface: Colors.black,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              setState(() {
                selectedDate = picked;
                controller.text =
                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
              });
            }
          }),
    );
  }
}
