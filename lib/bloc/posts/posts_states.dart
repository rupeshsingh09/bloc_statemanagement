import 'package:bloc_learn/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../model/posts_model.dart';

class PostsStates  extends Equatable {

  final PostStatus postStatus;
  final List<PostModel> postList;
  // filter data  ko store krne k liye
  final List<PostModel> temPostList;
  final String message ;
  final String searchMessage ;

  const PostsStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel> [],
    this.temPostList = const <PostModel> [],
    this.message = '',
    this.searchMessage = '',
});

  // COPYWITH function
  PostsStates copyWith ({PostStatus? postStatus, List<PostModel>? postList, List<PostModel>? temPostList, String? message, String? searchMessage }) {
    return PostsStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
        temPostList: temPostList ?? this.temPostList,
        message: message?? this.message,
      searchMessage: searchMessage?? this.searchMessage
    );
  }

  @override
  // TODO: implement props
  @override
  List<Object?> get props => [postStatus, postList,temPostList, message, searchMessage];


}