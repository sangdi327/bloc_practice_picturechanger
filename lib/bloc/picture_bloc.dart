import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cubitbloc_practice_picturechanger/repository/picture_repository.dart';
import 'package:equatable/equatable.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  PictureRepository pictureRepository;
  PictureBloc(this.pictureRepository) : super(const PictureState.init()) {
    on<PictureEvent>(
      (event, emit) async {
        emit(state.copyWith(count: state.count + 1));
        var path = await pictureRepository.getLandscape(state.count);
        emit(state.copyWith(path: path));
      },
      transformer: droppable(),
    );
  }
}

class PictureEvent {}

class PictureState extends Equatable {
  final int count;
  final String? path;

  const PictureState({
    required this.count,
    this.path = '',
  });

  PictureState copyWith({
    int? count,
    String? path,
  }) {
    return PictureState(count: count ?? this.count, path: path ?? this.path);
  }

  const PictureState.init() : this(count: -1);

  @override
  List<Object?> get props => [count, path];
}
