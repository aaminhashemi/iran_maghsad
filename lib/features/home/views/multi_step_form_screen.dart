import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/localization/strings.dart';
import '../providers/form_provider.dart';
import '../widgets/personal_info_step.dart';
import '../widgets/address_step.dart';
import '../widgets/job_info_step.dart';
import '../widgets/settings_step.dart';

class MultiStepFormScreen extends StatelessWidget {
  const MultiStepFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: const _MultiStepFormContent(),
    );
  }
}

class _MultiStepFormContent extends StatelessWidget {
  const _MultiStepFormContent();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleProvider>().locale;
    final langCode = locale.languageCode;
    final formProvider = Provider.of<FormProvider>(context);

    // لیست مراحل
    final steps = [
      {'title': Strings.getPersonalInfo(langCode), 'icon': Icons.person},
      {'title': Strings.getAddress(langCode), 'icon': Icons.location_on},
      {'title': Strings.getJobInfo(langCode), 'icon': Icons.work},
      {'title': Strings.getSettings(langCode), 'icon': Icons.settings},
    ];

    // ویجت‌های هر مرحله
    final stepWidgets = [
      PersonalInfoStep(langCode: langCode),
      AddressStep(langCode: langCode),
      JobInfoStep(langCode: langCode),
      SettingsStep(langCode: langCode),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.getFormTitle(langCode)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Column(
        children: [
          // نوار پیشرفت
          LinearProgressIndicator(
            value: (formProvider.currentStep + 1) / formProvider.totalSteps,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),

          // نمایش مرحله فعلی
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(steps.length, (index) {
                bool isActive = index <= formProvider.currentStep;
                bool isCurrent = index == formProvider.currentStep;

                return Expanded(
                  child: InkWell(
                    onTap: isActive ? () => formProvider.goToStep(index) : null,
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrent
                                ? Colors.blue
                                : (isActive ? Colors.green : Colors.grey.shade300),
                          ),
                          child: Icon(
                            steps[index]['icon'] as IconData,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          steps[index]['title'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                            color: isActive ? Colors.black : Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          // محتوای مرحله فعلی
          Expanded(
            child: stepWidgets[formProvider.currentStep],
          ),

          // دکمه‌های کنترل
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                // دکمه قبلی
                if (!formProvider.isFirstStep)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: formProvider.previousStep,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(Strings.getPrevious(langCode)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),

                if (!formProvider.isFirstStep) const SizedBox(width: 16),

                // دکمه بعدی/ارسال
                Expanded(
                  child: formProvider.isSubmitting
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton.icon(
                    onPressed: () async {
                      if (formProvider.validateCurrentStep()) {
                        formProvider.saveCurrentForm();

                        if (formProvider.isLastStep) {
                          bool success = await formProvider.submitForm();
                          if (success && context.mounted) {
                            _showSuccessDialog(context, langCode);
                          }
                        } else {
                          formProvider.nextStep();
                        }
                      }
                    },
                    icon: Icon(
                      formProvider.isLastStep ? Icons.send : Icons.arrow_forward,
                    ),
                    label: Text(
                      formProvider.isLastStep
                          ? Strings.getSubmit(langCode)
                          : Strings.getNext(langCode),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String langCode) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Strings.getSuccessTitle(langCode),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                Strings.getSuccessMessage(langCode),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<FormProvider>(context, listen: false).resetForm();
                context.go('/home');
              },
              child: Text(Strings.getOk(langCode)),
            ),
          ],
        );
      },
    );
  }
}