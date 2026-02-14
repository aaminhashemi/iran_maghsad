import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class AddressStep extends StatelessWidget {
  final String langCode;

  const AddressStep({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    final data = formProvider.formData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formProvider.addressFormKey,
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
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // آدرس
              TextFormField(
                initialValue: data.address,
                decoration: InputDecoration(
                  labelText: 'آدرس',
                  prefixIcon: const Icon(Icons.home_outlined),
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
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'آدرس اجباری است';
                  }
                  if (value.length < 10) {
                    return 'آدرس باید حداقل ۱۰ کاراکتر باشد';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('address', value),
              ),
              const SizedBox(height: 16),

              // شهر
              TextFormField(
                initialValue: data.city,
                decoration: InputDecoration(
                  labelText: 'شهر',
                  prefixIcon: const Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'نام شهر اجباری است';
                  }
                  if (value.length < 2) {
                    return 'نام شهر معتبر نیست';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('city', value),
              ),
              const SizedBox(height: 16),

              // کد پستی
              TextFormField(
                initialValue: data.postalCode,
                decoration: InputDecoration(
                  labelText: 'کد پستی',
                  prefixIcon: const Icon(Icons.markunread_mailbox),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'کد پستی اجباری است';
                  }
                  if (value.length != 10) {
                    return 'کد پستی باید ۱۰ رقم باشد';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'کد پستی باید فقط عدد باشد';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('postalCode', value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}