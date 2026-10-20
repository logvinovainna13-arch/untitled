import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/repository/pet_repository.dart';

part 'fox_event.dart';
part 'fox_state.dart';

class FoxBloc extends Bloc<FoxEvent, FoxState> {
  final PetRepository _repository = PetRepository();

  FoxBloc() : super(FoxInitial()) {
    on<GetFoxImageEvent>((event, emit) async {
      try{
        emit (LoadingFoxState());
        final String foxImage = await _repository.getRandomFoxImage();
        emit (LoadedFoxImageState (img: foxImage));
      } catch (error) {
        print('РЕАЛЬНАЯ ОШИБКА ИЗ РЕПОЗИТОРИЯ: $error');
        emit(ErrorFoxState());
      }

    });
  }

}
