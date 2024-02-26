import 'package:demo_flutter/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';



final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void getItSetupInit() => getIt.init();