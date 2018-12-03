package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Myfilter implements Filter {
	/*
	 * 服务器启动时执行init（）
	 */
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("我被初始化了");
	}
	/*
	 * 过滤器的实际操作
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("我被执行了");
		//设置编码格式
		String name ="";
		name=(String) request.getAttribute(name);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(name!=null) {
		//把请求返回过滤链（放行）
		chain.doFilter(request, response);
		System.out.println("已登录!");
		}else {
			System.out.println("未登录!");
		}
	}
	/*
	 * 服务器关闭时执行destroy（）
	 * 释放过滤器占用的资源
	 */
	@Override
	public void destroy() {
		System.out.println("我被销毁了");
	}
}
