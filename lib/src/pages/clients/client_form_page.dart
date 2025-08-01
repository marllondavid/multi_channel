import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/multi_field.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/data/models/client_model.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ClientFormPage extends StatefulWidget {
  final ClienteModel? cliente;

  const ClientFormPage({super.key, this.cliente});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHoveringConnect = false;
  final nomeController = TextEditingController();
  final cpfCnpjController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final estadoController = TextEditingController();
  final cidadeController = TextEditingController();
  final emailController = TextEditingController();
  final origemController = TextEditingController();

  bool isEditMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final cliente = widget.cliente;
    if (cliente != null && !isEditMode) {
      isEditMode = true;

      nomeController.text = cliente.nome;
      cpfCnpjController.text = cliente.cpfCnpj;
      telefoneController.text = cliente.telefone;
      cepController.text = cliente.cep;
      ruaController.text = cliente.rua;
      numeroController.text = cliente.numero;
      complementoController.text = cliente.complemento ?? '';
      bairroController.text = cliente.bairro;
      estadoController.text = cliente.estado;
      cidadeController.text = cliente.cidade;
      emailController.text = cliente.email;
      origemController.text = cliente.origem;
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    cpfCnpjController.dispose();
    telefoneController.dispose();
    cepController.dispose();
    origemController.dispose();
    super.dispose();
  }

  void _salvarCliente() {
    if (_formKey.currentState?.validate() ?? false) {
      final cliente = {
        'nome': nomeController.text,
        'cpfCnpj': cpfCnpjController.text,
        'telefone': telefoneController.text,
        'endereco': ruaController.text,
        'origem': origemController.text,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isEditMode
              ? 'Cliente atualizado com sucesso!'
              : 'Cliente cadastrado com sucesso!'),
        ),
      );

      Navigator.pop(context, cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SharedScaffold(
      title: (isEditMode ? 'Editar Cliente' : 'Cadastrar Cliente'),
      drawer: HomeDrawer(
        isDarkMode: themeProvider.isDarkMode,
        onThemeChanged: themeProvider.toggleTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isMobile = constraints.maxWidth < 500;
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: isMobile ? double.infinity : 850,
                  child: Card(
                    elevation: 5,
                    shadowColor: ColorsConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dados Pessoais',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsConstants.greyDark,
                              ),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              preffixIcon: const Icon(Icons.person_2_outlined),
                              label: 'Nome Completo',
                              controller: nomeController,
                              validator:
                                  Validatorless.required('Nome é obrigatório'),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              preffixIcon: const Icon(Icons.business_sharp),
                              label: 'CPF/CNPJ',
                              controller: telefoneController,
                              validator: Validatorless.required(
                                  'Telefone é obrigatório'),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Endereço',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsConstants.greyDark,
                              ),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              preffixIcon:
                                  const Icon(Icons.location_on_outlined),
                              label: 'CEP',
                              controller: cepController,
                              validator:
                                  Validatorless.required('CEP é obrigatório'),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              label: 'Rua',
                              controller: ruaController,
                              validator:
                                  Validatorless.required('Rua é obrigatória'),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: MultiField(
                                    label: 'Número',
                                    controller: numeroController,
                                    validator: Validatorless.required(
                                        'Número é obrigatório'),
                                  ),
                                ),
                                if (!isMobile) const SizedBox(width: 10),
                                Expanded(
                                  child: MultiField(
                                    label: 'Complemento',
                                    controller: complementoController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: MultiField(
                                    label: 'Bairro',
                                    controller: bairroController,
                                    validator: Validatorless.required(
                                        'Bairro é obrigatório'),
                                  ),
                                ),
                                if (!isMobile) const SizedBox(width: 10),
                                Expanded(
                                  child: MultiField(
                                    label: 'Cidade',
                                    controller: cidadeController,
                                    validator: Validatorless.required(
                                        'Cidade é obrigatória'),
                                  ),
                                ),
                                if (!isMobile) const SizedBox(width: 10),
                                Expanded(
                                  child: MultiField(
                                    label: 'Estado',
                                    controller: estadoController,
                                    validator: Validatorless.required(
                                        'Estado é obrigatório'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Contato',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsConstants.greyDark,
                              ),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              preffixIcon: const Icon(Icons.email_outlined),
                              label: 'Email',
                              controller: emailController,
                              validator: Validatorless.multiple(
                                [
                                  Validatorless.required('Email é obrigatório'),
                                  Validatorless.email('Formato inválido'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            MultiField(
                              preffixIcon: const Icon(Icons.phone),
                              label: 'Telefone',
                              controller: telefoneController,
                              validator: Validatorless.required(
                                  'Telefone é obrigatório'),
                            ),
                            const SizedBox(height: 20),
                            MouseRegion(
                              onEnter: (_) => setState(() {
                                _isHoveringConnect = true;
                              }),
                              onExit: (_) => setState(() {
                                _isHoveringConnect = false;
                              }),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    isEditMode
                                        ? Icons.refresh_rounded
                                        : Icons.save,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    isEditMode ? 'Atualizar' : 'Cadastrar',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: _salvarCliente,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isHoveringConnect
                                        ? ColorsConstants.primaryColorDark
                                        : ColorsConstants.primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
