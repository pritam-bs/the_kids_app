import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/home_event.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const Initial()) {
    on<Initialize>(_onInitialize);
  }

  Future<void> _onInitialize(HomeEvent event, Emitter<HomeState> emit) async {}
}
