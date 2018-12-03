package search_test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static private List<String> list = new ArrayList<>();
	     static{
	         list.add("xsb");
	         list.add("xzq");
	         list.add("kb");
	         list.add("kbssb");
	         list.add("ajax");
	         list.add("ajaxx");
	     }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		             response.setCharacterEncoding("utf-8");
		             String  keyword  = request.getParameter("keyword");
		             List<String> res  = new ArrayList<String>();
		             
		             for (String string : list) {
		                 if (string.contains(keyword)){
		                     res.add(string);
		                 }
		             }
		             JSONArray jsonArray = JSONArray.fromObject(res);
		             System.out.println(jsonArray.toString());
		             response.setContentType("text/html");
		             response.getWriter().write(jsonArray.toString());
		     }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
