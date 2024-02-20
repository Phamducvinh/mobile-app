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

      Books(
        imgUrl: 'assets/images/popular_books/anh4.jfif',
        author: 'Brooks Landon',
        title: 'Science Fiction After 1900',
        categories: 'Fiction',
        price: '286'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh5.jfif',
        author: 'Darrell B. Lockhart',
        title: 'Latin American Science Fiction Writers',
        categories: 'Literary Criticism',
        price: '249'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh6.jfif',
        author: 'Guy N. Smith',
        title: 'Writing Horror Fiction',
        categories: 'Language Arts & Disciplines',
        price: '113'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh7.jfif',
        author: 'Gregers Andersen',
        title: 'Climate Fiction and Cultural Analysis',
        categories: 'Literary Criticism',
        price: '154'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh8.jfif',
        author: 'Mahmoud Salami',
        title: 'John Fowles\'s Fiction and the Poetics of Postmodernism',
        categories: 'Fiction',
        price: '312'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh9.jfif',
        author: 'Sally Bushell',
        title: 'Reading and Mapping Fiction',
        categories: 'Literary Criticism',
        price: '353'
      ),

      Books(
        imgUrl: 'assets/images/popular_books/anh10.jfif',
        author: 'Nancy Armstrong',
        title: 'Desire and Domestic Fiction',
        categories: 'Desire in literature',
        price: '318'
      ),
    ];
  }

  static List<Books> generateAnimeBooks(){
    return[
      Books(
        imgUrl: 'assets/images/popular_books/anh1.jfif',
        author: 'Tony Fry',
        title: 'Writing Design Fiction',
        categories: 'Architecture',
        price: '208'
      ),
    ];
  }

}