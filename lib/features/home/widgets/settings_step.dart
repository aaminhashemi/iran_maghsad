import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class SettingsStep extends StatelessWidget {
  final String langCode;

  const SettingsStep({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    final data = formProvider.formData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formProvider.settingsFormKey,
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
                    color: Colors.purple.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // خلاصه اطلاعات
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'خلاصه اطلاعات',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      _buildSummaryRow('نام:', data.fullName.isEmpty ? '---' : data.fullName),
                      _buildSummaryRow('ایمیل:', data.email.isEmpty ? '---' : data.email),
                      _buildSummaryRow('موبایل:', data.phone.isEmpty ? '---' : data.phone),
                      _buildSummaryRow('آدرس:', data.address.isEmpty ? '---' : data.address),
                      _buildSummaryRow('شهر:', data.city.isEmpty ? '---' : data.city),
                      _buildSummaryRow('کد پستی:', data.postalCode.isEmpty ? '---' : data.postalCode),
                      _buildSummaryRow('شغل:', data.jobTitle.isEmpty ? '---' : data.jobTitle),
                      _buildSummaryRow('شرکت:', data.company.isEmpty ? '---' : data.company),
                      _buildSummaryRow('سابقه:', '${data.experience} سال'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // عضویت در خبرنامه
              CheckboxListTile(
                title: const Text('عضویت در خبرنامه'),
                value: data.newsletter,
                onChanged: (value) {
                  formProvider.updateField('newsletter', value);
                },
                secondary: const Icon(Icons.email_outlined),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // پذیرش قوانین
              CheckboxListTile(
                title: const Text(
                  'قوانین و مقررات را می‌پذیرم',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: data.termsAccepted,
                onChanged: (value) {
                  formProvider.updateField('termsAccepted', value);
                  // برای اعتبارسنجی، فرم رو آپدیت می‌کنیم
                  formProvider.settingsFormKey.currentState?.validate();
                },
                secondary: const Icon(Icons.description_outlined),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // نمایش خطا برای پذیرش قوانین
              if (!data.termsAccepted)
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16),
                  child: Text(
                    'برای ادامه باید قوانین را بپذیرید',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // TextFormField مخفی برای اعتبارسنجی چک‌باکس
              // این فیلد نمایش داده نمی‌شه ولی validator آن اجرا میشه
              Offstage(
                offstage: true,
                child: TextFormField(
                  validator: (value) {
                    if (!data.termsAccepted) {
                      return 'خطا';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}