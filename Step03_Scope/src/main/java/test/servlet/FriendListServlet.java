package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//친구 목록을 얻어오는 비즈니스 로직을 수행한다.
		List<String> list = new ArrayList<>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		//로직 수행결과로 얻어낸 데이터(Model)를 request scope 에 담기
		req.setAttribute("list", list);
		
		//jsp 페이지로 (view page) forward 이동해서 응답하기 ( forward 이동은 WEB-INF 폴더안쪽도 가능하다 )
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/friend/list.jsp");
		rd.forward(req, resp);
	}
}
