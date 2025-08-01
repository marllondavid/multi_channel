import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/multi_field.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isHoveringConnect = false;
  bool _isHoveringRegister = false;

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
              width: isMobile ? double.infinity : 500,
              height: isMobile ? double.infinity : 520,
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
                          'Conecte-se',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Por favor insira seus dados',
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
                          validator: Validatorless.multiple([
                            Validatorless.required('Email é obrigatório'),
                            Validatorless.email('Formato de email inválido'),
                          ]),
                        ),
                        SizedBox(height: 16),
                        MultiField(
                          preffixIcon: Icon(Icons.lock_outline),
                          label: 'Senha',
                          obscureText: true,
                          controller: passwordController,
                          validator:
                              Validatorless.required('Senha é obrigatória'),
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.go('/resetpassword');
                            },
                            child: Text(
                              'Redefinir senha',
                              style: TextStyle(
                                color: ColorsConstants.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                                context.go('/home');
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
                            child: Text(
                              'Conecte-se',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MouseRegion(
                          onEnter: (_) => setState(() {
                            _isHoveringRegister = true;
                          }),
                          onExit: (_) => setState(() {
                            _isHoveringRegister = false;
                          }),
                          child: OutlinedButton(
                            onPressed: () {
                              context.go('/register');
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _isHoveringRegister
                                  ? ColorsConstants.primaryColorDark
                                      .withValues(alpha: 0.1)
                                  : null,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: BorderSide(
                                color: ColorsConstants.primaryColor,
                              ),
                            ),
                            child: Text(
                              'Registre-se',
                              style: TextStyle(
                                color: ColorsConstants.textPurple,
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
