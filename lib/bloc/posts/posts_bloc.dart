import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/posts/posts_events.dart';
import 'package:bloc_learn/bloc/posts/posts_states.dart';
import 'package:bloc_learn/repository/post_repository.dart';
import 'package:bloc_learn/utils/enums.dart';

import '../../repository/post_repository.dart';
import '../model/posts_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsStates> {
  // tempostlist ko call kiye h yha  search list ko store krne k liye
  List<PostModel> temPostList = [];

  PostRepository postRepository = PostRepository();

  PostsBloc() : super(const PostsStates()) {
    // api ko fetch krne ke liye
    on<PostFetched>(fetchPostApi);
    // filter krne k liye
    on<SearchItem>(_filterList);
  }

  // fliter krne k liye function bnaye h
  void _filterList(SearchItem event, Emitter<PostsStates> emit) async {
    // condition lgyenge ki age search kiye ur vh id hai hi nh list me to vha pe kus message show kr dega

    if (event.stSearch.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ''));
    } else {
      // logic lgaye h where ki help se ki finde kro data ko with the help of id and list ki form m return kr dega
      temPostList = state.postList
          .where(
            (element) => element.id.toString() == event.stSearch.toString(),
          )
          .toList();
      if (temPostList.isEmpty) {
        emit(state.copyWith(temPostList: temPostList, searchMessage: 'No data found'));

      } else {
        emit(state.copyWith(temPostList: temPostList));
      }
    }

    print(temPostList.length);
  }

  // api se data fetch krne ke fun bnye h
  void fetchPostApi(PostFetched event, Emitter<PostsStates> emit) async {
    try {
      final value = await postRepository.fetchPost();
      emit(
        state.copyWith(
          postStatus: PostStatus.success,
          message: 'success',
          postList: value,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          postStatus: PostStatus.failure,
          message: error.toString(),
        ),
      );
    }
  }
}
