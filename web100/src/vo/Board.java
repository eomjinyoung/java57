package vo;

public class Board {
  int no;
  String subject;
  String content;
  
  public Board() {}
  
  public Board(int no, String subject, String content) {
    this.no = no;
    this.subject = subject;
    this.content = content;
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  
  
}
