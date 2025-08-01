import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/alert_terms.dart';
import 'package:multi_channel/src/core/ui/widgets/multi_field.dart';
import 'package:validatorless/validatorless.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final nomeController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final estadoController = TextEditingController();
  final cidadeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHoveringConnect = false;
  bool _termsAccepted = false;
  bool _showTermsMessage = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 500;
          return Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: isMobile ? double.infinity : 600,
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
                          'Registro',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Vamos lá!',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorsConstants.greyDark,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MultiField(
                                preffixIcon:
                                    const Icon(Icons.person_2_outlined),
                                label: 'Seu nome',
                                controller: nomeController,
                                validator: Validatorless.required(
                                    'Nome é obrigatório'),
                              ),
                            ),
                            if (!isMobile) const SizedBox(width: 10),
                            Expanded(
                              child: MultiField(
                                preffixIcon: const Icon(Icons.phone),
                                label: 'Telefone',
                                controller: telefoneController,
                                validator: Validatorless.required(
                                    'Telefone é obrigatório'),
                              ),
                            ),
                          ],
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
                          preffixIcon: const Icon(Icons.location_on_outlined),
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
                          'Login',
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
                          preffixIcon: const Icon(Icons.lock_outline),
                          label: 'Senha',
                          obscureText: true,
                          controller: passwordController,
                          validator:
                              Validatorless.required('Senha é obrigatória'),
                        ),
                        const SizedBox(height: 10),
                        MultiField(
                          preffixIcon: const Icon(Icons.lock_outline),
                          label: 'Confirmar senha',
                          obscureText: true,
                          controller: passwordConfirmController,
                          validator: Validatorless.compare(
                              passwordController, 'As senhas não coincidem'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: _termsAccepted,
                              onChanged: (value) {
                                setState(() {
                                  _termsAccepted = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  bool? accepted = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => const AlertTerms(),
                                  );

                                  if (accepted == true) {
                                    setState(() {
                                      _termsAccepted = true;
                                    });
                                  } else {
                                    setState(() {
                                      _termsAccepted = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'Eu li e aceito os Termos e Condições',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: ColorsConstants.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Visibility(
                          visible: _showTermsMessage,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.error_outline,
                                    color: Colors.red),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Você precisa aceitar os Termos e Condições.',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true &&
                                    _termsAccepted) {
                                } else if (!_termsAccepted) {
                                  setState(() {
                                    _showTermsMessage = true;
                                  });
                                }
                              },
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
                              child: const Text(
                                'Registrar-se',
                                style: TextStyle(
                                  color: Colors.white,
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
    );
  }
}
