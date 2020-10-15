package com.yssy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.yssy.model.User;
import com.yssy.service.UserService;
import com.yssy.util.MD5Utils;

@Controller
public class UserController {

	@Autowired
	UserService service;

	// 用户登录
	@ResponseBody
	@RequestMapping("userLogin")
	public String userLogin(String email, String password, HttpServletRequest req, HttpServletResponse resp) {
		User user = service.selectByName(email, password);

		// 获取上一个请求的URI
		/*
		 * String uri=req.getHeader("referer");
		 * uri=uri.substring(uri.lastIndexOf("/")+1);
		 * 
		 * if (uri.equals("") || uri.equals("adminExit") ||
		 * uri.equals("userExit?tag=2")) { uri = "index.jsp"; } return "redirect:"+uri;
		 */
		if (user != null) {
			req.getSession().setAttribute("USER", user);
			return JSON.toJSONString("success");
		}
		return JSON.toJSONString("false");
	}

	// 用户注册
	@ResponseBody
	@RequestMapping("userRegister")
	public String userRegister(User user, String flag, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		// 如果flag等于1判断邮箱是否被注册
		if (flag.equals("1")) {
			String boolEmail = service.isEmail(user.getEmail()) ? "yes" : "no";
			if (boolEmail.equals("no")) {
				boolEmail = user.getEmail().contains("@") ? "no" : "error";
			}
			resp.getWriter().write(boolEmail);
			return null;
		} else {
			service.add(user);
			return JSON.toJSONString("success");
		}

	}

	@RequestMapping("userExit")
	public String userExit( HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		return "redirect:index.jsp";
	}

	// 通过id获取用户信息
	@RequestMapping("getId")
	public String getId(String id, HttpServletRequest req, HttpServletResponse resp) {
		User user = service.selectById(Integer.valueOf(id));
		String address = user.getAddress();
		if (address != null) {
			String[] strings = address.split("-");
			req.setAttribute("address", strings);
		}

		req.setAttribute("user", service.selectById(Integer.valueOf(id)));

		return "userUpdate";
	}

	// 用户信息更新
	@RequestMapping("userUpdate")
	public String userUpdate(User user, String prov, String city, HttpServletRequest req, HttpServletResponse resp) {
		if (prov != null && city != null) {
			String address = prov + "-" + city;
			user.setAddress(address);
		}
		service.update(user);
		User user2 = service.selectById(user.getUserId());
		req.getSession().setAttribute("USER", user2);
		return "userShow";
	}

	// 检查密码是否输入正确
	@RequestMapping("checkPassword")
	public void checkPassword(String userId, String password, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		User user = service.selectById(Integer.valueOf(userId));
		// 要返回的值
		String boolPassword = user.getPassword().equals(MD5Utils.md5(password)) == true ? "yes" : "no";

		// 将返回值传递给前台页面
		resp.getWriter().write(boolPassword);
	}

	// 头像上传
	@RequestMapping("headUpload")
	public String headUpLload(MultipartFile imgUrl, int userId, HttpServletRequest req, HttpServletResponse resp) {
		if (imgUrl.isEmpty()) {
			System.out.println("上传文件为空");
		}
		// 获取项目名的全路径
		String projectPath = req.getServletContext().getRealPath("");
		// 获取文件名称
		String fileName = imgUrl.getOriginalFilename();
		// 拼接完整文件路径
		String realPath = projectPath + "imgs\\" + fileName;
		// 生成上传路径对象
		File upload = new File(projectPath + "imgs\\");
		try {
			// 如果路径不存在，就创建路径
			if (!upload.exists()) {
				upload.mkdirs();
			}
			// 准备输入流
			InputStream is = imgUrl.getInputStream();
			// 准备输出流
			FileOutputStream os = new FileOutputStream(
					"D:\\develop\\eclipse\\eclipse\\WorkSpace\\Video\\src\\main\\webapp\\imgs\\" + fileName);
			IOUtils.copy(is, os);
			is.close();
			os.close();
			// 开始文件上传
			imgUrl.transferTo(new File(realPath));

		} catch (Exception e) {
			System.out.println(e);
		}
		User user = new User();
		user.setUserId(userId);
		user.setImgUrl("imgs/" + imgUrl.getOriginalFilename());
		service.update(user);
		User user2 = service.selectById(userId);
		req.getSession().setAttribute("USER", user2);
		return "userShow";
	}
}
