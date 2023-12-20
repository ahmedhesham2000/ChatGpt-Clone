import 'package:chatgpt_clone/controller/cubit/app_cubit.dart';
import 'package:chatgpt_clone/controller/helpers/bloc_observer.dart';
import 'package:chatgpt_clone/controller/helpers/cache_helper.dart';
import 'package:chatgpt_clone/controller/helpers/dio_helper.dart';
import 'package:chatgpt_clone/core/constants/constants.dart';
import 'package:chatgpt_clone/core/theme/custom_theme.dart';
import 'package:chatgpt_clone/view/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  apiKey=dotenv.env['CHATGPT_API_KEY']!;
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (BuildContext context) => AppCubit()..getLastChatHistory(),
        ),
      ],
      child: MaterialApp(
          theme: CustomTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home:  const SplashScreen(),
        ),
    );
  }
}

