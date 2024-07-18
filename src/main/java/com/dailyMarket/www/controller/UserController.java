package com.dailyMarket.www.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.UserService;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserVO;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final String uploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\product\\";
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "main")
	public String getUserMain()throws Exception{
		logger.info("GET USER MAIN");
		return "user/main";
	}
	
	@RequestMapping(value = "regist",method = RequestMethod.GET)
	public String getUserRegist()throws Exception{
		return "user/regist";
	}
	
	@RequestMapping(value = "regist",method = RequestMethod.POST)
	public String postUserRegist(UserVO userVO)throws Exception{
		userService.insertUserRegist(userVO);
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String getUserLogin()throws Exception{
		return "user/login";
	}
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String getUserLogin(UserVO userVO,RedirectAttributes rttr,HttpSession session)throws Exception{
		
		boolean login = userService.selectUserLogin(userVO);
		
		if(login) {
			session.setAttribute("userId",userVO.getUserId());
			return "redirect:/user/main";
		}else {
			rttr.addFlashAttribute("failMsg","아이디와 비밀번호를 확인해 주세요");
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping(value = "logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "/user/login";
	}
	
	
	@RequestMapping(value = "product/main",method =RequestMethod.GET)
	public String getProductMain(Model model , ProductVO productVO )throws Exception{
		productVO.setStartRow(0);
		List<ProductVO> list = userService.selectProductList(productVO);
		model.addAttribute("list",list);
		return "user/product/main";
	}
	
	@RequestMapping(value = "product/write",method =RequestMethod.GET)
	public String getProductWrite()throws Exception{
		return "user/product/write";
	}
	@RequestMapping(value = "product/write",method =RequestMethod.POST)
	public String postProudctWrite(ProductVO productVO)throws Exception{
		userService.insertUserProduct(productVO);
		return "redirect:/user/main";
	}
	@ResponseBody
	@RequestMapping(value = "product/fileUpload",method = RequestMethod.POST)
	public String postProductFileUpload(@RequestParam("uploadFiles")List<MultipartFile> multipartFile,HttpServletRequest request
										,HttpSession session)throws Exception{
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		Map<String,Object> map = null;
		
		String userId = (String)session.getAttribute("userId");
		
		if(multipartFile.size()>0 &&!multipartFile.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<multipartFile.size(); i++) {
				map =new HashMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(uploadPath+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("productOriginFileName",originFileName);
				map.put("productStoredFileName",storedFileName);
				map.put("productFileSize",multipartFile.get(i).getSize());
				map.put("productWriter", userId);
				
				list.add(map);
			}
		
			for(int i=0; i<list.size(); i++) {
				userService.insertUserFile(list.get(i));
			}
		}
				
		return "PRODUCT File Upload Success";
	}
	
	
	@RequestMapping(value = "product/detail",method = RequestMethod.GET)
	public String getUserProductDetail(@RequestParam("productNo")int productNo ,Model model)throws Exception{
		List<ProductVO> detail= userService.selectProductDetail(productNo);
		model.addAttribute("detail",detail);
		return "user/product/detail";
	}
	
	@RequestMapping(value = "mypage/main",method =RequestMethod.GET)
	public String getMypageMain()throws Exception{
		return "user/mypage/main";
	}
	
	
	@RequestMapping(value = "company/main" ,method = RequestMethod.GET)
	public String getcompanyMain(BusiVO busiVO,Model model)throws Exception{
		List<BusiVO> list = userService.selectBusiList(busiVO);
		model.addAttribute("list",list);
		
		return "user/company/main";
	}
	@RequestMapping(value = "company/detail" ,method = RequestMethod.GET)
	public String getcompanyDetail(@RequestParam("busiNo")int busiNo,Model model)throws Exception{
		BusiVO busiVO = userService.selectByBusiNo(busiNo);
		model.addAttribute("busiVO",busiVO);
		
		List<StoreFileVO> store = userService.selectStoreList(busiNo);
		model.addAttribute("store",store);
		
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		return "user/company/detail";
	}
	
	@RequestMapping(value = "company/product/main" ,method = RequestMethod.GET)
	public String getProductMain(@RequestParam("busiNo")int busiNo,Model model)throws Exception{
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		return "user/company/product/main";
	}
	
	@RequestMapping(value = "job/main" ,method = RequestMethod.GET)
	public String getjobMain()throws Exception{
		return "user/job/main";
	}
	@RequestMapping(value = "job/write" ,method = RequestMethod.GET)
	public String getjobWrite()throws Exception{
		return "user/job/write";
	}
	
	@RequestMapping(value = "job/detail" ,method = RequestMethod.GET)
	public String getjobDetail()throws Exception{
		return "user/job/detail";
	}
	
	
	
	@RequestMapping(value = "estate/main" ,method = RequestMethod.GET)
	public String getEstateMain()throws Exception{
		return "user/estate/main";
	}
	@RequestMapping(value = "estate/writeOne" ,method = RequestMethod.GET)
	public String getEstateWriteOne()throws Exception{
		return "user/estate/writeOne";
	}
	@RequestMapping(value = "estate/writeTwo" ,method = RequestMethod.GET)
	public String getEstateWriteTwo()throws Exception{
		return "user/estate/writeTwo";
	}
	@RequestMapping(value = "estate/writeThree" ,method = RequestMethod.GET)
	public String getEstateWriteThree()throws Exception{
		return "user/estate/writeThree";
	}
	
	@RequestMapping(value = "estate/detail" ,method = RequestMethod.GET)
	public String getEstateDetail()throws Exception{
		return "user/estate/detail";
	}
	
	
	
	@RequestMapping(value = "car/main" ,method = RequestMethod.GET)
	public String getCarMain()throws Exception{
		return "user/car/main";
	}
	@RequestMapping(value = "car/write" ,method = RequestMethod.GET)
	public String getCarWrite()throws Exception{
		return "user/car/write";
	}
	
	@RequestMapping(value = "car/detail" ,method = RequestMethod.GET)
	public String getCarDetail()throws Exception{
		return "user/car/detail";
	}
	
}
