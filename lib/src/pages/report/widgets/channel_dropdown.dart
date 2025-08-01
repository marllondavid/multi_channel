import 'package:flutter/material.dart';

class ChannelDropdown extends StatefulWidget {
  const ChannelDropdown({super.key});

  @override
  State<ChannelDropdown> createState() => _ChannelDropdownState();
}

class _ChannelDropdownState extends State<ChannelDropdown> {
  String? selectedChannel;

  final List<String> channels = [
    'Todos',
    'Loja Física',
    'Mercado Livre',
    'Shoppe',
    'Site',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedChannel,
      decoration: InputDecoration(
        labelText: 'Escolha o canal',
        labelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: channels.map((String channel) {
        return DropdownMenuItem<String>(
          value: channel,
          child: Text(channel),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedChannel = newValue;
        });
      },
    );
  }
}
