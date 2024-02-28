import 'package:infinimesh_timeseries_app/app/constant/extension.dart';
import 'package:infinimesh_timeseries_app/app/widgets/id_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cred_controller.dart';

class CredView extends GetView<CredController> {
  const CredView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IDTextField(
                title: 'Please Insert Server Endpoint',
                hintText: 'http://localhost:3000',
                // validator: (value) {
                //   return controller.validateServerEndpoint(value!);
                // },
                onChanged: (value) {
                  controller.getServerEndpoint(value);
                },
                controller: controller.serverController,
              ),
              IDTextField(
                title: 'Please Insert API Key',
                hintText: 'API Key',
                // validator: (value) {
                //   return controller.validateApiKey(value!);
                // },
                onChanged: (value) {
                  controller.getApiKey(value);
                },
                controller: controller.keyController,
              ),
              SizedBox(height: 3.0.hp),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: (controller.watchServerEndpoint.isNotEmpty &&
                                controller.watchApiKey.isNotEmpty)
                            ? () {
                                controller.submitCaptureInput();
                              }
                            : null,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text(
                          'SUBMIT',
                          // style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
