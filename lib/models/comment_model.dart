class Comment {
  final String profileUrl;
  final String accountName;
  final String post;
  List<Comment> subComments;

  Comment({
    required this.profileUrl,
    required this.accountName,
    required this.post,
    this.subComments = const [],
  });
}

List<Comment> demoComments = [
  Comment(
    profileUrl: 'assets/images/img6.jpg',
    accountName: 'HelloWorld404',
    post: 'What is new normal? it\'s absolutely\nabnormal',
    subComments: [
      Comment(
        profileUrl: 'assets/images/img2.jpg',
        accountName: 'BlueSky312',
        post: 'Her death be no pity',
      ),
      Comment(
        profileUrl: 'assets/images/img3.jpg',
        accountName: 'BubbleWrapMan',
        post: 'Don\'t lift it, search for vaccine',
      ),
    ],
  ),
  Comment(
    profileUrl: 'assets/images/img3.jpg',
    accountName: 'MedalOfHunter4',
    post:
        'Why do I get feeling the "New Normal"\nwill feel something Dystopian',
    subComments: [
      Comment(
        profileUrl: 'assets/images/img4.jpg',
        accountName: 'CleverProgrammer',
        post: 'Yikes, thats not true',
      ),
      Comment(
        profileUrl: 'assets/images/img5.jpg',
        accountName: 'Edwierdo',
        post: 'Do you think so?',
      ),
    ],
  ),
];
