import 'package:flutter/material.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/features/account/presentation/pages/account_main_page.dart';
import 'package:nesma/features/account/presentation/pages/account_passcode_page.dart';
import 'package:nesma/features/account/presentation/pages/account_verification_page.dart';
import 'package:nesma/features/account/presentation/pages/sign_up_page.dart';
import 'package:nesma/features/account/presentation/pages/sign_up_user_data_page.dart';
import 'package:nesma/features/change_passcode/presentation/pages/change_password_page.dart';
import 'package:nesma/features/favorite/presentation/pages/favorites_page.dart';
import 'package:nesma/features/help_center/presentation/pages/chat_page.dart';
import 'package:nesma/features/help_center/presentation/pages/help_center_page.dart';
import 'package:nesma/features/help_center/presentation/pages/tickets_page.dart';
import 'package:nesma/features/home/presentation/pages/main_page.dart';
import 'package:nesma/features/home/presentation/pages/view_all_page.dart';
import 'package:nesma/features/notification/presentation/pages/notification_page.dart';
import 'package:nesma/features/offers/presentation/pages/offer_history_page.dart';
import 'package:nesma/features/profile/presentation/page/add_or_edit_bank_account.dart';
import 'package:nesma/features/profile/presentation/page/add_or_edit_credit_card.dart';
import 'package:nesma/features/profile/presentation/page/bank_account_main_page.dart';
import 'package:nesma/features/profile/presentation/page/credit_card_main_page.dart';
import 'package:nesma/features/profile/presentation/page/edit_profile_page.dart';
import 'package:nesma/features/profile/presentation/page/settings_pages/faq_page.dart';
import 'package:nesma/features/profile/presentation/page/settings_pages/privacy_policy_page.dart';
import 'package:nesma/features/profile/presentation/page/wallet_page.dart';
import 'package:nesma/features/purchases/presentation/pages/order_history.dart';
import 'package:nesma/features/purchases/presentation/pages/purchases_order_details_page.dart';
import 'package:nesma/features/purchases/presentation/pages/purchases_payement.dart';
import 'package:nesma/features/root/presentation/pages/root_page.dart';
import 'package:nesma/features/spendings_page/presentation/page/spendings_page.dart';

class RoutesManager {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.offersHistory:
        return MaterialPageRoute(
          builder: (_) => const OfferHistoryPage(),
        );
      case Routes.viewAllPage:
        return MaterialPageRoute(
          builder: (_) => ViewAllPage(
            argument: settings.arguments as ViewAllPageArgument,
          ),
        );
      case Routes.rootPage:
        return MaterialPageRoute(
          builder: (_) => const RootPage(),
        );
      case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => const NotificationPage(),
        );
      case Routes.editProfilePage:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
          settings: settings,
        );
      case Routes.accountMainPage:
        return MaterialPageRoute(
          builder: (context) => const AccountMainPage(),
          settings: settings,
        );
      case Routes.purchasesOrderDetailsPage:
        return MaterialPageRoute(
          builder: (context) => PurchasesOrderDetailsPage(
            argument: (settings.arguments as PurchasesOrderDetailsPageArgument),
          ),
          settings: settings,
        );
      case Routes.purchasesPayment:
        return MaterialPageRoute(
          builder: (context) => const PurchasesPayment(),
          settings: settings,
        );
      case Routes.orderHistory:
        return MaterialPageRoute(
          builder: (context) => const OrderHistory(),
          settings: settings,
        );
      case Routes.walletPage:
        return MaterialPageRoute(
          builder: (context) => const WalletPage(),
          settings: settings,
        );
      case Routes.creditCardMainPage:
        return MaterialPageRoute(
          builder: (context) => const CreditCardMainPage(),
          settings: settings,
        );
      case Routes.bankAccountMainPage:
        return MaterialPageRoute(
          builder: (context) => const BankAccountMainPage(),
          settings: settings,
        );
      case Routes.addOrEditCreditCard:
        return MaterialPageRoute(
          builder: (context) => AddOrEditCreditCardPage(
            argument: (settings.arguments as AddOrEditCreditCardPageArgument),
          ),
          settings: settings,
        );
      case Routes.addOrEditBankAccountPage:
        return MaterialPageRoute(
          builder: (context) => AddOrEditBankAccountPage(
            argument: (settings.arguments as AddOrEditBankAccountPageArgument),
          ),
          settings: settings,
        );
      case Routes.changePasswordCodePage:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordCodePage(
              argument: settings.arguments as ChangePasswordCodePageArgument),
          settings: settings,
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (context) =>
              SignUpPage(argument: settings.arguments as SignUpPageArgument),
          settings: settings,
        );
      case Routes.accountVerificationPage:
        return MaterialPageRoute(
          builder: (context) => AccountVerificationPage(
            argument: settings.arguments as AccountVerificationPageArgument,
          ),
          settings: settings,
        );
      case Routes.accountPassCodePage:
        return MaterialPageRoute(
          builder: (context) => AccountPassCodePage(
            argument: settings.arguments as AccountPassCodePageArgument,
          ),
          settings: settings,
        );
      case Routes.signUpUserDataPage:
        return MaterialPageRoute(
          builder: (context) => SignUpUserDataPage(),
          settings: settings,
        );
      case Routes.faqPage:
        return MaterialPageRoute(
          builder: (context) => const FAQPage(),
          settings: settings,
        );
      case Routes.spendingsPage:
        return MaterialPageRoute(
          builder: (context) => SpendingsPage(),
          settings: settings,
        );
      case Routes.favoritesPage:
        return MaterialPageRoute(
          builder: (context) => const FavoritesPage(),
          settings: settings,
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyPage(),
          settings: settings,
        );
        case Routes.helpCenter:
        return MaterialPageRoute(
          builder: (context) => const HelpCenterPage(),
          settings: settings,
        );
         case Routes.chat:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
          settings: settings,
        );
         case Routes.tickets:
        return MaterialPageRoute(
          builder: (context) => const TicketsPage(),
          settings: settings,
        );
   
      default:
        return MaterialPageRoute(
          builder: (context) => const Offstage(),
          settings: settings,
        );
    }
  }
}
