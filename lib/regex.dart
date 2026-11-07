class Patterns {
  static final companyName = RegExp(r'^[A-Za-z0-9][A-Za-z0-9 .&-]{1,49}$');

  static final companyId = RegExp(r'^\d{16}$');

  static final email = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)*\.[A-Za-z]{2,}$');

  static final password = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
}
