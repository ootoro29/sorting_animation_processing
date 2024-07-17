abstract class Element {
  int target1;
  int target2;
  Element(int target1, int target2) {
    this.target1 = target1;
    this.target2 = target2;
  }
  abstract void action(ArrayList<Integer> Target);
  abstract int T1();
  abstract int T2();
}

class Exchange extends Element {
  Exchange(int target1, int target2) {
    super(target1, target2);
  }
  void action(ArrayList<Integer> Target) {
    int temp = Target.get(target1);
    Target.set(target1, Target.get(target2));
    Target.set(target2, temp);
  }
  int T1() {
    return target1;
  }
  int T2() {
    return target2;
  }
}

class Set extends Element {
  Set(int target1, int target2) {
    super(target1, target2);
  }
  void action(ArrayList<Integer> Target) {
    Target.set(target1, target2);
  }
  int T1() {
    return target1;
  }
  int T2() {
    return -1;
  }
}
