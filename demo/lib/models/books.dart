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
        imgUrl: 'assets/images/anime_books/anh1.jfif',
        author: 'Fred Patten',
        title: 'Watching Anime, Reading Manga',
        categories: 'Performing Arts',
        price: '360'
      ),

      Books(
        imgUrl: 'assets/images/anime_books/anh2.png',
        author: 'Pubis Anime',
        title: 'Anime Right Meow My Manga Journal',
        categories: 'Performing Arts',
        price: '122'
      ),
      
      Books(
        imgUrl: 'assets/images/anime_books/anh3.png',
        author: 'Frenchy Lunning',
        title: 'Mechademia 1',
        categories: 'Art',
        price: '214'
      ),

      Books(
        imgUrl: 'assets/images/anime_books/anh4.png',
        author: 'Northrop Davis',
        title: 'Manga and Anime Go to Hollywood',
        categories: 'Performing Arts',
        price: '439'
      ),

      Books(
        imgUrl: 'assets/images/anime_books/anh5.png',
        author: 'Timothy Perper',
        title: 'Mangatopia Animation',
        categories: 'Performing Arts',
        price: '275'
      ),
    ];
  }

  static List<Books> generateAdventureBooks(){
    return [
      Books(
        imgUrl: 'assets/images/adventure_books/anh1.png',
        author: 'T.L. Charles',
        title: 'Episode Three: Mother (science fiction action adventure comedy)',
        categories: 'Fiction',
        price: '37'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh2.png',
        author: 'Emma Orczy',
        title: 'THE GREAT ADVENTURE Boxed Set: 56 Action-Adventure Classics, Spy Thrillers & Historical Novels',
        categories: 'Fiction',
        price: '6908'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh3.png',
        author: 'Lucas Flint',
        title: 'Powers (action adventure young adult superheroes)',
        categories: 'Fiction',
        price: '222'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh4.png',
        author: 'Michael Anderle',
        title: 'Tomb Raider Emeritus: An Urban Fantasy Action Adventure',
        categories: 'Fiction',
        price: '268'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh5.png',
        author: 'Tony Reed',
        title: 'Neptune Island',
        categories: 'Fiction',
        price: '256'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh6.png',
        author: 'Michael Anderle',
        title: 'Kill The Willing: An Urban Fantasy Action Adventure',
        categories: 'Fiction',
        price: '306'
      ),

      Books(
        imgUrl: 'assets/images/adventure_books/anh7.png',
        author: 'Robert E. Howard',
        title: 'KULL OF ATLANTIS - Complete Fantasy & Action-Adventure Series',
        categories: 'Fiction',
        price: '100'
      ),
    ];
  }

  static List<Books> generateHorrorBooks(){
    return [
      Books(
        imgUrl: 'assets/images/horror_books/anh1.png',
        author: 'Bruce F. Kawin',
        title: 'Horror and the Horror Film',
        categories: 'Performing Arts',
        price: '269'
      ),
      Books(
        imgUrl: 'assets/images/horror_books/anh2.png',
        author: 'H. P. Lovecraft',
        title: 'The Dunwich Horror',
        categories: 'Fiction',
        price: '128'
      ),
      Books(
        imgUrl: 'assets/images/horror_books/anh3.png',
        author: 'Brigid Cherry',
        title: 'Horror Terrible Film',
        categories: 'Performing Arts',
        price: '256'
      ),
      Books(
        imgUrl: 'assets/images/horror_books/anh4.png',
        author: 'Massimo Rosi',
        title: 'Vietnam horror',
        categories: 'Comics & Graphic Novels',
        price: '120'
      ),
      Books(
        imgUrl: 'assets/images/horror_books/anh5.png',
        author: 'Darryl Jones',
        title: 'Sleeping With the Lights On',
        categories: 'Literary Criticism',
        price: '208'
      ),
      // Books(
      //   imgUrl: 'assets/images/horror_books/anh6.png',
      //   author: 'H. P. Lovecraft',
      //   title: 'Supernatural Horror in Literature',
      //   categories: 'Literary Criticism',
      //   price: '950'
      // ),
    ];
  }

  static List<Books> generateNovelBooks(){
    return [
      Books(
        imgUrl: 'assets/images/novel_books/anh1.png',
        author: 'Fred Patten',
        title: 'Correction Film',
        categories: 'Fiction',
        price: '288'
      ),
      Books(
        imgUrl: 'assets/images/novel_books/anh2.png',
        author: 'Keith Selby',
        title: 'Screening The Novel',
        categories: 'Fiction',
        price: '214'
      ),
      Books(
        imgUrl: 'assets/images/novel_books/anh3.png',
        author: 'M. Boccardi',
        title: 'The Contemporary British Historical Novel',
        categories: 'Literary Criticism',
        price: '193'
      ),
      Books(
        imgUrl: 'assets/images/novel_books/anh4.png',
        author: 'Ato Quayson',
        title: 'The Cambridge Companion to the Postcolonial Novel',
        categories: 'Literary Criticism',
        price: '335'
      ),
      Books(
        imgUrl: 'assets/images/novel_books/anh5.png',
        author: 'Bill Overton',
        title: 'The Novel of Female Adultery',
        categories: 'Fiction',
        price: '298'
      ),
      Books(
        imgUrl: 'assets/images/novel_books/anh6.png',
        author: 'H. Dalley',
        title: 'The Postcolonial Historical Novel',
        categories: 'Literary Criticism',
        price: '226'
      ),
      // Books(
      //   imgUrl: 'assets/images/novel_books/anh7.png',
      //   author: 'T.B. Tomlinson',
      //   title: 'The English Middle-Class Novel',
      //   categories: 'Fiction',
      //   price: '207'
      // ),
    ];
  }
}