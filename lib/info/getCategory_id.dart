int getCategoryID(String categoryName) {
  if (categoryName == 'General Knowledge') {
    return 9;
  } else if (categoryName == 'Entertainment: Film') {
    return 11;
  } else if (categoryName == 'Entertainment: Music') {
    return 12;
  } else if (categoryName == 'Entertainment: Video Games') {
    return 15;
  } else if (categoryName == 'Science: Computers') {
    return 18;
  } else if (categoryName == 'Sports') {
    return 21;
  } else if (categoryName == 'Entertainment: Japanese Anime & Manga') {
    return 31;
  } else if (categoryName == 'Entertainment: Cartoon & Animations') {
    return 32;
  } else {
    return null;
  }
}
