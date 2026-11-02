import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Moviary'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Your Personal Entertainment Universe'**
  String get appTagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get navExplore;

  /// No description provided for @navLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get navLibrary;

  /// No description provided for @navCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get navCalendar;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @pendingFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get pendingFeatureTitle;

  /// No description provided for @pendingFeatureBody.
  ///
  /// In en, this message translates to:
  /// **'This section is built in a later development phase.'**
  String get pendingFeatureBody;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Your saved library is still available.'**
  String get offlineBanner;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get languageIndonesian;

  /// No description provided for @settingsSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save this setting.'**
  String get settingsSaveFailed;

  /// No description provided for @accountSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountSectionTitle;

  /// No description provided for @accountSignedInWith.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Google'**
  String get accountSignedInWith;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out of Moviary?'**
  String get signOutConfirmTitle;

  /// No description provided for @signOutConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Your saved library stays on this device. Sign in again to continue syncing.'**
  String get signOutConfirmBody;

  /// No description provided for @signOutFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not sign out. Please try again.'**
  String get signOutFailed;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Your whole collection in one place'**
  String get onboardingTitle1;

  /// No description provided for @onboardingBody1.
  ///
  /// In en, this message translates to:
  /// **'Track movies, series, anime and documentaries from around the world.'**
  String get onboardingBody1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Works without internet'**
  String get onboardingTitle2;

  /// No description provided for @onboardingBody2.
  ///
  /// In en, this message translates to:
  /// **'Your library, ratings and notes are always saved on your device first.'**
  String get onboardingBody2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Synced when you are online'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'Sign in once with Google to back up and sync your library across devices.'**
  String get onboardingBody3;

  /// No description provided for @loginContinueGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginContinueGoogle;

  /// No description provided for @loginNeedsInternet.
  ///
  /// In en, this message translates to:
  /// **'An internet connection is needed for the first sign-in.'**
  String get loginNeedsInternet;

  /// No description provided for @loginOfflineError.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Connect to the internet to sign in.'**
  String get loginOfflineError;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign-in failed. Please try again.'**
  String get loginFailed;

  /// No description provided for @librarySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search your library'**
  String get librarySearchHint;

  /// No description provided for @libraryEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your library is empty'**
  String get libraryEmptyTitle;

  /// No description provided for @libraryEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap Add media to record something you watched or want to watch, or find new titles in Explore.'**
  String get libraryEmptyBody;

  /// No description provided for @libraryNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get libraryNoResultsTitle;

  /// No description provided for @libraryNoResultsBody.
  ///
  /// In en, this message translates to:
  /// **'Try a different search or clear the filters.'**
  String get libraryNoResultsBody;

  /// No description provided for @addMedia.
  ///
  /// In en, this message translates to:
  /// **'Add media'**
  String get addMedia;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filterTitle;

  /// No description provided for @filterSort.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get filterSort;

  /// No description provided for @filterStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get filterStatus;

  /// No description provided for @filterType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get filterType;

  /// No description provided for @filterFavoritesOnly.
  ///
  /// In en, this message translates to:
  /// **'Favorites only'**
  String get filterFavoritesOnly;

  /// No description provided for @filterWatchlistOnly.
  ///
  /// In en, this message translates to:
  /// **'Watchlist only'**
  String get filterWatchlistOnly;

  /// No description provided for @filterClear.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get filterClear;

  /// No description provided for @filterDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get filterDone;

  /// No description provided for @sortRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get sortRecentlyAdded;

  /// No description provided for @sortTitle.
  ///
  /// In en, this message translates to:
  /// **'Title (A-Z)'**
  String get sortTitle;

  /// No description provided for @sortRating.
  ///
  /// In en, this message translates to:
  /// **'My rating'**
  String get sortRating;

  /// No description provided for @sortReleaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release date'**
  String get sortReleaseDate;

  /// No description provided for @sortRecentlyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Recently updated'**
  String get sortRecentlyUpdated;

  /// No description provided for @viewGrid.
  ///
  /// In en, this message translates to:
  /// **'Grid view'**
  String get viewGrid;

  /// No description provided for @viewList.
  ///
  /// In en, this message translates to:
  /// **'List view'**
  String get viewList;

  /// No description provided for @statusPlanToWatch.
  ///
  /// In en, this message translates to:
  /// **'Plan to watch'**
  String get statusPlanToWatch;

  /// No description provided for @statusWatching.
  ///
  /// In en, this message translates to:
  /// **'Watching'**
  String get statusWatching;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusOnHold.
  ///
  /// In en, this message translates to:
  /// **'On hold'**
  String get statusOnHold;

  /// No description provided for @statusDropped.
  ///
  /// In en, this message translates to:
  /// **'Dropped'**
  String get statusDropped;

  /// No description provided for @statusRewatching.
  ///
  /// In en, this message translates to:
  /// **'Rewatching'**
  String get statusRewatching;

  /// No description provided for @typeMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get typeMovie;

  /// No description provided for @typeTv.
  ///
  /// In en, this message translates to:
  /// **'TV series'**
  String get typeTv;

  /// No description provided for @typeAnime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get typeAnime;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @changeStatus.
  ///
  /// In en, this message translates to:
  /// **'Change status'**
  String get changeStatus;

  /// No description provided for @removeFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Remove from library'**
  String get removeFromLibrary;

  /// No description provided for @removeConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove {count} from your library?'**
  String removeConfirmTitle(int count);

  /// No description provided for @removeConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'They leave your library. Ratings, notes and favorites are kept.'**
  String get removeConfirmBody;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @detailNotFound.
  ///
  /// In en, this message translates to:
  /// **'This item is no longer available.'**
  String get detailNotFound;

  /// No description provided for @detailStatus.
  ///
  /// In en, this message translates to:
  /// **'My status'**
  String get detailStatus;

  /// No description provided for @detailStatusHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a status to add it to your library.'**
  String get detailStatusHint;

  /// No description provided for @detailRating.
  ///
  /// In en, this message translates to:
  /// **'My rating'**
  String get detailRating;

  /// No description provided for @detailRatingNone.
  ///
  /// In en, this message translates to:
  /// **'Not rated yet. Drag to rate.'**
  String get detailRatingNone;

  /// No description provided for @detailClearRating.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get detailClearRating;

  /// No description provided for @detailFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get detailFavorite;

  /// No description provided for @detailWatchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get detailWatchlist;

  /// No description provided for @detailOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get detailOverview;

  /// No description provided for @detailNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get detailNotes;

  /// No description provided for @detailNoNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes yet.'**
  String get detailNoNotes;

  /// No description provided for @detailNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Write a note'**
  String get detailNoteHint;

  /// No description provided for @detailSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get detailSave;

  /// No description provided for @detailEditNote.
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get detailEditNote;

  /// No description provided for @detailDeleteNote.
  ///
  /// In en, this message translates to:
  /// **'Delete note'**
  String get detailDeleteNote;

  /// No description provided for @detailDeleteNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this note?'**
  String get detailDeleteNoteTitle;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @detailManualBadge.
  ///
  /// In en, this message translates to:
  /// **'Added manually'**
  String get detailManualBadge;

  /// No description provided for @runtimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String runtimeMinutes(int minutes);

  /// No description provided for @addMediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Add media'**
  String get addMediaTitle;

  /// No description provided for @fieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get fieldTitle;

  /// No description provided for @fieldTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get fieldTitleRequired;

  /// No description provided for @fieldType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get fieldType;

  /// No description provided for @fieldOriginalTitle.
  ///
  /// In en, this message translates to:
  /// **'Original title (optional)'**
  String get fieldOriginalTitle;

  /// No description provided for @fieldReleaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release date (optional)'**
  String get fieldReleaseDate;

  /// No description provided for @fieldPickDate.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get fieldPickDate;

  /// No description provided for @fieldClearDate.
  ///
  /// In en, this message translates to:
  /// **'Clear date'**
  String get fieldClearDate;

  /// No description provided for @fieldRuntime.
  ///
  /// In en, this message translates to:
  /// **'Runtime in minutes (optional)'**
  String get fieldRuntime;

  /// No description provided for @fieldRuntimeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a whole number above 0'**
  String get fieldRuntimeInvalid;

  /// No description provided for @fieldOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview (optional)'**
  String get fieldOverview;

  /// No description provided for @fieldPoster.
  ///
  /// In en, this message translates to:
  /// **'Poster image URL (optional)'**
  String get fieldPoster;

  /// No description provided for @fieldInitialStatus.
  ///
  /// In en, this message translates to:
  /// **'Add to library as'**
  String get fieldInitialStatus;

  /// No description provided for @addMediaFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save. Please try again.'**
  String get addMediaFailed;

  /// No description provided for @addMediaPartial.
  ///
  /// In en, this message translates to:
  /// **'Saved, but it could not be added to your library. Choose a status on the next screen.'**
  String get addMediaPartial;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeGreetingNoName.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get homeGreetingNoName;

  /// No description provided for @homeInLibrary.
  ///
  /// In en, this message translates to:
  /// **'In your library'**
  String get homeInLibrary;

  /// No description provided for @homeContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue watching'**
  String get homeContinueWatching;

  /// No description provided for @homeRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get homeRecentlyAdded;

  /// No description provided for @homeRecentlyCompleted.
  ///
  /// In en, this message translates to:
  /// **'Recently completed'**
  String get homeRecentlyCompleted;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Start your collection'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add your first movie, series or anime to see your stats here.'**
  String get homeEmptyBody;

  /// No description provided for @exploreSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search movies, series and anime'**
  String get exploreSearchHint;

  /// No description provided for @exploreFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get exploreFilterAll;

  /// No description provided for @exploreTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending this week'**
  String get exploreTrending;

  /// No description provided for @explorePopularMovies.
  ///
  /// In en, this message translates to:
  /// **'Popular movies'**
  String get explorePopularMovies;

  /// No description provided for @explorePopularTv.
  ///
  /// In en, this message translates to:
  /// **'Popular series'**
  String get explorePopularTv;

  /// No description provided for @exploreTopAnime.
  ///
  /// In en, this message translates to:
  /// **'Top anime'**
  String get exploreTopAnime;

  /// No description provided for @exploreNoResultsBody.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords or another type.'**
  String get exploreNoResultsBody;

  /// No description provided for @exploreOffline.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Connect to the internet to discover new titles.'**
  String get exploreOffline;

  /// No description provided for @exploreRateLimited.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please wait a moment and try again.'**
  String get exploreRateLimited;

  /// No description provided for @exploreNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Discovery is not set up yet. Add a TMDB key to env/dev.json.'**
  String get exploreNotConfigured;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
