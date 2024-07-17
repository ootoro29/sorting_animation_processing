abstract class SortObject {
  ArrayList<Integer> List;
  ArrayList<Integer> view_List;
  ArrayList<Element> EList;
  int time = 0;
  int EIndex = 0;
  int N = 600;
  Element doEl;
  SortObject(int N) {
    this.N = N;
    ArrayList<Integer> temp_List;
    temp_List = new ArrayList();
    List = new ArrayList();
    view_List = new ArrayList();
    EList = new ArrayList();

    for (int i = 0; i < N; i++) {
      temp_List.add(i);
    }

    for (int i = 0; i < N; i++) {
      int index = (int)random(0, temp_List.size());
      List.add(temp_List.get(index));
      temp_List.remove(index);
    }

    init_viewList();
  }

  void init_viewList() {
    for (int i = 0; i < List.size(); i++) {
      view_List.add(List.get(i));
    }
  }

  void update() {
    time++;
    if (time % 1 == 0) {
      if (EIndex < EList.size()) {
        doEl = EList.get(EIndex);
        EList.get(EIndex).action(view_List);
        EIndex++;
      } else {
        doEl = null;
      }
    }
  }

  ArrayList<Integer> copyList() {
    ArrayList<Integer> Answer = new ArrayList();
    for (int i = 0; i < N; i++) {
      Answer.add(List.get(i));
    }
    return Answer;
  }

  void view() {
    int red_target = -1;
    int green_target = -1;
    if (doEl != null) {
      red_target = doEl.T1();
      green_target = doEl.T2();
    }
    //ゲーミング化①
    /*
    colorMode(HSB);
    */
    for (int i = 0; i < N; i++) {
      float w = width/(float)N;
      float h = height/(float)N;
      if (red_target == i) {
        fill(255, 0, 0);
      }
      if (green_target == i) {
        fill(0, 255, 0);
      }
      //ゲーミング化②
      /*
      fill(255*(view_List.get(i)/float(N)), 255, 255);
      stroke(255*(view_List.get(i)/float(N)), 255, 255);
      */
      
      fill(255);
      stroke(255); //←ゲーミング化するときはここの二行を消すように
      
      rect(i*w, height, w, -view_List.get(i)*h);
    }
    colorMode(RGB);
  }
  abstract void doSort();
}
