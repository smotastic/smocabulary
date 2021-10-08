import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/data/config.dart';
import 'package:supabase/supabase.dart';

@LazySingleton()
class SupabaseHelper {
  SupabaseClient? db;
  Config config;
  SupabaseHelper(this.config);

  Future<SupabaseClient> get database async {
    return db ?? initDb();
  }

  SupabaseClient initDb() {
    return SupabaseClient(
        config.get('SUPABASE_URL') ?? '', config.get('SUPABASE_API_KEY') ?? '');
  }
}
