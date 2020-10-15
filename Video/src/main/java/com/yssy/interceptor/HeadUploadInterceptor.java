package com.yssy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HeadUploadInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String[] imgs = {".jpg",".png",".jpeg",".JPG",".PNG",".bmp",".webp"};
		if (request != null) {
			MultipartHttpServletRequest m = (MultipartHttpServletRequest) request;
			//要写自己input里面的文件名
			MultipartFile file = m.getFile("imgUrl");
			System.out.println(file);
			for (int i = 0; i < imgs.length; i++) {
				if (file.getOriginalFilename().contains(imgs[i])) {
					return true;
				}
			}
		}
		request.setAttribute("tag", "no");
		request.getRequestDispatcher("headChange.jsp").forward(request, response);
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
