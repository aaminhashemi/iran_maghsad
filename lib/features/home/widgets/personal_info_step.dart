import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';
import '../../../core/localization/strings.dart';

class PersonalInfoStep extends StatelessWidget {
  final String langCode;

  const PersonalInfoStep({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    final data = formProvider.formData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formProvider.personalInfoFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // نام و نام خانوادگی
              TextFormField(
                initialValue: data.fullName,
                decoration: InputDecoration(
                  labelText: Strings.getFullName(langCode),
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.getFieldRequired(langCode, Strings.getFullName(langCode));
                  }
                  if (value.length < 3) {
                    return Strings.getMinLength(langCode, Strings.getFullName(langCode), 3);
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('fullName', value),
              ),
              const SizedBox(height: 16),

              // ایمیل
              TextFormField(
                initialValue: data.email,
                decoration: InputDecoration(
                  labelText: Strings.getEmail(langCode),
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.getFieldRequired(langCode, Strings.getEmail(langCode));
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return Strings.getInvalidEmail(langCode);
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('email', value),
              ),
              const SizedBox(height: 16),

              // شماره موبایل
              TextFormField(
                initialValue: data.phone,
                decoration: InputDecoration(
                  labelText: Strings.getPhone(langCode),
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.getFieldRequired(langCode, Strings.getPhone(langCode));
                  }
                  if (value.length != 11) {
                    return Strings.getPhoneLength(langCode);
                  }
                  if (!RegExp(r'^09[0-9]{9}$').hasMatch(value)) {
                    return Strings.getInvalidPhone(langCode);
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('phone', value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}