class SelectionSort extends SortObject {
  SelectionSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();

    for (int i = 0; i < A.size(); i++) {
      int min = A.get(i);
      int min_index = i;
      for (int j = i+1; j < A.size(); j++) {
        if (A.get(j) < min) {
          min_index = j;
          min = A.get(j);
        }
      }
      if (min_index != i) {
        Element E = new Exchange(min_index, i);
        EList.add(E);
        E.action(A);
      }
    }
  }
}

class BubbleSort extends SortObject {
  BubbleSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();

    for (int i = 0; i < A.size()-2; i++) {
      for (int j = A.size()-1; j > i; j--) {
        if (A.get(j-1) > A.get(j)) {
          Element E = new Exchange(j-1, j);
          EList.add(E);
          E.action(A);
        }
      }
    }
  }
}

class ShakerSort extends SortObject {
  ShakerSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();

    int l = 0;
    int r = A.size()-1;
    int change_point = A.size()-1;

    while (l < r) {
      for (int i = r; i > l; i--) {
        if (A.get(i-1) > A.get(i)) {
          Element E = new Exchange(i-1, i);
          EList.add(E);
          E.action(A);
          change_point = i;
        }
      }
      l = change_point;
      for (int i = l; i <= r; i++) {
        if (A.get(i-1) > A.get(i)) {
          Element E = new Exchange(i-1, i);
          EList.add(E);
          E.action(A);
          change_point = i;
        }
      }
      r = change_point;
    }
  }
}

class QuickSort extends SortObject {
  QuickSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();
    quick(A, 0, A.size()-1);
  }

  void quick(ArrayList<Integer> A, int l, int r) {
    int l0 = l;
    int r0 = r;
    if (l >= r)return;
    int pivot = (r+l)/2;
    int pivot_key = A.get(pivot);
    while (l < r) {
      if (A.get(l) < pivot_key) {
        l++;
      } else if (A.get(r) > pivot_key) {
        r--;
      } else {
        Element E = new Exchange(l, r);
        EList.add(E);
        E.action(A);
      }
    }
    quick(A, l0, l);
    quick(A, l+1, r0);
  }
}

class InsertSort extends SortObject {
  InsertSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();

    for (int i = 0; i < A.size(); i++) {
      int tmp = A.get(i);
      for (int j = i-1; j >= 0 && A.get(j) > tmp; j--) {
        //if (!())break;
        Element E = new Exchange(j, j+1);
        EList.add(E);
        E.action(A);
      }
    }
  }
}

class ShellSort extends SortObject {
  ShellSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();

    int gap = 1;
    while (gap < A.size()/2)gap = 2*gap+1;
    while (gap > 0) {
      for (int i = gap; i < A.size(); i++) {
        int tmp = A.get(i);
        for (int j = i-gap; j >= 0 && A.get(j) > tmp; j-=gap) {
          Element E = new Exchange(j, j+gap);
          EList.add(E);
          E.action(A);
        }
      }
      gap = gap/2;
    }
  }
}

class MergeSort extends SortObject {
  MergeSort(int N) {
    super(N);
  }
  void doSort() {
    ArrayList<Integer> A = copyList();
    merge(A, 0, A.size()-1);
  }
  void merge(ArrayList<Integer>A, int l, int r) {
    int l0 = l;
    int r0 = r;
    if (l >= r)return;
    int t[] = new int[A.size()];
    int sort_index[] = new int[A.size()];
    for (int i = 0; i < A.size(); i++) {
      t[i] = -1;
      sort_index[i] = -1;
    }
    int m = (l+r)/2;
    merge(A, l, m);
    merge(A, m+1, r);
    for (int i = l; i <= m; i++) {
      t[i] = A.get(i);
    }
    for (int i = m+1; i <= r; i++) {
      t[i] = A.get(r-i+m+1);
    }
    int k = l0;
    while (k <= r0) {
      if (t[l] <= t[r]) {
        Element E = new Set(k, t[l]);
        EList.add(E);
        E.action(A);
        l++;
      } else {
        Element E = new Set(k, t[r]);
        EList.add(E);
        E.action(A);
        r--;
      }
      k++;
    }
  }
}
