import 'package:flutter/material.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static List<String> languages() => ['en', 'ar'];

  String get languageCode => locale.toString();

  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization) ??
      AppLocalization(const Locale('en'));
  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  String translate(String key, {String nullCase = ''}) {
    return (translateMap[key] ?? {})[languageCode] ?? nullCase;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    final appLocalizations = AppLocalization(locale);
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      old != this;
}

Map<String, Map<String, String>> translateMap = {
  'welcome_back': {
    'en': 'Welcome back',
    'ar': 'هلا و مرحبا',
  },
  'a_new_journey_for_you_to_enjoy_upon_your_upcoming_purchases': {
    'en': 'A new journey for you to enjoy upon your upcoming purchases.',
    'ar': '.رحلتك الجديدة نحو عمليات شراء سهله ومريحة',
  },
  'split_your_payments_and_shop_with_ease_online_&_in_store': {
    'en': 'Split your payments and shop with ease, online & in-store.',
    'ar': 'قسّم مدفوعاتك وتسوّق بسهولة عبر الإنترنت وحتى في المتاجر.'
  },
  'sign_in': {
    'en': 'Sign in',
    'ar': 'تسجيل الدخول',
  },
  'sign_up': {
    'en': 'Sign up',
    'ar': 'التسجيل',
  },
  'try_as_a_guest': {
    'en': 'Try as a guest',
    'ar': '.تجربة الدخول كزائر',
  },
  'we_ll_send_you_a_verification_code_when_you_login_or_create_a_new_account': {
    'en':
        'We\'ll send you a verification code when you login or create a new account.',
    'ar': '.سنرسل لك رمز التحقق عند تسجيل الدخول أو إنشاء حساب جديد',
  },
  'continue': {
    'en': 'Continue',
    'ar': 'متابعة',
  },
  'clicking_continue_indicates_that_you_agree_to_our': {
    'en': 'Clicking continue indicates that you agree to our',
    'ar': 'يدل اختيارك على المتابعة إلى موافقتك على',
  },
  'terms_and_conditions': {
    'en': 'Terms and conditions',
    'ar': 'الشروط والأحكام',
  },
  'and_our': {
    'en': 'and_our',
    'ar': 'و',
  },
  'privacy_policy': {
    'en': 'Privacy policy',
    'ar': 'سياسة الخصوصية',
  },
  'verification': {
    'en': 'Verification',
    'ar': 'التحقق',
  },
  'enter_the_4_digit_code_we_sent_on_your_number': {
    'en': 'Enter the 4-digit code we sent on your number',
    'ar': 'أدخل رمز التحقق المكون من 4 أرقام والذي تم إرساله على رقمك ',
  },
  'please_enter_the_information_below_as_your_ID_Lqama_indicates': {
    'en': 'Please enter the information below as your ID/ Iqama indicates.',
    'ar': 'يرجى إدخال المعلومات أدناه كما هو مبين في الهوية / الإقامة'
  },
  'first_name': {
    'en': 'First name',
    'ar': 'الاسم الأول',
  },
  'last_name': {
    'en': 'Last name',
    'ar': 'الاسم الأخير',
  },
  'email': {
    'en': 'Email',
    'ar': 'البريد الإلكتروني',
  },
  'passcode': {
    'en': 'Passcode',
    'ar': 'الرمز السرّي',
  },
  'enter_your_pass_code_and_start_earning_cashback_upon_your_purchases': {
    'en': 'Enter your passcode and start earning cashback upon your purchases.',
    'ar': '.أدخل الرمز السرّي وابدأ بكسب الفلوس من مشترياتك القادمة',
  },
  'switch_account': {
    'en': 'Switch account',
    'ar': 'تغير الحساب',
  },
  'forgot_passcode': {
    'en': 'Forgot passcode?',
    'ar': 'نسيت كلمة المرور؟',
  },
  'payments': {
    'en': 'Payments',
    'ar': 'الدفعات',
  },
  'orders': {
    'en': 'Orders',
    'ar': 'الطلبات',
  },
  'order': {
    'en': 'Order',
    'ar': 'الطلب',
  },
  'wallet': {
    'en': 'Wallet',
    'ar': 'محفظتي',
  },
  'offers': {
    'en': 'Offers',
    'ar': 'العروض',
  },
  'history': {
    'en': 'History',
    'ar': 'التاريخ',
  },
  'spending': {
    'en': 'Spending',
    'ar': 'المصروفات',
  },
  'favorites': {
    'en': 'Favorites',
    'ar': 'مفضلتي',
  },
  'search': {
    'en': 'Search',
    'ar': 'البحث',
  },
  'view_all': {
    'en': 'View all',
    'ar': 'عرض الكل',
  },
  'select_your_next_offer': {
    'en': 'Select your next offer',
    'ar': 'تدلّع بعروضنا من مختلف المتاجر',
  },
  'save_more_by_using_collected_offers': {
    'en': 'Save more by using collected offers',
    'ar': 'وفر أكثر واكسب معانا',
  },
  'days_left': {
    'en': 'Days left',
    'ar': 'ايام متبقية',
  },
  'offers_history': {
    'en': 'Offers history',
    'ar': 'العروض المستخدمة',
  },
  'discount_at': {
    'en': 'Discount at',
    'ar': 'خصم على',
  },
  'for_one_time': {
    'en': 'for one time',
    'ar': 'لمرة واحدة',
  },
  'promo_code': {
    'en': 'Promo Code',
    'ar': 'رمز ترويجي',
  },
  'expires_in': {
    'en': 'Expires in',
    'ar': 'منتهى في',
  },
  'copy_and_shop': {
    'en': 'Copy & shop',
    'ar': 'انسخ و تسوق',
  },
  'your_offer_has_been_collected_successfully': {
    'en': 'Your offer has been collected successfully',
    'ar': 'تم اضافة عرضك بنجاح',
  },
  'success': {
    'en': 'Success',
    'ar': 'تمت العملية بنجاح',
  },
  'min_order_amount': {
    'en': 'min. order amount',
    'ar': 'الحد الأدنى من مبلغ الطلب'
  },
  'max_order_amount': {
    'en': 'max. order amount',
    'ar': 'الحد الأقصى من مبلغ الطلب'
  },
  'collect': {
    'en': 'Collect',
    'ar': 'إضافة',
  },
  'your_offer_has_been_cancelled': {
    'en': 'Your offer has been cancelled',
    'ar': 'تم إلغاء عرضك بنجاح'
  },
  'cancel': {
    'en': 'Cancel',
    'ar': 'إلغاء',
  },
  'my_purchases': {
    'en': 'My Purchases',
    'ar': 'مشترياتي',
  },
  'future_payments': {
    'en': 'Future Payments',
    'ar': 'الدفعات المستقبلية',
  },
  'pay_all': {
    'en': 'Pay all',
    'ar': 'دفع الكل',
  },
  'upcoming_payments': {
    'en': 'Upcoming Payments',
    'ar': 'الدفعات القادمة',
  },
  'pay': {
    'en': 'Pay',
    'ar': 'دفع',
  },
  'days': {
    'en': 'days',
    'ar': 'أيام',
  },
  'installments': {
    'en': 'installments',
    'ar': 'أقساط',
  },
  'in': {
    'en': 'in',
    'ar': 'في',
  },
  'details': {
    'en': 'Details',
    'ar': 'التفاصيل',
  },
  'completed': {
    'en': 'Completed',
    'ar': 'مكتمل',
  },
  'ongoing': {
    'en': 'Ongoing',
    'ar': 'قادمة',
  },
  'delayed': {
    'en': 'Delayed',
    'ar': 'متعثر',
  },
  'order_history': {
    'en': 'Orders history',
    'ar': 'الطلبات السابقة',
  },
  'order_details': {
    'en': 'Order details',
    'ar': 'تفاصيل الطلب',
  },
  'information_for_order': {
    'en': 'Information',
    'ar': 'معلومات الطلب',
  },
  'order_items': {
    'en': 'Items',
    'ar': 'المشتريات',
  },
  'customer_support': {
    'en': 'Customer support',
    'ar': 'خدمة العملاء',
  },
  'for_order_related_help': {
    'en': 'For order related help',
    'ar': 'للحصول على مساعدات متعلقة بالطلب',
  },
  'how_can_we_help_you': {
    'en': 'How can we Help you?',
    'ar': 'كيف يمكننا المساعدة؟',
  },
  'app_help_center': {
    'en': 'Nasmah Help Center',
    'ar': 'خدمة عملاء نسمه',
  },
  'for_payments_related_help': {
    'en': 'For payments related help',
    'ar': 'للحصول على تعليمات متعلقة بالدفعات',
  },
  'order_number': {
    'en': 'Order number',
    'ar': 'رقم الطلب',
  },
  'financial': {
    'en': 'Financial',
    'ar': 'المالية',
  },
  'credit_cards': {
    'en': 'Credit Cards',
    'ar': 'البطاقات الأئتمانية',
  },
  'bank_accounts': {
    'en': 'Bank Accounts',
    'ar': 'الحسابات البنكية',
  },
  'change_password': {
    'en': 'Change password',
    'ar': 'تغيير الرمز السري',
  },
  'faq': {
    'en': 'FAQ',
    'ar': 'الأسئلة الشائعة',
  },
  'about_us': {
    'en': 'About us',
    'ar': 'ملومات عنا',
  },
  'help_center': {
    'en': 'Help Center',
    'ar': 'مركز مساعدة العملاء',
  },
  'account': {
    'en': 'Account',
    'ar': 'الحساب',
  },
  'deactivate_account': {
    'en': 'Deactivate Account',
    'ar': 'إيقاف الحساب',
  },
  'log_out': {
    'en': 'Log out',
    'ar': 'تسجيل الخروج',
  },
  'app_version': {
    'en': 'App Version',
    'ar': 'نسخة التطبيق',
  },
  'settings': {
    'en': "Settings",
    'ar': 'الإعدادات',
  },
  'you_have': {
    'en': 'You have',
    'ar': 'لديك',
  },
  'gained_and_spent': {
    'en': 'Gained & spent',
    'ar': 'الرصيد المكتسب والمنفق',
  },
  'purchase': {
    'en': 'Purchase',
    'ar': 'عملية شرائية',
  },
  'bank_account': {
    'en': 'Bank Accounts',
    'ar': 'الحسابات البنكية',
  },
  'account_holder': {
    'en': 'Account holder',
    'ar': 'اسم صاحب الحساب',
  },
  'bank_name': {
    'en': 'Bank Name',
    'ar': 'اسم البنك',
  },
  'save_bank_information': {
    'en': 'Save bank information',
    'ar': 'حفظ المعلومات المصرفية',
  },
  'remove_bank_information': {
    'en': 'Remove bank information',
    'ar': 'إزالة المعلومات البنكية',
  },
  'card_number': {
    'en': 'Card Number',
    'ar': 'رقم البطاقة',
  },
  'card_holder_name': {
    'en': 'Card Holder Name',
    'ar': 'الاسم على البطاقة',
  },
  'expiry': {
    'en': 'Expiry',
    'ar': 'الانتهاء',
  },
  'save_changes': {
    'en': 'Save changes',
    'ar': 'حفظ التغييرات',
  },
  'save_card': {
    'en': 'Save card',
    'ar': 'حفظ البطاقة',
  },
  'remove_card': {
    'en': 'Remove card',
    'ar': 'إزالة البطاقة',
  },
  'saved_bank': {
    'en': 'Saved bank',
    'ar': 'الحسابات المضافة',
  },
  'saved_cards': {
    'en': 'Saved cards',
    'ar': 'البطاقات المحفوظة',
  },
  'valid_until': {
    'en': 'Valid until',
    'ar': 'صالحة حتى',
  },
  'profile_has_been_edited_successfully': {
    'en': 'Profile has been edited successfully',
    'ar': 'تم تعديح الحساب بنجاح',
  },
  'ok': {
    'en': 'OK',
    'ar': 'حسنا',
  },
  'edit_profile': {
    'en': 'Edit profile',
    'ar': 'تعديل الحساب',
  },
  'name': {
    'en': 'Name',
    'ar': 'الاسم',
  },
  'change_phone_number': {
    'en': 'Change phone number',
    'ar': 'تغير رقم الجوال',
  },
  'verify_your_account_to_change_the_pass_code': {
    'en': 'Verify your account to change the pass code',
    'ar': 'يجب التحقق من حسابك لتغيير الرمز السرّي',
  },
  'enter_a_new_pass_code': {
    'en': 'Enter a new passcode',
    'ar': 'أدخل الرمز السرّي الجديد',
  },
  'confirm_a_new_pass_code': {
    'en': 'Confirm a new passcode',
    'ar': 'تأكيد الرمز السرّي',
  },
  'enter_the_4-digit_code_we_sent_on_your_number': {
    'en': 'Enter the 4-digit code we sent on your number',
    'ar': 'أدخل رمز التحقق المكون من 4 أرقام وتم إرساله على رقمك',
  },
  'please_enter_a_new_pass_code_to_better_secure_your_account': {
    'en': 'Please enter a new pass code to_better secure your account',
    'ar': 'الرجاء إدخال الرمز السرّي الجديد لتأمين حسابك بشكل أفضل',
  },
  'please_reenter_your_new_passcode': {
    'en': 'Please reenter your new passcode',
    'ar': 'الرجاء إعادة إدخال رمز المرور الجديد الخاص بك',
  },
  'verify': {
    'en': 'Verify',
    'ar': 'التحقق',
  },
  'change': {
    'en': 'Change',
    'ar': 'تغيير',
  },
  'change_pass_code': {
    'en': 'Change pass code',
    'ar': 'تغيير الرمز السرّي',
  },
  'spendings': {
    'en': 'Spendings',
    'ar': 'المصروفات',
  },
  'to_now': {
    'en': 'To now',
    'ar': 'حتى الآن',
  },
  'over_all_time': {
    'en': 'Over all time',
    'ar': 'منذ انضمامك معنا',
  },
  'welcome_screen_text': {
    'ar':
        "رحلتك الجديدة نحو عمليات شراء سهله ومريحة.قسّم مدفوعاتك وتسوّق بسهولة"
            " عبر الإنترنت وحتى في المتاجر.",
    'en': "A new journey for you to enjoy upon your \nupcoming purchases.\n"
        "Split your payments and shop with ease, \nonline & in-store."
  },
  'we_well_send_you_code': {
    'en':
        "We’ll send you a verification code when you \nlogin or create a new account.",
    'ar': 'سنرسل لك رمز التحقق عند تسجيل الدخول أو إنشاء حساب جديد.'
  },
  'resend_new_code_in': {
    'en': 'Resend new code in',
    'ar': 'إعادة إرسال رمز التحقق الجديد خلال'
  },
  'seconds': {
    'en': 'Seconds',
    'ar': 'ثانية',
  },
  'refund_not_received': {
    'en': 'Refund not received',
    'ar': 'لم يتم استلام المبلغ المسترد',
  },
  'account_profile': {
    'en': 'Account & Profile',
    'ar': 'الحساب & الصفحة الشخصية',
  },
  'technical_issue': {
    'en': 'Technical Issue',
    'ar': 'مشكلة تقنية',
  },
    'write_your_message': {
    'en': 'Write your message ',
    'ar': 'اكتب رسالتك ',
  },
      'tickets': {
    'en': 'Tickets ',
    'ar': 'التذاكر',
  },
   'issue': {
    'en': 'Issue ',
    'ar': 'مق',
  },
   'createdAt': {
    'en': 'Created At ',
    'ar': 'تم الإنشاء في',
  },

};
