import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/views/app/social_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var posts = SocialCubit.get(context).posts;
        return posts.isNotEmpty || state is SocialGetPostsSuccess
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2023/04/BMD-4471.png'),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'communicate with friends',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildPostItem(context, posts[index], index),
                      itemCount: posts.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildPostItem(context, PostModel post, int index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        color: Colors.white70,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(post.image!),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(post.name!),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16.0,
                          )
                        ],
                      ),
                      Text(
                        post.dateTime!,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                post.text!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 18),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 3.0),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 25.0,
              //             child: MaterialButton(
              //                 minWidth: 1,
              //                 padding: EdgeInsets.zero,
              //                 onPressed: () {},
              //                 child: Text(
              //                   '#flutter',
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .caption
              //                       ?.copyWith(
              //                           color: Colors.blue, fontSize: 16),
              //                 )),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (post.postImage != '')
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: NetworkImage(post.postImage!),
                        fit: BoxFit.cover,
                      )),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 20.0,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${SocialCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.chat_outlined,
                                size: 20.0,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '0 comment',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18.0,
                            backgroundImage: NetworkImage(
                                SocialCubit.get(context).model!.image!),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'write a comment ...',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    onTap: () {
                      SocialCubit.get(context)
                          .likePost(SocialCubit.get(context).postsId[index]);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
}
