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
import com.dailyMarket.www.vo.*;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/owner/*")
public class OwnerController {

	private static final Logger logger =LoggerFactory.getLogger(OwnerController.class);
	
	private static final String uploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\owner\\company\\";
	
	@Autowired
	private OwnerService ownerService;
	
	@RequestMapping(value = "main",method = RequestMethod.GET)
	public String getOwnerMain(HttpSession session,Model model)throws Exception{
		logger.info("GET OWNER MAIN");
		String userId = (String)session.getAttribute("userId");
		
		BusiVO busiVO = ownerService.selectBusiByWriter(userId);
		model.addAttribute("busiVO",busiVO);
		
		boolean menuExist = ownerService.selectMenuExist(busiVO.getBusiNo());
		boolean jobExsit= ownerService.selectJobExist(userId);
		
		model.addAttribute("menuExist",menuExist);
		model.addAttribute("jobExsit",jobExsit);
		
		System.out.println(menuExist);
		System.out.println(jobExsit);
		return "owner/main";
	}
	
	@RequestMapping(value = "logout",method = {RequestMethod.GET,RequestMethod.POST})
		public String postOwnerLogout(HttpSession session)throws Exception{
			session.invalidate();
			
		return "redirect:/user/main";
		
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
								,@RequestParam("busiType")String busiType
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
		busiVO.setBusiType(busiType);
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
	public String postStoreFileUpload(@RequestParam("storeFiles")List<MultipartFile> multipartFile,@RequestParam("busiNo")int busiNo,HttpSession session
									)throws Exception{
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
				
				map.put("busiNo", busiNo);
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
	public String getCompanyMenuRegist()throws Exception{
		
		return "owner/company/menu/regist";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "company/menu/regist",produces = "application/json;")
	public Map<String,String> postCompanyMenuRegist(@RequestParam("menuData")String menuData ,@RequestBody String message)throws Exception{
		JSONArray array=JSONArray.fromObject(menuData);
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
		resMap.put("msg","상품이 등록 되었습니다.");
		
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
	@RequestMapping(value = "company/menu/detail",method =  RequestMethod.GET)
	public String getCompanyMenuDetail(HttpSession session,Model model)throws Exception{

		String userId = (String)session.getAttribute("userId");
		BusiVO busiVO = ownerService.selectBusiByWriter(userId);
		model.addAttribute("busiVO",busiVO);
		
		List<MenuVO> menuList = ownerService.selectMenuList(busiVO.getBusiNo());
		model.addAttribute("list",menuList);
		
		return "owner/company/menu/detail";
	}
	@ResponseBody
	@RequestMapping(value = "company/menu/file/delete",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postMenuDelete(@RequestParam("fileNo")int fileNo)throws Exception{
		ownerService.updateMenuFile(fileNo);
		return "삭제되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "company/menu/allDelete",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postAllMenuDelete(@RequestParam("busiNo")int busiNo)throws Exception{
		ownerService.deleteAllMenu(busiNo);
		return "삭제되었습니다.";
	}
	
	
	@RequestMapping(value = "job/main",method = RequestMethod.GET)
	public String getOwnerJobMain()throws Exception{
		return "owner/job/main";
	}
	
	@RequestMapping(value = "job/regist",method = RequestMethod.GET)
	public String getOwnerWanted()throws Exception{
		
		return "owner/job/regist";
	}
	@ResponseBody
	@RequestMapping(value = "job/regist",method = RequestMethod.POST,produces = "application/text; charset=utf-8")
	public String postOwnerWanted(
								@RequestParam(value = "jobCompany" ,required = false)String jobCompany,
								@RequestParam(value = "jobTitle" ,required = false)String jobTitle,
								@RequestParam(value = "jobType" ,required = false)String jobType,
								@RequestParam(value = "jobMoney" ,required = false)String jobMoney,
								@RequestParam(value = "jobLoc" ,required = false)String jobLoc,
								@RequestParam(value = "jobLocDetail" ,required = false)String jobLocDetail,
								@RequestParam(value = "jobWorkDate" ,required = false)String jobWorkDate,
								@RequestParam(value = "jobWorkTime" ,required = false)String jobWorkTime,
								@RequestParam(value = "jobLocContent" ,required = false)String jobLocContent,
								@RequestParam(value = "jobContent" ,required = false)String jobContent,
								HttpSession session
								)throws Exception{
		
		JobVO jobVO = new JobVO();
		
		String userId = (String)session.getAttribute("userId");
		
		jobVO.setJobWriter(userId);
		jobVO.setJobCompany(jobCompany);
		jobVO.setJobTitle(jobTitle);
		jobVO.setJobType(jobType);
		jobVO.setJobMoney(jobMoney);
		jobVO.setJobLoc(jobLoc);
		jobVO.setJobLocDetail(jobLocDetail);
		jobVO.setJobWorkDate(jobWorkDate);
		jobVO.setJobWorkTime(jobWorkTime);
		jobVO.setJobLocContent(jobLocContent);
		jobVO.setJobContent(jobContent);
		
		ownerService.insertJob(jobVO);
		
		return "등록 되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/regist/file" ,method = RequestMethod.POST)
	public String jobRegistFile(@RequestParam("fileContent")List<MultipartFile> multipartFile,HttpSession session)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId = (String)session.getAttribute("userId");
		
		if(multipartFile.size()!=0&& !multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename(); 
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(uploadPath+"job\\"+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("writer", userId);
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartFile.get(i).getSize());
			
				list.add(map);
			}
			
			for(int i=0; i<list.size(); i++){
				ownerService.insertJobFile(list.get(i));
				
			}
			
		}
		return "job Regist File upload Success";
	}
	
	@RequestMapping(value = "job/detail" ,method = RequestMethod.GET)
	public String getJobDetail(HttpSession session ,Model model)throws Exception{
		String writer = (String)session.getAttribute("userId");
		JobVO jobVO = ownerService.selectJobByWriter(writer);
		model.addAttribute("jobVO",jobVO);
		
		List<JobFileVO> file = ownerService.selectJobFile(jobVO.getJobNo());
		model.addAttribute("file",file);
		
		return "owner/job/detail";
	}
	
	@RequestMapping(value = "job/list",method =  RequestMethod.GET)
	public String getJobDetailList(@RequestParam("jobNo")int jobNo,Model model)throws Exception{
		
		List<GetUserJobVO> list = ownerService.selectGetUserJobList(jobNo);
		model.addAttribute("list",list);
		
		return "owner/job/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/storedFileDelete" ,method = RequestMethod.POST ,produces = "application/text; charset=utf-8;")
	public String postFileUpdate(@RequestParam("fileNo")int fileNo)throws Exception{
		ownerService.updateJobFile(fileNo);
		
		return "삭제되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/update" ,method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public String postJObUpdate(
								@RequestParam(value = "jobNo")int jobNo,
					
								@RequestParam(value = "jobCompany" ,required = false)String jobCompany,
								@RequestParam(value = "jobTitle" ,required = false)String jobTitle,
								@RequestParam(value = "jobType" ,required = false)String jobType,
								@RequestParam(value = "jobMoney" ,required = false)String jobMoney,
								@RequestParam(value = "jobLoc" ,required = false)String jobLoc,
								@RequestParam(value = "jobLocDetail" ,required = false)String jobLocDetail,
								@RequestParam(value = "jobWorkDate" ,required = false)String jobWorkDate,
								@RequestParam(value = "jobWorkTime" ,required = false)String jobWorkTime,
								@RequestParam(value = "jobLocContent" ,required = false)String jobLocContent,
								@RequestParam(value = "jobContent" ,required = false)String jobContent
							)throws Exception{
		
		JobVO jobVO = new JobVO();
		
		jobVO.setJobNo(jobNo);
		
		jobVO.setJobCompany(jobCompany);
		jobVO.setJobTitle(jobTitle);
		jobVO.setJobType(jobType);
		jobVO.setJobMoney(jobMoney);
		jobVO.setJobLoc(jobLoc);
		jobVO.setJobLocDetail(jobLocDetail);
		jobVO.setJobWorkDate(jobWorkDate);
		jobVO.setJobWorkTime(jobWorkTime);
		jobVO.setJobLocContent(jobLocContent);
		jobVO.setJobContent(jobContent);
		
		ownerService.updateJob(jobVO);
		
		return "정보가 수정되었습니다.";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "job/delete",method =  RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postJobDelete(@RequestParam("jobNo")int jobNo)throws Exception{
		ownerService.deleteJob(jobNo);
		
		return "삭제 되었습니다.";
	}

	@ResponseBody
	@RequestMapping(value = "job/statusY",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postOwnerJobStatusY(@RequestParam("getUserJobNo")int getUserJobNo)throws Exception{
		ownerService.updateGetUserJobStatusY(getUserJobNo);
		return "합격 처리 되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "job/statusN",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postOwnerJobStatusN(@RequestParam("getUserJobNo")int getUserJobNo)throws Exception{
		ownerService.updateGetUserJobStatusN(getUserJobNo);
		return "불 합격 처리 되었습니다.";
	}
	
	
	@RequestMapping(value = "notice/write",method = RequestMethod.GET)
	public String getNoticeWirte(HttpSession session , Model model)throws Exception{
		String userId = (String)session.getAttribute("userId");
		BusiVO busiVO = ownerService.selectBusiByWriter(userId);
		model.addAttribute("busiVO",busiVO);
		
		return "owner/company/notice/write";
	}

	@ResponseBody
	@RequestMapping(value = "notice/write",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postNoticeWirte(@RequestParam(value = "title")String title,
									@RequestParam(value = "subTitle" ,required = false)String subTitle,
									@RequestParam(value = "content")String content,
									@RequestParam(value = "subContent" ,required = false)String subContent,
									@RequestParam(value = "busiNo")int busiNo,
									HttpSession session
								)throws Exception{
		
		String uesrId= (String)session.getAttribute("userId");
		
		BusiNoticeVO busiNoticeVO = new BusiNoticeVO();
		
		busiNoticeVO.setBusiNo(busiNo);
		busiNoticeVO.setWriter(uesrId);
		busiNoticeVO.setTitle(title);
		busiNoticeVO.setSubTitle(subTitle);
		busiNoticeVO.setContent(content);
		busiNoticeVO.setSubContent(subContent);
		
		ownerService.insertCompanyNotice(busiNoticeVO);
		
		return "작성되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "notice/write/file",method = RequestMethod.POST,produces = "application/text; charest=utf-8;")
	public String postNoticeWirteFile(@RequestParam("fileContent")List<MultipartFile> multipartFile,HttpSession session )throws Exception{
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =null;
	    String userId = (String)session.getAttribute("userId");
		
		if(multipartFile.size()!=0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetfile = new File(uploadPath+"notice\\"+storedFileName);
				multipartFile.get(i).transferTo(targetfile);
				
				map = new HashMap<String, Object>();
				
				map.put("writer",userId);
				map.put("originFileName",originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize",multipartFile.get(i).getSize());
				
				list.add(map);
			}
			
		}
		
		for(int i=0; i<list.size(); i++) {
			ownerService.insertCompanyNoticeFile(list.get(i));
		}
		
		return "업로드 완료";
	}
}
