package com.github.list.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.bookmark.model.service.BookmarkService;
import com.github.bookmark.model.vo.Bookmark;
import com.github.list.model.service.ListService;
import com.github.list.model.vo.List;
import com.github.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class ListController {

	@Autowired
	private ListService service;
	@Autowired
	private BookmarkService bService;
	
	@RequestMapping(value="gotoList.do")
	public String gotoList(@SessionAttribute(required=false) User loginUser, Model model) {
		ArrayList<List> list = service.selectMyList(loginUser.getUserNo());
				
		model.addAttribute("list", list);
		return "list/gotoList";
	}
	
	@RequestMapping(value="gotoNewList.do")
	public String gotoNewList() {
		return "list/gotoNewList";
	}
	
	@RequestMapping(value="/insertNewList.do")
	public String insertNewList(@SessionAttribute(required=false) User loginUser, List list, String[] openList, MultipartFile[] upPic, String keyword, HttpServletRequest request) {
		
		list.setUserNo(loginUser.getUserNo());
		
		if(openList!=null&&openList[0].equals("open")) {
			list.setListOpen(1);
		}
		String[] keywords = keyword.split(",");
		
		if(!upPic[0].isEmpty()) {
			// 올린프사가 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/list/");
			
			MultipartFile file = upPic[0];
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
			String extention = filename.substring(filename.lastIndexOf("."));
			
			String filepath = null;
			int count = 0;
			
			while(true) {
				if(count==0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				// 중복검사
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
					// 파일이 존재 안해야 해당 파일명을 사용할 수 있다.
				}
				count++;
			}
			
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos =new BufferedOutputStream(fos);
				
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			list.setListProfile(filepath);
			
		}
		int result = service.insertNewList(list, keywords);
		
		return "redirect:/gotoList.do";
	}
	
	@RequestMapping(value="/viewList.do")
	public String viewList(int listNo,  Model model) {
		List list = service.selectOneList(listNo);
		ArrayList<Bookmark> bList = bService.selectBList(listNo);
		
		model.addAttribute("list", list);
		model.addAttribute("bList", bList);
		return "list/viewList";
	}
	
	@ResponseBody
	@RequestMapping(value="/getListKeyword.do", produces="application/json; charset=utf-8")
	public String getListKeyword(int listNo) {
		ArrayList<String> keyword = service.selectListKeyword(listNo);
		
		return new Gson().toJson(keyword);
	}
}
