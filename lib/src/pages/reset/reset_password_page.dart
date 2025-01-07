import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/multi_field.dart';
import 'package:validatorless/validatorless.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHoveringConnect = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 500;
          return Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: isMobile ? double.infinity : 550,
              height: isMobile ? double.infinity : 350,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Esqueceu sua senha',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Insira seu e-mail para redefinir sua senha',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorsConstants.greyDark,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        MultiField(
                          preffixIcon: Icon(Icons.email_outlined),
                          label: 'Email',
                          controller: emailController,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('Email é obrigatório'),
                              Validatorless.email('Formato de email inválido'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() {
                            _isHoveringConnect = true;
                          }),
                          onExit: (_) => setState(() {
                            _isHoveringConnect = false;
                          }),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                // Formulário validado
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isHoveringConnect
                                  ? ColorsConstants.primaryColorDark
                                  : ColorsConstants.primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: Text('Enviar'),
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
