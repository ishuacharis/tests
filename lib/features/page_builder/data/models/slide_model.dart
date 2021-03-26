
class Slide {
  final String imgUrl;
  final String title;
  final String description;

  const Slide({required this.imgUrl, required this.title, required this.description});
}

final List<Slide> slides = [
  Slide(
      imgUrl: "assets/images/house.png",
    title: "This is our title",
    description: "It is a long established fact that a reader will be distracted "
        "by the readable content of a page when looking at its layout. "
        "The point of using Lorem Ipsum is " "that it has a more-or-less "
        "normal distribution of letters, as opposed to using 'Content here, content here',"
  ),
  Slide(
    imgUrl: "assets/images/face.png",
    title: "this is the second",
    description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature "
        "from 45 BC, making it over 2000 years old. Richard McClintock,"
  ),
];