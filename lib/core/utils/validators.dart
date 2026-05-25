import '../config/constants.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < AppConstants.minPasswordLength) {
      return 'كلمة المرور يجب أن تكون ${AppConstants.minPasswordLength} أحرف على الأقل';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.length < 2) {
      return 'الاسم يجب أن يكون حرفين على الأقل';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'العمر مطلوب';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'العمر يجب أن يكون رقماً';
    }
    if (age < AppConstants.minAge || age > AppConstants.maxAge) {
      return 'العمر يجب أن يكون بين ${AppConstants.minAge} و ${AppConstants.maxAge}';
    }
    return null;
  }

  static String? validateWater(String? value) {
    if (value == null || value.isEmpty) {
      return 'المقدار مطلوب';
    }
    final amount = int.tryParse(value);
    if (amount == null || amount < 0) {
      return 'المقدار غير صحيح';
    }
    if (amount > AppConstants.maxWaterMl) {
      return 'المقدار كبير جداً';
    }
    return null;
  }

  static String? validateSleep(String? value) {
    if (value == null || value.isEmpty) {
      return 'عدد الساعات مطلوب';
    }
    final hours = double.tryParse(value);
    if (hours == null || hours < 0) {
      return 'عدد الساعات غير صحيح';
    }
    if (hours > AppConstants.maxSleepHours) {
      return 'عدد الساعات كبير جداً';
    }
    return null;
  }

  static String? validateSteps(String? value) {
    if (value == null || value.isEmpty) {
      return 'عدد الخطوات مطلوب';
    }
    final steps = int.tryParse(value);
    if (steps == null || steps < 0) {
      return 'عدد الخطوات غير صحيح';
    }
    if (steps > AppConstants.maxSteps) {
      return 'عدد الخطوات كبير جداً';
    }
    return null;
  }
}
