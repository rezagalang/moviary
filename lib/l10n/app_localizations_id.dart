// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Moviary';

  @override
  String get appTagline => 'Semesta Hiburan Pribadimu';

  @override
  String get navHome => 'Beranda';

  @override
  String get navExplore => 'Jelajah';

  @override
  String get navLibrary => 'Koleksi';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navProfile => 'Profil';

  @override
  String get pendingFeatureTitle => 'Segera hadir';

  @override
  String get pendingFeatureBody =>
      'Bagian ini dibangun pada fase pengembangan berikutnya.';

  @override
  String get offlineBanner =>
      'Kamu sedang offline. Koleksi tersimpanmu tetap tersedia.';

  @override
  String get retry => 'Coba lagi';

  @override
  String get loading => 'Memuat';

  @override
  String get errorGeneric => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get cancel => 'Batal';

  @override
  String get settingsAppearance => 'Tampilan';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageIndonesian => 'Indonesia';

  @override
  String get settingsSaveFailed => 'Pengaturan ini gagal disimpan.';

  @override
  String get accountSectionTitle => 'Akun';

  @override
  String get accountSignedInWith => 'Masuk dengan Google';

  @override
  String get signOut => 'Keluar';

  @override
  String get signOutConfirmTitle => 'Keluar dari Moviary?';

  @override
  String get signOutConfirmBody =>
      'Koleksi tersimpanmu tetap ada di perangkat ini. Masuk lagi untuk melanjutkan sinkronisasi.';

  @override
  String get signOutFailed => 'Gagal keluar. Silakan coba lagi.';

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingGetStarted => 'Mulai';

  @override
  String get onboardingTitle1 => 'Seluruh koleksimu di satu tempat';

  @override
  String get onboardingBody1 =>
      'Catat film, serial, anime, dan dokumenter dari seluruh dunia.';

  @override
  String get onboardingTitle2 => 'Tetap berfungsi tanpa internet';

  @override
  String get onboardingBody2 =>
      'Koleksi, rating, dan catatanmu selalu disimpan di perangkat terlebih dahulu.';

  @override
  String get onboardingTitle3 => 'Tersinkron saat online';

  @override
  String get onboardingBody3 =>
      'Masuk sekali dengan Google untuk backup dan sinkronisasi koleksi antar perangkat.';

  @override
  String get loginContinueGoogle => 'Lanjutkan dengan Google';

  @override
  String get loginNeedsInternet =>
      'Koneksi internet diperlukan untuk login pertama kali.';

  @override
  String get loginOfflineError =>
      'Kamu sedang offline. Sambungkan internet untuk masuk.';

  @override
  String get loginFailed => 'Gagal masuk. Silakan coba lagi.';

  @override
  String get librarySearchHint => 'Cari di koleksimu';

  @override
  String get libraryEmptyTitle => 'Koleksimu masih kosong';

  @override
  String get libraryEmptyBody =>
      'Ketuk Tambah media untuk mencatat tontonan yang sudah atau ingin kamu tonton, atau cari judul baru di Jelajah.';

  @override
  String get libraryNoResultsTitle => 'Tidak ada hasil';

  @override
  String get libraryNoResultsBody => 'Coba kata kunci lain atau hapus filter.';

  @override
  String get addMedia => 'Tambah media';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterSort => 'Urutkan';

  @override
  String get filterStatus => 'Status';

  @override
  String get filterType => 'Jenis';

  @override
  String get filterFavoritesOnly => 'Hanya favorit';

  @override
  String get filterWatchlistOnly => 'Hanya watchlist';

  @override
  String get filterClear => 'Hapus filter';

  @override
  String get filterDone => 'Selesai';

  @override
  String get sortRecentlyAdded => 'Terbaru ditambahkan';

  @override
  String get sortTitle => 'Judul (A-Z)';

  @override
  String get sortRating => 'Rating saya';

  @override
  String get sortReleaseDate => 'Tanggal rilis';

  @override
  String get sortRecentlyUpdated => 'Terbaru diubah';

  @override
  String get viewGrid => 'Tampilan grid';

  @override
  String get viewList => 'Tampilan daftar';

  @override
  String get statusPlanToWatch => 'Rencana tonton';

  @override
  String get statusWatching => 'Sedang ditonton';

  @override
  String get statusCompleted => 'Selesai';

  @override
  String get statusOnHold => 'Ditunda';

  @override
  String get statusDropped => 'Dihentikan';

  @override
  String get statusRewatching => 'Menonton ulang';

  @override
  String get typeMovie => 'Film';

  @override
  String get typeTv => 'Serial TV';

  @override
  String get typeAnime => 'Anime';

  @override
  String selectedCount(int count) {
    return '$count dipilih';
  }

  @override
  String get selectAll => 'Pilih semua';

  @override
  String get changeStatus => 'Ubah status';

  @override
  String get removeFromLibrary => 'Keluarkan dari koleksi';

  @override
  String removeConfirmTitle(int count) {
    return 'Keluarkan $count item dari koleksi?';
  }

  @override
  String get removeConfirmBody =>
      'Item keluar dari koleksimu. Rating, catatan, dan favorit tetap tersimpan.';

  @override
  String get remove => 'Keluarkan';

  @override
  String get detailNotFound => 'Item ini sudah tidak tersedia.';

  @override
  String get detailStatus => 'Status saya';

  @override
  String get detailStatusHint =>
      'Pilih status untuk menambahkannya ke koleksimu.';

  @override
  String get detailRating => 'Rating saya';

  @override
  String get detailRatingNone => 'Belum dinilai. Geser untuk menilai.';

  @override
  String get detailClearRating => 'Hapus';

  @override
  String get detailFavorite => 'Favorit';

  @override
  String get detailWatchlist => 'Watchlist';

  @override
  String get detailOverview => 'Sinopsis';

  @override
  String get detailNotes => 'Catatan';

  @override
  String get detailNoNotes => 'Belum ada catatan.';

  @override
  String get detailNoteHint => 'Tulis catatan';

  @override
  String get detailSave => 'Simpan';

  @override
  String get detailEditNote => 'Ubah catatan';

  @override
  String get detailDeleteNote => 'Hapus catatan';

  @override
  String get detailDeleteNoteTitle => 'Hapus catatan ini?';

  @override
  String get delete => 'Hapus';

  @override
  String get detailManualBadge => 'Ditambahkan manual';

  @override
  String runtimeMinutes(int minutes) {
    return '$minutes mnt';
  }

  @override
  String get addMediaTitle => 'Tambah media';

  @override
  String get fieldTitle => 'Judul';

  @override
  String get fieldTitleRequired => 'Judul wajib diisi';

  @override
  String get fieldType => 'Jenis';

  @override
  String get fieldOriginalTitle => 'Judul asli (opsional)';

  @override
  String get fieldReleaseDate => 'Tanggal rilis (opsional)';

  @override
  String get fieldPickDate => 'Pilih tanggal';

  @override
  String get fieldClearDate => 'Hapus tanggal';

  @override
  String get fieldRuntime => 'Durasi dalam menit (opsional)';

  @override
  String get fieldRuntimeInvalid => 'Masukkan bilangan bulat lebih dari 0';

  @override
  String get fieldOverview => 'Sinopsis (opsional)';

  @override
  String get fieldPoster => 'URL gambar poster (opsional)';

  @override
  String get fieldInitialStatus => 'Tambahkan ke koleksi sebagai';

  @override
  String get addMediaFailed => 'Gagal menyimpan. Silakan coba lagi.';

  @override
  String get addMediaPartial =>
      'Tersimpan, tetapi belum masuk ke koleksimu. Pilih status di layar berikutnya.';

  @override
  String homeGreeting(String name) {
    return 'Halo, $name';
  }

  @override
  String get homeGreetingNoName => 'Selamat datang kembali';

  @override
  String get homeInLibrary => 'Di koleksimu';

  @override
  String get homeContinueWatching => 'Lanjutkan menonton';

  @override
  String get homeRecentlyAdded => 'Terbaru ditambahkan';

  @override
  String get homeRecentlyCompleted => 'Baru selesai';

  @override
  String get homeEmptyTitle => 'Mulai koleksimu';

  @override
  String get homeEmptyBody =>
      'Tambahkan film, serial, atau anime pertamamu untuk melihat statistiknya di sini.';

  @override
  String get exploreSearchHint => 'Cari film, serial, dan anime';

  @override
  String get exploreFilterAll => 'Semua';

  @override
  String get exploreTrending => 'Tren minggu ini';

  @override
  String get explorePopularMovies => 'Film populer';

  @override
  String get explorePopularTv => 'Serial populer';

  @override
  String get exploreTopAnime => 'Anime teratas';

  @override
  String get exploreNoResultsBody => 'Coba kata kunci lain atau jenis lain.';

  @override
  String get exploreOffline =>
      'Kamu sedang offline. Hubungkan internet untuk menemukan judul baru.';

  @override
  String get exploreRateLimited =>
      'Terlalu banyak permintaan. Tunggu sebentar lalu coba lagi.';

  @override
  String get exploreNotConfigured =>
      'Penemuan judul belum diatur. Tambahkan key TMDB di env/dev.json.';
}
