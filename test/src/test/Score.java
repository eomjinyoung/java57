package test;

public class Score {
  String name;
  int kor;
  int eng;
  int math;
  int sum;
  float average;
  
  public String getName() {
    return name;
  }
  public Score setName(String name) {
    this.name = name;
    return this;
  }
  public int getKor() {
    return kor;
  }
  public Score setKor(int kor) {
    this.kor = kor;
    return this;
  }
  public int getEng() {
    return eng;
  }
  public Score setEng(int eng) {
    this.eng = eng;
    return this;
  }
  public int getMath() {
    return math;
  }
  public Score setMath(int math) {
    this.math = math;
    return this;
  }
  public int getSum() {
    return sum;
  }
  public Score setSum(int sum) {
    this.sum = sum;
    return this;
  }
  public float getAverage() {
    return average;
  }
  public Score setAverage(float average) {
    this.average = average;
    return this;
  }
  
  
}
