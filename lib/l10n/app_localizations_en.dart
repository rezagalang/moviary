// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Moviary';

  @override
  String get appTagline => 'Your Personal Entertainment Universe';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Explore';

  @override
  String get navLibrary => 'Library';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navProfile => 'Profile';

  @override
  String get pendingFeatureTitle => 'Coming soon';

  @override
  String get pendingFeatureBody =>
      'This section is built in a later development phase.';

  @override
  String get offlineBanner =>
      'You are offline. Your saved library is still available.';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageIndonesian => 'Indonesia';

  @override
  String get settingsSaveFailed => 'Could not save this setting.';

  @override
  String get accountSectionTitle => 'Account';

  @override
  String get accountSignedInWith => 'Signed in with Google';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutConfirmTitle => 'Sign out of Moviary?';

  @override
  String get signOutConfirmBody =>
      'Your saved library stays on this device. Sign in again to continue syncing.';

  @override
  String get signOutFailed => 'Could not sign out. Please try again.';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get onboardingTitle1 => 'Your whole collection in one place';

  @override
  String get onboardingBody1 =>
      'Track movies, series, anime and documentaries from around the world.';

  @override
  String get onboardingTitle2 => 'Works without internet';

  @override
  String get onboardingBody2 =>
      'Your library, ratings and notes are always saved on your device first.';

  @override
  String get onboardingTitle3 => 'Synced when you are online';

  @override
  String get onboardingBody3 =>
      'Sign in once with Google to back up and sync your library across devices.';

  @override
  String get loginContinueGoogle => 'Continue with Google';

  @override
  String get loginNeedsInternet =>
      'An internet connection is needed for the first sign-in.';

  @override
  String get loginOfflineError =>
      'You are offline. Connect to the internet to sign in.';

  @override
  String get loginFailed => 'Sign-in failed. Please try again.';

  @override
  String get librarySearchHint => 'Search your library';

  @override
  String get libraryEmptyTitle => 'Your library is empty';

  @override
  String get libraryEmptyBody =>
      'Tap Add media to record something you watched or want to watch, or find new titles in Explore.';

  @override
  String get libraryNoResultsTitle => 'No matches';

  @override
  String get libraryNoResultsBody =>
      'Try a different search or clear the filters.';

  @override
  String get addMedia => 'Add media';

  @override
  String get filterTitle => 'Filters';

  @override
  String get filterSort => 'Sort by';

  @override
  String get filterStatus => 'Status';

  @override
  String get filterType => 'Type';

  @override
  String get filterFavoritesOnly => 'Favorites only';

  @override
  String get filterWatchlistOnly => 'Watchlist only';

  @override
  String get filterClear => 'Clear filters';

  @override
  String get filterDone => 'Done';

  @override
  String get sortRecentlyAdded => 'Recently added';

  @override
  String get sortTitle => 'Title (A-Z)';

  @override
  String get sortRating => 'My rating';

  @override
  String get sortReleaseDate => 'Release date';

  @override
  String get sortRecentlyUpdated => 'Recently updated';

  @override
  String get viewGrid => 'Grid view';

  @override
  String get viewList => 'List view';

  @override
  String get statusPlanToWatch => 'Plan to watch';

  @override
  String get statusWatching => 'Watching';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusOnHold => 'On hold';

  @override
  String get statusDropped => 'Dropped';

  @override
  String get statusRewatching => 'Rewatching';

  @override
  String get typeMovie => 'Movie';

  @override
  String get typeTv => 'TV series';

  @override
  String get typeAnime => 'Anime';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get selectAll => 'Select all';

  @override
  String get changeStatus => 'Change status';

  @override
  String get removeFromLibrary => 'Remove from library';

  @override
  String removeConfirmTitle(int count) {
    return 'Remove $count from your library?';
  }

  @override
  String get removeConfirmBody =>
      'They leave your library. Ratings, notes and favorites are kept.';

  @override
  String get remove => 'Remove';

  @override
  String get detailNotFound => 'This item is no longer available.';

  @override
  String get detailStatus => 'My status';

  @override
  String get detailStatusHint => 'Choose a status to add it to your library.';

  @override
  String get detailRating => 'My rating';

  @override
  String get detailRatingNone => 'Not rated yet. Drag to rate.';

  @override
  String get detailClearRating => 'Clear';

  @override
  String get detailFavorite => 'Favorite';

  @override
  String get detailWatchlist => 'Watchlist';

  @override
  String get detailOverview => 'Overview';

  @override
  String get detailNotes => 'Notes';

  @override
  String get detailNoNotes => 'No notes yet.';

  @override
  String get detailNoteHint => 'Write a note';

  @override
  String get detailSave => 'Save';

  @override
  String get detailEditNote => 'Edit note';

  @override
  String get detailDeleteNote => 'Delete note';

  @override
  String get detailDeleteNoteTitle => 'Delete this note?';

  @override
  String get delete => 'Delete';

  @override
  String get detailManualBadge => 'Added manually';

  @override
  String runtimeMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get addMediaTitle => 'Add media';

  @override
  String get fieldTitle => 'Title';

  @override
  String get fieldTitleRequired => 'Title is required';

  @override
  String get fieldType => 'Type';

  @override
  String get fieldOriginalTitle => 'Original title (optional)';

  @override
  String get fieldReleaseDate => 'Release date (optional)';

  @override
  String get fieldPickDate => 'Pick a date';

  @override
  String get fieldClearDate => 'Clear date';

  @override
  String get fieldRuntime => 'Runtime in minutes (optional)';

  @override
  String get fieldRuntimeInvalid => 'Enter a whole number above 0';

  @override
  String get fieldOverview => 'Overview (optional)';

  @override
  String get fieldPoster => 'Poster image URL (optional)';

  @override
  String get fieldInitialStatus => 'Add to library as';

  @override
  String get addMediaFailed => 'Could not save. Please try again.';

  @override
  String get addMediaPartial =>
      'Saved, but it could not be added to your library. Choose a status on the next screen.';

  @override
  String homeGreeting(String name) {
    return 'Hello, $name';
  }

  @override
  String get homeGreetingNoName => 'Welcome back';

  @override
  String get homeInLibrary => 'In your library';

  @override
  String get homeContinueWatching => 'Continue watching';

  @override
  String get homeRecentlyAdded => 'Recently added';

  @override
  String get homeRecentlyCompleted => 'Recently completed';

  @override
  String get homeEmptyTitle => 'Start your collection';

  @override
  String get homeEmptyBody =>
      'Add your first movie, series or anime to see your stats here.';

  @override
  String get exploreSearchHint => 'Search movies, series and anime';

  @override
  String get exploreFilterAll => 'All';

  @override
  String get exploreTrending => 'Trending this week';

  @override
  String get explorePopularMovies => 'Popular movies';

  @override
  String get explorePopularTv => 'Popular series';

  @override
  String get exploreTopAnime => 'Top anime';

  @override
  String get exploreNoResultsBody => 'Try different keywords or another type.';

  @override
  String get exploreOffline =>
      'You are offline. Connect to the internet to discover new titles.';

  @override
  String get exploreRateLimited =>
      'Too many requests. Please wait a moment and try again.';

  @override
  String get exploreNotConfigured =>
      'Discovery is not set up yet. Add a TMDB key to env/dev.json.';
}
