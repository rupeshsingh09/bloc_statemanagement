import 'package:bloc_learn/bloc/posts/posts_bloc.dart';
import 'package:bloc_learn/bloc/posts/posts_events.dart';
import 'package:bloc_learn/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter/counter_bloc.dart';
import '../../bloc/counter/counter_state.dart';
import '../../bloc/posts/posts_states.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts APIs'),
        actions: [

        ],
      ),

      body: BlocBuilder<PostsBloc, PostsStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));

            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search with email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (filterkey) {
                      context.read<PostsBloc>().add(SearchItem(filterkey));
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage.toString()))
                        : ListView.builder(
                      itemCount: state.temPostList.isEmpty
                          ? state.postList.length
                          : state.temPostList.length,
                      itemBuilder: (context, index) {
                        final item = state.temPostList.isEmpty
                            ? state.postList[index]
                            : state.temPostList[index];

                        return Card(
                          child: ListTile(
                            title: Text(item.email ?? 'No Email'),
                            subtitle: Text(item.body ?? 'No Content'),
                          ),
                        );
                      },
                    )

                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
