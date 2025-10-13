class ChannelsModels {
  final String channelLogo;
  final String channelName;
  bool isfollow;

  ChannelsModels({
    required this.channelLogo,
    required this.channelName,
    this.isfollow = false,
  });
}

List<ChannelsModels> ChannelsModelData = [
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_1.jpg',
    channelName: 'CNBC',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_2.jpg',
    channelName: 'VICE',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_3.jpg',
    channelName: 'VOX',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_4.jpg',
    channelName: 'BBC News',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_5.jpg',
    channelName: 'SCMP',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_6.jpg',
    channelName: 'CNN',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_7.jpg',
    channelName: 'MSN',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_8.jpg',
    channelName: 'CNET',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_9.jpg',
    channelName: 'USA TODAY',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_10.jpg',
    channelName: 'TIMES',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_11.jpg',
    channelName: 'Buzzfeed',
  ),
  ChannelsModels(
    channelLogo: 'assets/images/chanl_logo_12.jpg',
    channelName: 'Daily Mail',
  ),
];
