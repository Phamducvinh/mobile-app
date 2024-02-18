class Books {
  String? imgUrl;
  String? author;
  String? title;
  String? categories;
  String? price;
  Books({
    this.imgUrl,
    this.author,
    this.title,
    this.categories,
    this.price,
  });

  static List<Books> generatePopularBooks() {
    return [
      Books(
        imgUrl: 'assets/images/popular_books/anh1.jfif',
        author: 'Tony Fry',
        title: 'Writing Design Fiction',
        categories: 'Architecture',
        price: '208'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh2.jfif',
        author: 'Zhi Dao',
        title: 'History of Fiction in China',
        categories: 'History',
        price: '240'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh3.jfif',
        author: 'James E. Gunn',
        title: 'The Science of Science-fiction Writing',
        categories: 'Science fiction',
        price: '246'
      ),
    ];
  }
}