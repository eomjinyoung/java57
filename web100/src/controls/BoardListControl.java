package controls;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Board;
import dao.BoardDao;

@WebServlet("/board/list.do")
public class BoardListControl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    BoardDao dao = new BoardDao();
    List<Board> list = dao.list();
    req.setAttribute("list", list);
    
    RequestDispatcher rd = req.getRequestDispatcher("/board/list.jsp");
    rd.forward(req, resp);
  }
}









