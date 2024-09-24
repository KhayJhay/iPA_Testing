class Post {
  final String profileUrl;
  final String accountName;
  final String post;
  final String author;
  final String time;
  final bool hasMedia;
  bool isTrending;
  bool isReddit;
  final String likes;
  final String comments;
  String thumbnail;

  Post(
      {required this.profileUrl,
      required this.accountName,
      required this.post,
      required this.author,
      required this.time,
      required this.hasMedia,
      this.isTrending = false,
      this.isReddit = false,
      required this.likes,
      required this.comments,
      this.thumbnail = 'assets/images/vid.jpeg'});
}

List<Post> demoPosts = [
  Post(
    profileUrl:
        'https://ghanatoday.gov.gh/wp-content/uploads/2022/08/mrs-jemima-oware-1079x570.jpg',
    accountName: 'r/AskReddit',
    post:
        'The Office of the Registrar of Companies (ORC) has taken over the registration of businesses from the Registrar General’s Department.',
    author: 'r/coochieforbreakfast',
    time: '7h',
    isTrending: true,
    isReddit: true,
    hasMedia: false,
    likes: '28,2 K',
    comments: '3,0 K',
  ),
  Post(
    profileUrl:
        'https://media.licdn.com/dms/image/D4D22AQEDbAkJh5bZHQ/feedshare-shrink_800/0/1686072473357?e=2147483647&v=beta&t=3TilzuWAMoNL1r7lEeHDlyV3yF5DVPfBRrFcooxvFvA',
    accountName: 'r/DartLang',
    post:
        'The Registrar of Companies (ORC) wishes to invite all registered professional bodies in Ghana to a meeting to discuss new developments relating to professional bodies.',
    author: 'r/user2',
    time: '3h',
    hasMedia: false,
    likes: '10,2 K',
    comments: '500',
  ),
  Post(
    profileUrl:
        'https://amchamghana.org/storage/2022/11/AmCham-GARIA-Meeting-5.jpg',
    accountName: 'r/CorronaVirus',
    post:
        'The American Chamber of Commerce, Ghana, and the Ghana Association of Restructuring & Insolvency Advisors (GARIA) On Thursday, November 3, 2022, hosted the Registrar of Companies,  Jemima Oware, for a discussion of the new Office of the Registrar of Companies (ORC) towards enhancing the Ease of Doing Business in Ghana at the 5Th AmCham/GARIA Business Meeting',
    author: 'u/internetPositif',
    time: '7h',
    hasMedia: true,
    likes: '28,2 K',
    comments: '3,0 K',
  ),
  Post(
    profileUrl: 'https://pbs.twimg.com/media/GLN-v5zXwAI8IHN.jpg',
    accountName: 'r/Programming',
    post:
        '"Embrace the possibilities that each new day brings! 💫 #MondayMotivation #PositiveVibes"',
    author: 'u/techNerd',
    time: '1d',
    hasMedia: false,
    likes: '5,2 K',
    comments: '2,0 K',
  ),
];
