class HomeController {
  int _currentPageIndex = 0;

  get currentPageIndex => _currentPageIndex;

  void setCurrentPage(int index) {
    this._currentPageIndex = index;
  }
}
