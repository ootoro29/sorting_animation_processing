//SortObject S = new SelectionSort(450);
SortObject S = new QuickSort(800);
void setup() {
  size(1200, 800);
  noSmooth();
  frameRate(180);
  S.doSort();
}
boolean ok = false;
void draw() {
  background(0);
  if (ok)S.update();
  S.view();
}
void mouseReleased() {
  ok = !ok;
}
