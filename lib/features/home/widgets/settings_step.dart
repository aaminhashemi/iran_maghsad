import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';
import '../../../core/localization/strings.dart';

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
                      Text(
                        Strings.getSummary(langCode),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      _buildSummaryRow('${Strings.getFullName(langCode)}:', data.fullName),
                      _buildSummaryRow('${Strings.getEmail(langCode)}:', data.email),
                      _buildSummaryRow('${Strings.getPhone(langCode)}:', data.phone),
                      _buildSummaryRow('${Strings.getAddress(langCode)}:', data.address),
                      _buildSummaryRow('${Strings.getCity(langCode)}:', data.city),
                      _buildSummaryRow('${Strings.getPostalCode(langCode)}:', data.postalCode),
                      _buildSummaryRow('${Strings.getJobTitle(langCode)}:', data.jobTitle),
                      _buildSummaryRow('${Strings.getCompany(langCode)}:', data.company),
                      _buildSummaryRow('${Strings.getExperience(langCode)}:', '${data.experience} ${Strings.getYears(langCode)}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // عضویت در خبرنامه
              CheckboxListTile(
                title: Text(Strings.getNewsletter(langCode)),
                value: data.newsletter,
                onChanged: (value) {
                  formProvider.updateField('newsletter', value);
                },
                secondary: const Icon(Icons.email_outlined),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // پذیرش قوانین
              CheckboxListTile(
                title: Text(
                  Strings.getTerms(langCode),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                value: data.termsAccepted,
                onChanged: (value) {
                  formProvider.updateField('termsAccepted', value);
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
                    Strings.getTermsRequired(langCode),
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // TextFormField مخفی برای اعتبارسنجی چک‌باکس
              Offstage(
                offstage: true,
                child: TextFormField(
                  validator: (value) {
                    if (!data.termsAccepted) {
                      return Strings.getTermsRequired(langCode);
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
            width: 100,
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
              value.isEmpty ? '---' : value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}