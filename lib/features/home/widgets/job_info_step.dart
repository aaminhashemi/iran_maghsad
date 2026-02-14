import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class JobInfoStep extends StatelessWidget {
  final String langCode;

  const JobInfoStep({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    final data = formProvider.formData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formProvider.jobInfoFormKey,
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
                    color: Colors.orange.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.work,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // عنوان شغلی
              TextFormField(
                initialValue: data.jobTitle,
                decoration: InputDecoration(
                  labelText: 'عنوان شغلی',
                  prefixIcon: const Icon(Icons.badge_outlined),
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
                    return 'عنوان شغلی اجباری است';
                  }
                  if (value.length < 3) {
                    return 'عنوان شغلی باید حداقل ۳ کاراکتر باشد';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('jobTitle', value),
              ),
              const SizedBox(height: 16),

              // نام شرکت
              TextFormField(
                initialValue: data.company,
                decoration: InputDecoration(
                  labelText: 'نام شرکت',
                  prefixIcon: const Icon(Icons.business),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'نام شرکت اجباری است';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('company', value),
              ),
              const SizedBox(height: 16),

              // سابقه کار
              Text(
                'سابقه کار: ${data.experience} سال',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: data.experience.toDouble(),
                min: 0,
                max: 50,
                divisions: 50,
                label: '${data.experience} سال',
                onChanged: (value) {
                  formProvider.updateField('experience', value.toInt());
                },
              ),

              // نمایش خطا برای سابقه کار (اگر خارج از محدوده باشه)
              if (data.experience < 0 || data.experience > 50)
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16),
                  child: Text(
                    'سابقه کار باید بین ۰ تا ۵۰ سال باشد',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}