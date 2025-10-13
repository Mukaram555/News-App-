// lib/SRC/Presentation/Screens/comment_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/comment_model.dart';

class CommentScreen extends StatefulWidget {
  final String articleId;
  final String articleTitle;

  const CommentScreen({
    super.key,
    required this.articleId,
    required this.articleTitle,
  });

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  String? _replyingToCommentId;
  String? _replyingToUserName;

  // Mock data - replace with actual API calls
  final List<Comment> _comments = [
    Comment(
      id: '1',
      userId: 'user1',
      userName: 'John Doe',
      userAvatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      content: 'This is a great article! Really enjoyed reading it.',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      likes: 15,
      replies: [
        Comment(
          id: '1-1',
          userId: 'user2',
          userName: 'Sarah Smith',
          userAvatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
          content: 'I totally agree with you John!',
          timestamp: DateTime.now().subtract(Duration(hours: 1)),
          likes: 5,
        ),
      ],
    ),
    Comment(
      id: '2',
      userId: 'user3',
      userName: 'Mike Johnson',
      userAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      content: 'The research presented here is quite comprehensive. Would love to see more data on this topic.',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      likes: 8,
      isLiked: true,
    ),
    Comment(
      id: '3',
      userId: 'user4',
      userName: 'Emily Chen',
      userAvatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      content: 'As someone working in this field, I can confirm these findings align with current industry trends.',
      timestamp: DateTime.now().subtract(Duration(hours: 5)),
      likes: 12,
      replies: [
        Comment(
          id: '3-1',
          userId: 'user5',
          userName: 'David Wilson',
          userAvatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
          content: 'Thanks for sharing your professional insight Emily!',
          timestamp: DateTime.now().subtract(Duration(hours: 4)),
          likes: 3,
        ),
        Comment(
          id: '3-2',
          userId: 'user1',
          userName: 'John Doe',
          userAvatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
          content: 'Could you elaborate more on which trends you\'re referring to?',
          timestamp: DateTime.now().subtract(Duration(hours: 3)),
          likes: 2,
        ),
      ],
    ),
  ];

  void _postComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user', // Replace with actual user ID
      userName: 'Current User', // Replace with actual user name
      userAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      content: text,
      timestamp: DateTime.now(),
    );

    setState(() {
      _comments.insert(0, newComment);
    });

    _commentController.clear();
    _commentFocusNode.unfocus();
  }

  void _postReply(String parentCommentId) {
    final text = _replyController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      final parentIndex = _comments.indexWhere((comment) => comment.id == parentCommentId);
      if (parentIndex != -1) {
        final parentComment = _comments[parentIndex];
        final newReply = Comment(
          id: '${parentComment.id}-${parentComment.replies!.length + 1}',
          userId: 'current_user',
          userName: 'Current User',
          userAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
          content: text,
          timestamp: DateTime.now(),
        );

        final updatedComment = parentComment.copyWith(
          replies: [...parentComment.replies!, newReply],
        );

        _comments[parentIndex] = updatedComment;
      }
    });

    _cancelReply();
  }

  void _startReply(Comment comment) {
    setState(() {
      _replyingToCommentId = comment.id;
      _replyingToUserName = comment.userName;
    });
    _replyController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_commentFocusNode);
    });
  }

  void _cancelReply() {
    setState(() {
      _replyingToCommentId = null;
      _replyingToUserName = null;
    });
    _replyController.clear();
    _commentFocusNode.unfocus();
  }

  void _toggleLike(Comment comment) {
    setState(() {
      final index = _comments.indexWhere((c) => c.id == comment.id);
      if (index != -1) {
        final updatedComment = comment.copyWith(
          likes: comment.isLiked ? comment.likes - 1 : comment.likes + 1,
          isLiked: !comment.isLiked,
        );
        _comments[index] = updatedComment;
      }
    });
  }
  // void _toggleReplyLike(Comment reply) {
  //   setState(() {
  //     final index = _comments[7].replies.indexWhere((c) => c.id == reply.id);
  //     if (index != -1) {
  //       final updatedComment = reply.copyWith(
  //         likes: reply.isLiked ? reply.likes - 1 : reply.likes + 1,
  //         isLiked: !reply.isLiked,
  //       );
  //       _comments[index] = updatedComment;
  //     }
  //   });
  // }

  String _formatTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';

    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Reply Banner
          if (_replyingToCommentId != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              color: Theme.of(context).colorScheme.primary.withAlpha((255*0.1).toInt()),
              child: Row(
                children: [
                  Text(
                    'Replying to $_replyingToUserName',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _cancelReply,
                    child: Icon(
                      Icons.close,
                      size: 18.r,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

          // Comments List
          Expanded(
            child: _comments.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.comment_outlined,
                    size: 64.r,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No comments yet',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Be the first to comment!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(16.r),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return _buildCommentItem(_comments[index]);
              },
            ),
          ),

          // Comment Input
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.1).toInt()),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.2).toInt()),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: Theme.of(context).textTheme.bodySmall,
                            controller: _replyingToCommentId != null
                                ? _replyController
                                : _commentController,
                            focusNode: _commentFocusNode,
                            maxLines: null,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _replyingToCommentId != null
                                ? _postReply(_replyingToCommentId!)
                                : _postComment(),
                            decoration: InputDecoration(
                              hintText: _replyingToCommentId != null
                                  ? 'Write a reply...'
                                  : 'Add a comment...',
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: _replyingToCommentId != null
                      ? () => _postReply(_replyingToCommentId!)
                      : _postComment,
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.send,
                      size: 20.r,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Comment
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(comment.userAvatar),
            ),
            SizedBox(width: 12.w),

            // Comment Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info and timestamp
                  Row(
                    children: [
                      Text(
                        comment.userName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatTimeAgo(comment.timestamp),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  // Comment text
                  Text(
                    comment.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8.h),

                  // Actions
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _toggleLike(comment),
                        child: Row(
                          children: [
                            Icon(
                              comment.isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 18.r,
                              color: comment.isLiked
                                  ? Colors.red
                                  : Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              comment.likes.toString(),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: () => _startReply(comment),
                        child: Row(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 18.r,
                              color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Reply',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        // Replies
        if (comment.replies!.isNotEmpty) ...[
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Column(
              children: comment.replies!.map((reply) => _buildReplyItem(reply)).toList(),
            ),
          ),
        ],

        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildReplyItem(Comment reply) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundImage: NetworkImage(reply.userAvatar),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reply.userName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      _formatTimeAgo(reply.timestamp),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  reply.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _toggleLike(reply),
                      child: Row(
                        children: [
                          Icon(
                            reply.isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 16.r,
                            color: reply.isLiked
                                ? Colors.red
                                : Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            reply.likes.toString(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withAlpha((255*0.6).toInt()),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _replyController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CommentScreen extends StatelessWidget {
//   const CommentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal:  10.0.w, vertical: 10.0.h),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                       onTap: (){
//                         Navigator.pop(context);
//                       },
//                       child: Icon(Icons.arrow_back)),
//                   Text('Comment',style: Theme.of(context).textTheme.labelSmall,),
//                   SizedBox(
//
//                   ),
//                 ],
//               ),
//             Column(
//               children: [
//                 Container(
//                   height: 400,
//                   color: Colors.red,
//                 ),
//                 Container(
//                   height: 400,
//                   color: Colors.amber,
//                 )
//               ],
//
//             ),
//
//
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
