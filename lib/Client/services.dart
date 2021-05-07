class Services {
  static String base_url = "https://haradan.com";
  static String last_advert_url = base_url +
      '/adverts/search/satilik-atlar?direction=DESC&page=0&size=10&sort=createdDate';
  static String vitrin_ilan_url = base_url +
      '/adverts/doping?direction=DESC&doping=MAINPAGE_SHOW_CASE&page=0&size=20&sort=createdDate';
  static String slider_url = base_url +
      '/banners/search?direction=DESC&page=0&size=5&sort=createdDate&status=ACTIVE&type=SLIDER';
  static String ekuri_slider_url = base_url +
      '/banners/search?direction=DESC&page=0&size=5&sort=createdDate&status=ACTIVE&type=CORPORATE_ADVERT';

  static String kategori_url = base_url+"/categories/mainpage";
}
