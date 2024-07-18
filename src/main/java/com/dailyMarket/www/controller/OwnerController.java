package com.dailyMarket.www.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dailyMarket.www.service.OwnerService;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.StoreFileVO;
import org.json.simple.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/owner/*")
public class OwnerController {

	private static final Logger logger =LoggerFactory.getLogger(OwnerController.class);
	
	private static final String uploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\owner\\company\\";
	
	@Autowired
	private OwnerService ownerService;
	
	@RequestMapping(value = "main",method = RequestMethod.GET)
	public String getOwnerMain(HttpSession session,Model model)throws Exception{
		logger.info("GET OWNER MAIN");
		String userId = (String)session.getAttribute("userId");
		BusiVO busiVO = ownerService.selectBusiByWriter(userId);
		
		//추후 수정 필요  ( 메뉴 등록 과 상세페이지에 임시 사용 )
		session.setAttribute("busiNo", busiVO.getBusiNo());
		
		model.addAttribute("busiVO",busiVO);
		return "owner/main";
	}
	@RequestMapping(value = "company/detail",method = RequestMethod.GET)
	public String getCompanyDetail(HttpSession session,Model model)throws Exception{
		String userId = (String)session.getAttribute("userId");
		BusiVO busiVO = ownerService.selectBusiByWriter(userId);
		model.addAttribute("busiVO",busiVO);
		
		List<StoreFileVO> store = ownerService.selectStoreFile(busiVO.getBusiNo());
		model.addAttribute("store",store);
		
		return "owner/company/detail";
	}
	
	@RequestMapping(value = "company/regist",method = RequestMethod.GET)
	public String getOwnerRegist()throws Exception{
		return "owner/company/regist";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/busiDupChk",method = RequestMethod.POST,produces = "application/text; charset=UTF-8")
	public String getOwnerBusiChk(@RequestParam("busiNum")String busiNum)throws Exception{
		boolean result = ownerService.selectBusiNumDupChk(busiNum);
		if(result) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "company/regist",method = RequestMethod.POST,produces = "application/text; charset=UTF-8")
	public String postOwnerRegist(@RequestParam("busiNum")String busiNum
								,@RequestParam("ownerName")String ownerName
								,@RequestParam("busiTel")String busiTel
								,@RequestParam("busiName")String busiName
								,@RequestParam("busiType1")String busiType1
								,@RequestParam("busiType2")String busiType2
								,@RequestParam("busiType3")String busiType3
								,@RequestParam("storeTel")String storeTel
								,@RequestParam("storeAddr")String storeAddr
								,@RequestParam("storeAddrDetail")String storeAddrDetail
								,@RequestParam("agreeYn")String agreeYn
								,@RequestParam("homePage")String homePage
								,@RequestParam("introduce")String introduce
								,@RequestParam("title")String title
								,HttpSession session
								)throws Exception{
		String userId =(String)session.getAttribute("userId");
		
		BusiVO busiVO = new BusiVO();
		
		busiVO.setBusiNum(busiNum);
		busiVO.setWriter(userId);
		busiVO.setOwnerName(ownerName);
		busiVO.setBusiTel(busiTel);
		busiVO.setBusiName(busiName);
		busiVO.setBusiType1(busiType1);
		busiVO.setBusiType2(busiType2);
		busiVO.setBusiType3(busiType3);
		busiVO.setStoreTel(storeTel);
		busiVO.setStoreAddr(storeAddr);
		busiVO.setStoreAddrDetail(storeAddrDetail);
		busiVO.setAgreeYn(agreeYn);
		busiVO.setHomePage(homePage);
		busiVO.setIntroduce(introduce);
		busiVO.setTitle(title);
		
		ownerService.insertOwnerRegist(busiVO);
		return "업체 등록이 신청되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "company/update",method = RequestMethod.POST,produces = "application/text; charset=UTF-8")
	public String postOwnerCompanyUpdate(
								 @RequestParam("busiNo")int busiNo
								,@RequestParam("ownerName")String ownerName
								,@RequestParam("busiTel")String busiTel
								,@RequestParam("busiName")String busiName
								,@RequestParam("busiType1")String busiType1
								,@RequestParam("busiType2")String busiType2
								,@RequestParam("busiType3")String busiType3
								,@RequestParam("storeTel")String storeTel
								,@RequestParam("storeAddr")String storeAddr
								,@RequestParam("storeAddrDetail")String storeAddrDetail
								,@RequestParam("agreeYn")String agreeYn
								,@RequestParam("homePage")String homePage
								,@RequestParam("introduce")String introduce
								,@RequestParam("title")String title
								)throws Exception{
		
		BusiVO busiVO = new BusiVO();
		
		busiVO.setBusiNo(busiNo);
		busiVO.setOwnerName(ownerName);
		busiVO.setBusiTel(busiTel);
		busiVO.setBusiName(busiName);
		busiVO.setBusiType1(busiType1);
		busiVO.setBusiType2(busiType2);
		busiVO.setBusiType3(busiType3);
		busiVO.setStoreTel(storeTel);
		busiVO.setStoreAddr(storeAddr);
		busiVO.setStoreAddrDetail(storeAddrDetail);
		busiVO.setAgreeYn(agreeYn);
		busiVO.setHomePage(homePage);
		busiVO.setIntroduce(introduce);
		busiVO.setTitle(title);
		
		ownerService.updateBusi(busiVO);
		return "업체 정보가 수정되었습니다.";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "company/busiFileUpload",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postBusiFile(@RequestParam("uploadFiles")List<MultipartFile>multipartFile,HttpSession session	)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		Map<String,Object> map = null;
		
		String userId = (String)session.getAttribute("userId");
		
		if(multipartFile.size()>0&&!multipartFile.get(0).getOriginalFilename().equals("")) {
			
				map = new HashedMap<String, Object>();
				
				String busiOriginFileName = multipartFile.get(0).getOriginalFilename();
				String busiExtendFileName = busiOriginFileName.substring(busiOriginFileName.lastIndexOf("."));
				String busiStoredFileName = UUID.randomUUID()+busiExtendFileName;
				
				File targetFile = new File(uploadPath+busiStoredFileName);
				multipartFile.get(0).transferTo(targetFile);
				
				map.put("busiOriginFileName", busiOriginFileName);
				map.put("busiStoredFileName", busiStoredFileName);
				map.put("busiFileSize",multipartFile.get(0).getSize());
				map.put("writer",userId);
				
				list.add(map);
				ownerService.insertBusiFile(list.get(0));
		}
		
		return "파일이 수정 되었습니다."; 
	}
	
	@ResponseBody
	@RequestMapping(value = "company/storeFileUpload", method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postStoreFileUpload(@RequestParam("storeFiles")List<MultipartFile> multipartFile,HttpSession session)throws Exception{
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId = (String)session.getAttribute("userId");
		
		if(multipartFile.size()>0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashedMap<String, Object>();
				
				String originFileName=multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring( originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File file = new File(uploadPath+storedFileName);
				multipartFile.get(i).transferTo(file);
				
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartFile.get(i).getSize());
				map.put("writer", userId);
				
				list.add(map);
				
			}
			
			for(int i=0; i<list.size(); i++) {
				ownerService.insertStoreFile(list.get(i));
			}
		}
		
		return "업체 사진이 등록되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/busiFileDelete",method = RequestMethod.POST)
	public String getBusiFileDelete(@RequestParam("busiFileNo")int busiFileNo)throws Exception{
		ownerService.deleteBusiFile(busiFileNo);
		return "BUSI File DELETE";
	}
	@ResponseBody
	@RequestMapping(value = "company/storeFileDelete",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String getStoreFileDelete(@RequestParam("fileNo")int fileNo)throws Exception{
		ownerService.deleteStoreFileByFileNo(fileNo);

		return "삭제되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "company/delete", method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String getBusiDelete(@RequestParam("busiNo")int busiNo,@RequestParam("busiFileNo")int busiFileNo)throws Exception{
		ownerService.deleteBusi(busiNo);
		// 해당 파일도 동시 삭제
		ownerService.deleteBusiFile(busiFileNo);
		// 업체 사진 파일도 삭제
		ownerService.deleteStoreFile(busiNo);
		return "입점 신청이 취소되었습니다.";
	}
	

	@RequestMapping(value = "company/menu/regist",method =  RequestMethod.GET)
	public String getCompanyMenuRegist(Model model,HttpSession session)throws Exception{

		//추후 수정 필요 -!! 세션에 busiNo
		int busiNo =(int)session.getAttribute("busiNo");
		
		List<MenuVO> menuList = ownerService.selectMenuList(busiNo);
		model.addAttribute("list",menuList);
		
		return "owner/company/menu/regist";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "company/menu/regist",produces = "application/json;")
	public Map<String,String> postCompanyMenuRegist(@RequestParam("menuData")String menuData ,@RequestBody String message)throws Exception{
		JSONArray array = JSONArray.fromObject(menuData);
		
		for(int i=0; i<array.size(); i++) {
			JSONObject obj =(JSONObject)array.get(i);
			
			Map<String,Object> map = new HashedMap<String, Object>();
				
				map.put("name", obj.get("name"));
	            map.put("price", obj.get("price"));
	            map.put("count",obj.get("count"));
	            map.put("content",obj.get("content"));
	            map.put("deleveryYn",obj.get("deleveryYn"));
	            map.put("deleveryPrice", obj.get("deleveryPrice"));
	            
	            ownerService.insertMenu(map);
		}
		
		HashMap<String,String> resMap = new HashMap<String, String>();
		resMap.put("msg","메뉴가 등록 되었습니다.");
		
		return resMap;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "company/menu/registFile",method =  RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postCompanyMenuRegistFile(@RequestParam("menuContent")List<MultipartFile>multipartFile,HttpSession session)throws Exception{
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;

		String userId= (String)session.getAttribute("userId");
		
		
		//메뉴 카운터 
		int count = ownerService.menuFileNoCnt();
		
		if(multipartFile.get(0).getSize()>0&&!multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashedMap<String, Object>();
	
				String originFileName=multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring( originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File file = new File(uploadPath+"menu\\"+storedFileName);
				multipartFile.get(i).transferTo(file);
				
				//메뉴 번호
				map.put("menuNo",count+i);
				
				map.put("originFileName",originFileName);
				map.put("storedFileName",storedFileName);
				map.put("fileSize",multipartFile.get(i).getSize());
				map.put("writer", userId);
				
				list.add(map);
			}
			
			for(int i=0; i<list.size(); i++) {
				ownerService.insertMenuFile(list.get(i));
			}
		}
		
		return "파일이 업로드 되었습니다.";
	}
	
	
	
	@RequestMapping(value = "mypage/main",method = RequestMethod.GET)
	public String getOwnerMypage()throws Exception{
		return "owner/mypage/main";
	}
	
	@RequestMapping(value = "job/main",method = RequestMethod.GET)
	public String getOwnerWanted()throws Exception{
		return "owner/job/main";
	}
}
