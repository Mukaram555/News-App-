class TopicsModel{
  final String topicsName;
  final String topicTitle;
  final String topicsImages;
  bool isSaved;

  TopicsModel({required this.topicsName, required this.topicTitle, required this.topicsImages,  this.isSaved = false,});
}

List<TopicsModel> TopicsModelData = [
  TopicsModel(
      topicsName: 'All',
      topicTitle: 'Stay informed with the latest breaking news and top stories',
      topicsImages: 'assets/images/home.jpeg'

  ),
  TopicsModel(topicsName: 'Sports', topicTitle: 'Get the latest sports scores, highlights, and team news updates', topicsImages: 'assets/images/sports.jpeg'

  ),
  TopicsModel(topicsName: 'Politics', topicTitle: 'Follow the latest political developments, elections, and policy changes', topicsImages: 'assets/images/politics.jpeg'

  ),
  TopicsModel(topicsName: 'US', topicTitle: 'Stay updated on news, events, and developments across the United States', topicsImages: 'assets/images/us.jpeg'

  ),
  TopicsModel(topicsName: 'Business', topicTitle: 'Get the latest business news, market updates, and financial insights', topicsImages: 'assets/images/business.jpeg'

  ),
  TopicsModel(topicsName: 'Health', topicTitle: 'Discover the latest health news, medical breakthroughs, and wellness tips', topicsImages: 'assets/images/health.jpeg'

  ),
  TopicsModel(topicsName: 'Travel', topicTitle: 'Explore travel destinations, tips, and the latest tourism industry updates', topicsImages: 'assets/images/travel.jpeg'

  ),
  TopicsModel(topicsName: 'Science', topicTitle: 'Stay informed about scientific discoveries, research, and technological advances', topicsImages: 'assets/images/science.jpeg'

  ),
  TopicsModel(topicsName: 'Books', topicTitle: 'Discover new book releases, author interviews, and literary world updates', topicsImages: 'assets/images/books.png'

  ),
  TopicsModel(topicsName: 'Food', topicTitle: 'Explore food trends, recipes, restaurant reviews, and culinary innovations', topicsImages: 'assets/images/food.png'

  ),
  TopicsModel(topicsName: 'Movies', topicTitle: 'Get the latest movie news, reviews, trailers, and entertainment updates', topicsImages: 'assets/images/movies.png'

  ),
  TopicsModel(topicsName: 'Fashion', topicTitle: 'Stay updated on fashion trends, designer news, and style inspiration', topicsImages: 'assets/images/fashion.jpeg'

  ),
  TopicsModel(topicsName: 'World', topicTitle: 'Stay updated on fashion trends, designer news, and style inspiration', topicsImages: 'assets/images/fashion.jpeg'

  ),

];
