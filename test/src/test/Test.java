package test;

public class Test {

  public static void main(String[] args) {
    Score c = new Score();
    c.setName("홍길동");
    c.setKor(100);
    c.setEng(100);
    c.setMath(100);
    
    
    Score c2 = new Score()
                    .setName("임꺽정")
                    .setKor(100)
                    .setEng(100)
                    .setMath(100);

  }

}
