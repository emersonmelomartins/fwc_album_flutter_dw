import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/src/core/ui/widgets/button.dart';
import 'package:fwc_album_app/src/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/src/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final passwordConfirmationEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bola.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Cadastrar Usuário",
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text("Nome Completo *"),
                      ),
                      validator: Validatorless.required("Obrigatório"),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text("E-mail *"),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.email("E-mail inválido"),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordEC,
                      decoration: const InputDecoration(
                        label: Text("Senha *"),
                      ),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(
                            6, "Senha deve conter pelo menos 6 caracteres"),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordConfirmationEC,
                      decoration: const InputDecoration(
                        label: Text("Confirmar senha *"),
                      ),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(
                            6, "Senha deve conter pelo menos 6 caracteres"),
                        Validatorless.compare(
                            passwordEC, "Senha diferente de confirmar senha")
                      ]),
                    ),
                    const SizedBox(height: 20),
                    Button.primary(
                      width: MediaQuery.of(context).size.width * .9,
                      label: "Cadastrar",
                      onPressed: () async {
                        showLoader();
                        final formValid =
                            formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          await widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            passwordConfirmation: passwordConfirmationEC.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
