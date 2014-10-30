package dao;

import java.util.ArrayList;
import java.util.List;

import vo.Board;

public class BoardDao {
  public List<Board> list() {
    ArrayList<Board> l = new ArrayList<Board>();
    l.add(new Board(1, "제목111", "내용1111"));
    l.add(new Board(2, "제목222", "내용22222"));
    l.add(new Board(3, "제목333", "내용33333"));
    l.add(new Board(4, "제목444", "내용4444"));
    l.add(new Board(5, "제목5555", "내용55555"));
    return l;
  }
}
