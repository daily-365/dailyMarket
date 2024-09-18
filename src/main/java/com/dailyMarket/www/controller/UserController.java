package com.dailyMarket.www.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.UserService;
import com.dailyMarket.www.utils.PageMaker;
import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiNoticeFileVO;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiReviewFileVO;
import com.dailyMarket.www.vo.BusiReviewVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.EventVO;
import com.dailyMarket.www.vo.GetUserJobVO;
import com.dailyMarket.www.vo.InquiryVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.NoticeFileVO;
import com.dailyMarket.www.vo.NoticeVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserAccountVO;
import com.dailyMarket.www.vo.UserJobVO;
import com.dailyMarket.www.vo.UserProfileFileVO;
import com.dailyMarket.www.vo.UserTradeVO;
import com.dailyMarket.www.vo.UserVO;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private static final String productUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\product\\";
	private static final String estateUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\estate\\";
	private static final String carUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\car\\";
	private static final String companyUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\company\\";
	private static final String userJobUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\job\\";
	private static final String userProfileUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\profile\\";
	private static final String userInquiryUploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\inquiry\\";
	
	private static final String uploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\admin\\";
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
			session.setAttribute("userNo",userVO.getUserNo());
			session.setAttribute("userNick",userVO.getUserNick());
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
	public String getProductMain(Model model , ProductVO productVO 	)throws Exception{
		
		
		List<ProductVO> list = userService.selectProductList(productVO);
		model.addAttribute("list",list);
			
		return "user/product/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "product/main/addlist",method = RequestMethod.POST)
	public List<ProductVO> proudctMainAddList(Model model
							,@RequestParam(value="endRow" )int endRow
							,@RequestParam(value="orderType" )String orderType
							, ProductVO productVO )throws Exception{
		
		productVO.setEndRow(endRow);
		productVO.setOrderType(orderType);
		List<ProductVO> moreList = userService.selectProductList(productVO);
		
		return moreList;
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
				
				File targetFile = new File(productUploadPath +storedFileName);
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
		ProductVO detail= userService.selectProductDetail(productNo);
		model.addAttribute("detail",detail);
		
		model.addAttribute("product",userService.selectProductByNo(productNo));
		
		List<ProductFileVO> productFile = userService.selectProductFile(productNo);
		model.addAttribute("productFile", productFile);
		
		//조회수
		userService.updateProductHitCnt(productNo);
		
		return "user/product/detail";
	}
	
	@RequestMapping(value = "company/main" ,method = RequestMethod.GET)
	public String getcompanyMain(BusiVO busiVO,Model model,HttpSession session)throws Exception{
		List<BusiVO> list = userService.selectBusiList(busiVO);
		model.addAttribute("list",list);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewList();
		model.addAttribute("review", review);
		
		
		return "user/company/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/main/list",method = RequestMethod.POST)
	public List<BusiVO> postCompanyMain(@RequestParam("busiType")String busiType)throws Exception{
		
		BusiVO busiVO = new BusiVO();
		busiVO.setBusiType(busiType);
		
		List<BusiVO> list = userService.selectBusiList(busiVO);
		
		return list;
	}
	
	@RequestMapping(value = "company/detail" ,method = RequestMethod.GET)
	public String getcompanyDetail(@RequestParam("busiNo")int busiNo,HttpSession session
									,Model model)throws Exception{
		
		BusiVO busiVO = userService.selectByBusiNo(busiNo);
		model.addAttribute("busiVO",busiVO);
		
		List<StoreFileVO> store = userService.selectStoreList(busiNo);
		model.addAttribute("store",store);
		
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		BusiNoticeVO busiNoticeVO =new BusiNoticeVO();
		busiNoticeVO.setEndRow(4);
		busiNoticeVO.setBusiNo(busiNo);
		
		List<BusiNoticeVO> notice = userService.selectCompanyNoticeList(busiNoticeVO);
		model.addAttribute("notice",notice);
		
		BusiReviewVO busiReviewVO = new BusiReviewVO();
		busiReviewVO.setEndRow(3);
		busiReviewVO.setBusiNo(busiNo);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewByBusiNo(busiReviewVO);
		model.addAttribute("review",review);
		
		
		//조회수
		userService.updateBusiHitCnt(busiNo);
		
		return "user/company/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/detail/reviewMore" ,method = RequestMethod.POST)
	public List<BusiReviewVO> postReviewMore(@RequestParam("endRow")int endRow,@RequestParam("busiNo")int busiNo)throws Exception{
		
		BusiReviewVO busiReviewVO = new BusiReviewVO();
		busiReviewVO.setEndRow(endRow);
		busiReviewVO.setBusiNo(busiNo);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewByBusiNo(busiReviewVO);
		
		return review;
	}
	@ResponseBody
	@RequestMapping(value = "company/detail/noticeMore" ,method = RequestMethod.POST)
	public List<BusiNoticeVO> postNoticeMore(@RequestParam("endRow")int endRow,@RequestParam("busiNo")int busiNo)throws Exception{
		
		BusiNoticeVO busiNoticeVO = new BusiNoticeVO();
		busiNoticeVO.setEndRow(endRow);
		busiNoticeVO.setBusiNo(busiNo);
		
		List<BusiNoticeVO> notice = userService.selectCompanyNoticeList(busiNoticeVO);
		
		return notice;
	}
	

	@RequestMapping(value = "company/product/main" ,method = RequestMethod.GET)
	public String getProductMain(@RequestParam("busiNo")int busiNo,Model model)throws Exception{
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		BusiReviewVO busiReviewVO = new BusiReviewVO();
		busiReviewVO.setEndRow(3);
		busiReviewVO.setBusiNo(busiNo);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewByBusiNo(busiReviewVO);
		model.addAttribute("review",review);
		
		return "user/company/product/main";
	}
	
	@RequestMapping(value = "company/notice/main" ,method = RequestMethod.GET)
	public String getCompanyNoticeMain(Model model,@RequestParam("busiNo")int busiNo)throws Exception{
		
		BusiNoticeVO busiNoticeVO =new BusiNoticeVO();
		busiNoticeVO.setEndRow(3);
		busiNoticeVO.setBusiNo(busiNo);
		
		List<BusiNoticeVO> noticeList = userService.selectCompanyNoticeList(busiNoticeVO);
		model.addAttribute("noticeList",noticeList);
		
		
		return "user/company/notice/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/notice/main" ,method = RequestMethod.POST)
	public List<BusiNoticeVO> postCompanyNoticeMain(Model model,@RequestParam("busiNo")int busiNo
										,@RequestParam("endRow")int endRow
										)throws Exception{
		
		BusiNoticeVO busiNoticeVO =new BusiNoticeVO();
		busiNoticeVO.setEndRow(endRow);
		busiNoticeVO.setBusiNo(busiNo);
		
		List<BusiNoticeVO> noticeList = userService.selectCompanyNoticeList(busiNoticeVO);
		
		return noticeList;
	}
	
	
	@RequestMapping(value = "company/notice/detail" ,method = RequestMethod.GET)
	public String getCompanyNoticeDetail(@RequestParam("busiNoticeNo")int busiNoticeNo,//추후 수정
																	@RequestParam("busiNo")int busiNo, Model model)throws Exception{
		BusiNoticeVO busiNoticeVO = userService.selectCompanyNoticeByNO(busiNoticeNo);
		List<BusiNoticeFileVO> file = userService.selectCompanyNoticeFileByNo(busiNoticeNo);
		
		model.addAttribute("vo",busiNoticeVO);
		model.addAttribute("file",file);
		
		//조회수
		userService.updateNoticeHitCnt(busiNoticeNo);
		
		return "user/company/notice/detail";
	}
	
	@RequestMapping(value = "company/review/write",method = RequestMethod.GET)
	public String getCompanyReviewWrite()throws Exception{
		return "user/company/review/write";
	}
	
	@RequestMapping(value = "company/review/write",method = RequestMethod.POST)
	public void postCompanyReviewWrite(BusiReviewVO busiReviewVO)throws Exception{
		userService.insertCompanyReview(busiReviewVO);
	}
	
	@RequestMapping(value = "company/review/main",method = RequestMethod.GET)
	public String getCompanyReviewMain(@RequestParam("busiNo")int busiNo,
										Model model )throws Exception{
		
		BusiReviewVO busiReviewVO = new BusiReviewVO();
		
		busiReviewVO.setBusiNo(busiNo);
		busiReviewVO.setEndRow(3);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewByBusiNo(busiReviewVO);
		model.addAttribute("review",review);
		
		
		return "user/company/review/main";
	}
	@ResponseBody
	@RequestMapping(value = "company/review/main",method = RequestMethod.POST)
	public List<BusiReviewVO> postCompanyReviewMore(Model model,@RequestParam("busiNo")int busiNo
								,@RequestParam("endRow")int endRow)throws Exception{
		
		BusiReviewVO busiReviewVO = new BusiReviewVO();
		
		busiReviewVO.setBusiNo(busiNo);
		busiReviewVO.setEndRow(endRow);
		
		List<BusiReviewVO> list = userService.selectCompanyReviewByBusiNo(busiReviewVO);
		
		return list;
	}
	
	@RequestMapping(value = "company/review/detail",method = RequestMethod.GET)
	public String getReviewDetail(@RequestParam("busiReviewNo")int busiReviewNo,Model model)throws Exception{
		
		BusiReviewVO vo = userService.selectReviewByReviewNo(busiReviewNo);
		model.addAttribute("vo",vo);
		
		List<BusiReviewFileVO> file = userService.selectCompanyReviewFileByBusiViewNo(busiReviewNo);
		model.addAttribute("file",file);
		
		//조회수
		userService.updateReviewHitCnt(busiReviewNo);
		return "user/company/review/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "company/review/write/file",method = RequestMethod.POST)
	public String postCompanyReviewWriteFile(@RequestParam("fileContent")List<MultipartFile> mutipartFile ,HttpSession session)throws Exception{
		
		List<Map<String, Object>> list =new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId =(String)session.getAttribute("userId");
		
		if(mutipartFile.get(0).getSize()!=0 &&! mutipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<mutipartFile.size(); i++) {
				
				map = new HashMap<String, Object>();
				
				String originFileName = mutipartFile.get(i).getOriginalFilename();
				String extendFileName =originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(companyUploadPath+"review//"+storedFileName);
				mutipartFile.get(i).transferTo(targetFile);
				
				map.put("writer", userId);
				map.put("originFileName", originFileName);
				map.put("extendFileName", extendFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", mutipartFile.get(i).getSize());
				
				list.add(map);
			}
		}
		
		for(int i=0; i<list.size();i++) {
			userService.insertCompanyReviewFile(list.get(i));
		}
		
		return "Upload Success";
	}
	
	
	@RequestMapping(value = "estate/main" ,method = RequestMethod.GET)
	public String getEstateMain(Model model ,EstateVO estateVO, EstateFileVO estateFileVO,HttpSession session)throws Exception{
		
		estateVO.setEndRow(8);
		List<EstateVO> hitEstate= userService.selectEstateList(estateVO);
		model.addAttribute("hitEstate",hitEstate);
		
		String userId = (String)session.getAttribute("userId");
		UserVO userVO = userService.selectUserByUserId(userId);
		estateVO.setEsLoc(userVO.getUserAddr1().substring(0,3));
		
		List<EstateVO> locEstate= userService.selectEstateList(estateVO);
		model.addAttribute("locEstate",locEstate);
		
		return "user/estate/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "estate/hit" ,method = RequestMethod.POST)
	public List<EstateVO> postEstateHit(Model model ,EstateVO estateVO, EstateFileVO estateFileVO
										,@RequestParam(value="endRow" ,required = false ,defaultValue = "8")int endRow)throws Exception{
		estateVO.setEndRow(endRow);
		List<EstateVO> hitEstate= userService.selectEstateList(estateVO);
		
		return hitEstate;
	}
	@ResponseBody
	@RequestMapping(value = "estate/loc" ,method = RequestMethod.POST)
	public List<EstateVO> postEstateLoc(Model model ,EstateVO estateVO, EstateFileVO estateFileVO
										,@RequestParam(value="endRow" ,required = false ,defaultValue = "8")int endRow
										,@RequestParam(value="esLoc",required = false )String esLoc)throws Exception{
		estateVO.setEndRow(endRow);
		estateVO.setEsLoc(esLoc);
		List<EstateVO> locEstate= userService.selectEstateList(estateVO);
		
		return locEstate;
	}
	@RequestMapping(value = "estate/writeOne" ,method = RequestMethod.GET)
	public String getEstateWriteOne(Model model,HttpSession session)throws Exception{
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("userVO",userService.selectUserByUserId(userId));
		
		return "user/estate/writeOne";
	
	}
	@RequestMapping(value = "estate/writeTwo",method = RequestMethod.GET)
	public String getEstateWriteTow(Model model,HttpSession session)throws Exception{
		
		return "user/estate/writeTwo";
	}
	@RequestMapping(value = "estate/writeThree",method = RequestMethod.GET)
	public String getEstateWriteThree(Model model,HttpSession session)throws Exception{
		
		return "user/estate/writeThree";
	}
	@ResponseBody
	@RequestMapping(value = "estate/writeOne" ,method = RequestMethod.POST, produces="application/text;charset=utf-8")
	public String postEstateWriteOne(@RequestParam("esHumType")String esHumType
									,@RequestParam("esLoc")String esLoc , @RequestParam("esLocDetail")String esLocDetail
									,@RequestParam("esLocContent")String esLocContent,@RequestParam("esRoomType")String esRoomType
									,HttpSession session
			)throws Exception{
		
		String userId = (String)session.getAttribute("userId");
		
		EstateVO estateVO = new EstateVO();
		estateVO.setEsWriter(userId);
		estateVO.setEsHumType(esHumType);
		estateVO.setEsLoc(esLoc);
		estateVO.setEsLocDetail(esLocDetail);
		estateVO.setEsLocContent(esLocContent);
		estateVO.setEsRoomType(esRoomType);
		
		userService.insertEstateOne(estateVO);
		
		return "저장되었습니다.";
		
	}
	@RequestMapping(value = "estate/writeOne/uploadFile" ,method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String postEstateWriteOneUploadFile(@RequestParam("fileContent")List<MultipartFile> multipartFile,
												HttpServletRequest request , HttpSession session)throws Exception{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
		
		String uesrId= (String)session.getAttribute("userId");
		
		if(multipartFile.size()!=0&&!multipartFile.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<multipartFile.size(); i++) {
				map= new HashedMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(estateUploadPath+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("writer",uesrId);
				map.put("originFileName",originFileName);
				map.put("storedFileName",storedFileName);
				map.put("fileSize",multipartFile.get(i).getSize());
				
				list.add(map);
				
			}
			for(int i=0; i<list.size(); i++) {
				userService.insertEstateFile(list.get(i));
			}
		}
		
		return "저장되었습니다.";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "estate/writeTwo" ,method = RequestMethod.POST ,produces="application/text;charset=utf-8")
	public String postEstateWriteTwo(HttpSession session
									,@RequestParam(required = false,value="esTradeType")String esTradeType ,@RequestParam(required = false,value="esPrice")String esPrice
									,@RequestParam(required = false,value="esPosiType")String esPosiType ,@RequestParam(required = false,value="esSize1")String esSize1
									,@RequestParam(required = false,value="esSize2")String esSize2,@RequestParam(required = false,value="esOption1")String esOption1 
									,@RequestParam(required = false,value="esOption2")String esOption2,@RequestParam(required = false,value="esOption3")String esOption3
									,@RequestParam(required = false,value="esCostYn")String esCostYn,@RequestParam(required = false,value="esCost")String esCost
									,@RequestParam(required = false,value="esCostChk")String esCostChk,@RequestParam(required = false,value="esSeperCostChk")String esSeperCostChk
									,@RequestParam(required = false,value="esCostContent")String esCostContent
								)throws Exception{
		
		EstateVO estateVO = new EstateVO();
		
		String userId = (String)session.getAttribute("userId");
		estateVO.setEsWriter(userId);
		
		estateVO.setEsTradeType(esTradeType);
		estateVO.setEsPrice(esPrice);
		estateVO.setEsPosiType(esPosiType);
		estateVO.setEsSize1(Double.parseDouble(esSize1));
		estateVO.setEsSize2(Double.parseDouble(esSize2));
		estateVO.setEsOption1(Integer.parseInt(esOption1));
		estateVO.setEsOption2(Integer.parseInt(esOption2));
		estateVO.setEsOption3(Integer.parseInt(esOption3));
		estateVO.setEsCostYn(esCostYn);
		if(esCostYn.equals("Y")) {
			estateVO.setEsCost(Integer.parseInt(esCost));
			estateVO.setEsCostChk(esCostChk);
			estateVO.setEsCostContent(esCostContent);
		}
		estateVO.setEsSeperCostChk(esSeperCostChk);
		
		userService.updateEstateTwo(estateVO);
		
		return "저장 되었습니다.";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "estate/writeThree" ,method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String getEstateDetail(HttpSession session
								,@RequestParam(value="esLoanYn",required = false)String esLoanYn ,@RequestParam(value="esAnimalYn",required = false)String esAnimalYn   
								,@RequestParam(value="esParkingYn",required = false)String esParkingYn ,@RequestParam(value="esMoveYn",required = false)String esMoveYn   
								,@RequestParam(value="esMoveDate",required = false)String esMoveDate ,@RequestParam(value="esFacility",required = false)String esFacility   
								,@RequestParam(value="esAdvantage",required = false)String esAdvantage ,@RequestParam(value="esHouseIntro",required = false)String esHouseIntro  
								)throws Exception{
		
		EstateVO estateVO = new EstateVO();
		
		String userId = (String)session.getAttribute("userId");
		estateVO.setEsWriter(userId);
		
		estateVO.setEsLoanYn(esLoanYn);
		estateVO.setEsAnimalYn(esAnimalYn);
		estateVO.setEsParkingYn(esParkingYn);
		estateVO.setEsMoveYn(esMoveYn);
		estateVO.setEsMoveDate(esMoveDate);
		estateVO.setEsFacility(esFacility);
		estateVO.setEsAdvantage(esAdvantage);
		estateVO.setEsHouseIntro(esHouseIntro);
		
		userService.updateEstateThree(estateVO);
		
		return "작성이 완료되었습니다. 메인 화면으로 이동합니다.";
	}
	
	
	@RequestMapping(value = "estate/detail" ,method = RequestMethod.GET)
	public String getestatedetail(Model model,@RequestParam("esNo")int esNo)throws Exception{
		EstateVO estate = userService.selectEstateDetail(esNo);
		model.addAttribute("estate",estate);
		
		List<EstateFileVO> file = userService.selectEstateFileDetail(esNo);
		model.addAttribute("file",file);
		
		model.addAttribute("profileFile",userService.selectUserProfileYn(estate.getEsWriter()));
		
		//조회수
		userService.updateEstateHitCnt(esNo);
		
		return "user/estate/detail";
	}
	
	
	@RequestMapping(value = "car/main" ,method = RequestMethod.GET)
	public String getCarMain(Model model,CarVO carVO,CarFileVO carFileVO,HttpSession session)throws Exception{
		
		carVO.setEndRow(8);
		List<CarVO> hitCar = userService.selectCarList(carVO);
		model.addAttribute("hitCar",hitCar);

		String userId = (String)session.getAttribute("userId");
		UserVO userVO = userService.selectUserByUserId(userId);
		
		carVO.setCarLoc(userVO.getUserAddr1().substring(0,3));
		List<CarVO> locCar = userService.selectCarList(carVO);
		model.addAttribute("locCar",locCar);
		
		return "user/car/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "car/main/hit" ,method =  RequestMethod.POST)
	public List<CarVO> postCarHitList(@RequestParam("endRow")int endRow,CarVO carVO)throws Exception{
		carVO.setEndRow(endRow);
		List<CarVO> hitList = userService.selectCarList(carVO);
		return hitList;
	}
	@ResponseBody
	@RequestMapping(value = "car/main/loc" ,method =  RequestMethod.POST)
	public List<CarVO> postCarLocList(@RequestParam("endRow")int endRow,CarVO carVO,@RequestParam("carLoc")String carLoc)throws Exception{
		carVO.setEndRow(endRow);
		carVO.setCarLoc(carLoc);
		List<CarVO> locList = userService.selectCarList(carVO);
		return locList;
	}
	
	@RequestMapping(value = "car/regist",method = RequestMethod.GET)
	public String getCarResist()throws Exception{
		return "user/car/regist";
	}
	
	@ResponseBody
	@RequestMapping(value = "car/regist" ,method = RequestMethod.POST ,produces = "application/text; charset=utf-8;")
	public String postCarResist(
							@RequestParam(value = "carPrice" , required = false)String carPrice,
							@RequestParam(value = "carType" , required = false)String carType,
							@RequestParam(value = "carManuFacturing" , required = false)String carManuFacturing,
							@RequestParam(value = "carModel" , required = false)String carModel,
							@RequestParam(value = "carRank" , required = false)String carRank,
							@RequestParam(value = "carDetailRank" , required = false)String carDetailRank,
							@RequestParam(value = "carDiffDate" , required = false)String carDiffDate,
							@RequestParam(value = "carRegDate" , required = false)String carRegDate,
							@RequestParam(value = "carDistance" , required = false)String carDistance,
							@RequestParam(value = "carDisplaceMent" , required = false)String carDisplaceMent,
							@RequestParam(value = "carFuel" , required = false) String  carFuel,
							@RequestParam(value = "carTransMission" , required = false)String carTransMission,
							@RequestParam(value = "carAccidentCnt" , required = false)String carAccidentCnt,
							@RequestParam(value = "carSpecialUseYn" , required = false)String carSpecialUseYn,
							@RequestParam(value = "carChangeCnt" , required = false)String carChangeCnt,
							@RequestParam(value = "carOption1" , required = false)String carOption1,
							@RequestParam(value = "carOption2" , required = false)String carOption2,
							@RequestParam(value = "carOption3" , required = false)String carOption3,
							@RequestParam(value = "carAdditionInfo" , required = false)String carAdditionInfo,
							@RequestParam(value = "carIntro" , required = false)String carIntro,
							@RequestParam(value = "carLoc" , required = false)String carLoc,
							HttpSession session
							)throws Exception{
		
		String userId = (String)session.getAttribute("userId");
		
		CarVO carVO = new CarVO();
		
		carVO.setCarUserId(userId);
		carVO.setCarWriter(userId);
		carVO.setCarPrice(carPrice);
		carVO.setCarType(carType);
		carVO.setCarManuFacturing(carManuFacturing);
		carVO.setCarModel(carModel);
		carVO.setCarRank(carRank);
		carVO.setCarDetailRank(carDetailRank);
		carVO.setCarDiffDate(carDiffDate);
		carVO.setCarRegDate(carRegDate);
		carVO.setCarDistance(carDistance);
		carVO.setCarDisplaceMent(carDisplaceMent);
		carVO.setCarFuel(carFuel);
		carVO.setCarTransMission(carTransMission);
		carVO.setCarAccidentCnt(Integer.parseInt(carAccidentCnt));
		carVO.setCarSpecialUseYn(carSpecialUseYn);
		carVO.setCarChangeCnt(Integer.parseInt(carChangeCnt));
		carVO.setCarOption1(carOption1);
		carVO.setCarOption2(carOption2);
		carVO.setCarOption3(carOption3);
		carVO.setCarAdditionInfo(carAdditionInfo);
		carVO.setCarIntro(carIntro);
		carVO.setCarLoc(carLoc);
		
		userService.insertCarRegist(carVO);
		
		return "등록 되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "car/regist/file" ,method = RequestMethod.POST,produces = "application/text; charset=utf8;" )
	public String postCarRegistFile(@RequestParam("fileContent")List<MultipartFile> multipartfile,
									HttpServletRequest request,HttpServletResponse response
									,HttpSession session)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId =(String)session.getAttribute("userId");
		
		if(multipartfile.size()!=0 &&! multipartfile.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<multipartfile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartfile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(carUploadPath+storedFileName);
				multipartfile.get(i).transferTo(targetFile);
				
				map.put("writer",userId);
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartfile.get(i).getSize());
				
				list.add(map);
			}
			
			for(int i=0; i<list.size(); i++) {
				userService.insertCarFile(list.get(i));
			}
		}
		
		return "업로드 되었습니다.";
	}
	
	@RequestMapping(value = "car/detail" ,method = RequestMethod.GET)
	public String getCarDetail(@RequestParam("carNo")int carNo,Model model,CarFileVO carFileVO,HttpSession session)throws Exception{
		model.addAttribute("carVO",userService.selectCarVO(carNo));
		
		carFileVO.setCarNo(carNo);
		model.addAttribute("file" ,userService.selectCarFile(carFileVO));
	
		//조회수
		userService.updateCarHitCnt(carNo);
		
		return "user/car/detail";
	}
	
	@RequestMapping(value = "job/write",method = RequestMethod.GET)
	public String getJobWrite(Model model,HttpSession session)throws Exception{
		String userId =(String)session.getAttribute("userId");
		
		UserJobVO userJobVO = userService.selectUserJobByWriter(userId);
		model.addAttribute("vo",userJobVO);
		return "user/job/write";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/write",method = RequestMethod.POST ,produces = "application/text; charset=utf-8;")
	public String postJobWrite(
								@RequestParam( value ="lastName" ,required = true) String lastName
							   ,@RequestParam( value ="firstName" ,required = true) String firstName
							   ,@RequestParam( value ="tel" ,required = true) String tel
							   ,@RequestParam( value ="gender" ,required = true) String gender
							   ,@RequestParam( value ="birthYear" ,required = true) String birthYear
							   ,@RequestParam( value = "careerYn" ,required = false ) String careerYn
							   ,@RequestParam( value ="careerLoc" ,required = false) String careerLoc
							   ,@RequestParam( value ="careerWork" ,required = false) String careerWork
							   ,@RequestParam( value ="careerYear" ,required = false) String careerYear
							   ,@RequestParam( value ="careerDiff" ,required = false) String careerDiff
							   ,@RequestParam( value ="advantage" ,required = true) String advantage
							   ,@RequestParam( value ="introduce" ,required = true) String introduce
							   ,@RequestParam( value ="addInfo" ,required = false) String addInfo
							   ,HttpSession session
								)throws Exception{
		
		String userId = (String)session.getAttribute("userId");
		
		UserJobVO userJobVO = new UserJobVO();
		userJobVO.setWriter(userId);
		userJobVO.setLastName(lastName);
		userJobVO.setFirstName(firstName);
		userJobVO.setTel(tel);
		userJobVO.setGender(gender);
		userJobVO.setBirthYear(birthYear);
		userJobVO.setCareerYn(careerYn);
		userJobVO.setCareerLoc(careerLoc);
		userJobVO.setCareerWork(careerWork);
		userJobVO.setCareerYear(careerYear);
		userJobVO.setCareerDiff(careerDiff);
		userJobVO.setAdvantage(advantage);
		userJobVO.setIntroduce(introduce);
		userJobVO.setAddInfo(addInfo);
		
		userService.insertUserJob(userJobVO);
		
		return "등록되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/write/file",method = RequestMethod.POST)
	public String postUserJobWriteFile(@RequestParam("fileContent")List<MultipartFile>multipartFile ,HttpSession session
									)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId = (String) session.getAttribute("userId");
		
		if(multipartFile.get(0).getSize()!=0 &&!multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(userJobUploadPath+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("writer", userId);
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartFile.get(i).getSize());
				
				list.add(map);
				
			}
			
			for(int i=0; i<list.size(); i++) {
				userService.insertUserJobFile(list.get(i));
			}
		}
		
		return "Upload Success";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/update",method = RequestMethod.POST ,produces = "application/text; charset=utf-8;")
	public String postJobUpadate(
								@RequestParam( value ="lastName" ,required = true) String lastName
							   ,@RequestParam( value ="firstName" ,required = true) String firstName
							   ,@RequestParam( value ="tel" ,required = true) String tel
							   ,@RequestParam( value ="gender" ,required = true) String gender
							   ,@RequestParam( value ="birthYear" ,required = true) String birthYear
							   ,@RequestParam( value = "careerYn" ,required = false ) String careerYn
							   ,@RequestParam( value ="careerLoc" ,required = false) String careerLoc
							   ,@RequestParam( value ="careerWork" ,required = false) String careerWork
							   ,@RequestParam( value ="careerYear" ,required = false) String careerYear
							   ,@RequestParam( value ="careerDiff" ,required = false) String careerDiff
							   ,@RequestParam( value ="advantage" ,required = true) String advantage
							   ,@RequestParam( value ="introduce" ,required = true) String introduce
							   ,@RequestParam( value ="addInfo" ,required = false) String addInfo
							   ,HttpSession session
								)throws Exception{
		
		String userId = (String )session.getAttribute("userId");
		
		UserJobVO userJobVO = new UserJobVO();
		userJobVO.setWriter(userId);
		userJobVO.setLastName(lastName);
		userJobVO.setFirstName(firstName);
		userJobVO.setTel(tel);
		userJobVO.setGender(gender);
		userJobVO.setBirthYear(birthYear);
		userJobVO.setCareerYn(careerYn);
		userJobVO.setCareerLoc(careerLoc);
		userJobVO.setCareerWork(careerWork);
		userJobVO.setCareerYear(careerYear);
		userJobVO.setCareerDiff(careerDiff);
		userJobVO.setAdvantage(advantage);
		userJobVO.setIntroduce(introduce);
		userJobVO.setAddInfo(addInfo);
		
		userService.updateUserJob(userJobVO);
		
		return "수정되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/delete",method = RequestMethod.POST,produces = "application/text;charset=utf-8;")
	public String postUserJobDelete(HttpSession session)throws Exception{
		String userId = (String)session.getAttribute("userId");
		userService.deleteUserJob(userId);
		
		return "삭제되었습니다.";
	}
	
	@RequestMapping(value = "job/main",method =RequestMethod.GET)
	public String getJobMain(Model model , JobVO jobVO,JobFileVO jobFileVO,HttpSession session)throws Exception{
		jobVO.setEndRow(8);
		List<JobVO> hitList = userService.selectJobList(jobVO);
		model.addAttribute("hitList",hitList);
		
		List<JobVO> locList = userService.selectJobList(jobVO);
		model.addAttribute("locList",locList);
		
		return "user/job/main";
	}
	
	@RequestMapping(value = "job/detail" ,method = RequestMethod.GET)
	public String getjobDetail(Model model,@RequestParam("jobNo")int jobNo,JobFileVO jobFileVO,HttpSession session)throws Exception{
		
		JobVO jobVO = userService.selectJobByNo(jobNo);
		model.addAttribute("jobVO",jobVO);
		
		jobFileVO.setJobNo(jobNo);
		List<JobFileVO> file =userService.selectJobFile(jobFileVO);
		model.addAttribute("file",file);
		
		String userId = (String)session.getAttribute("userId");

		jobVO.setEndRow(4);
		
		List<JobVO> list = userService.selectJobList(jobVO);
		model.addAttribute("list",list);
		
		//이력서 작성여부
		boolean jobWriteYn= userService.selectUserJobWrtieYn(userId);
		model.addAttribute("jobWriteYn", jobWriteYn);
		
		//지원 여부
		GetUserJobVO jobYnVO = new GetUserJobVO();
		
		jobYnVO.setWriter(userId);
		jobYnVO.setJobNo(jobNo);
		
		boolean getJobYn = userService.selectGetUserJobYn(jobYnVO);
		model.addAttribute("getJobYn",getJobYn);
		
		//조회수
		userService.updateJobHitCnt(jobNo);
		
		return "user/job/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "job/main/hit",method = RequestMethod.POST)
	public List<JobVO> postJobHitList(JobVO jobVO,@RequestParam("endRow")int endRow)throws Exception{
		jobVO.setEndRow(endRow);
		
	 List<JobVO> hitList= userService.selectJobList(jobVO);
		
	 return hitList;
	}
	@ResponseBody
	@RequestMapping(value = "job/main/loc",method = RequestMethod.POST)
	public List<JobVO> postJobHitList(JobVO jobVO,@RequestParam("endRow")int endRow,@RequestParam("jobLoc")String jobLoc)throws Exception{
		jobVO.setEndRow(endRow);
		jobVO.setJobLoc(jobLoc);
		
		List<JobVO> locList= userService.selectJobList(jobVO);
		
	 return locList;
	}
	
	@ResponseBody
	@RequestMapping(value = "job/get" ,method =  RequestMethod.POST ,produces = "application/text; charset=utf-8;")
	public String getUserJobGet(HttpSession session,@RequestParam("jobNo")int jobNo)throws Exception{
		GetUserJobVO getUserJovVo = new GetUserJobVO();
		getUserJovVo.setJobNo(jobNo);
		String userId = (String)session.getAttribute("userId");
		getUserJovVo.setuserId(userId);
		
		userService.insertGetUserJob(getUserJovVo);
	
		return "지원이 완료되었습니다.";
	}
	
	//문의사항
	@RequestMapping(value = "inquiry/main",method = RequestMethod.GET)
	public String getInquiryMainPage(Model model,HttpSession session,@ModelAttribute("scri")SearchCriteria scri)throws Exception{
		List<InquiryVO> hitList = userService.selectInquiryList();
		model.addAttribute("hitList",hitList);
		
		String userId = (String)session.getAttribute("userId");
		List<InquiryVO> writerList= userService.selectInquiryByWriter(userId);
		model.addAttribute("writerList",writerList);		
		
		List<InquiryVO> list = userService.selectInquirySearch(scri);
		model.addAttribute("list", list);
		
		return "user/inquiry/main";
	}
	@RequestMapping(value = "inquiry/detail",method = RequestMethod.GET)
	public String getInquiryDetail(Model model,HttpSession session,InquiryVO inquiryVO,@RequestParam("inquiryNo")int inquiryNo)throws Exception{
		userService.updateInquiryHitCnt(inquiryNo);
		
		model.addAttribute("inquiryVO",userService.selectInquiryByNo(inquiryNo));
		
		model.addAttribute("answerVO", userService.selectAnswerByInquiryNo(inquiryNo));
		
		return "user/inquiry/detail";
	}
	
	@RequestMapping(value ="inquiry/write",method = RequestMethod.GET )
	public String  getInquiryWritePage()throws Exception{
		return "user/inquiry/write";
	}
	
	@ResponseBody
	@RequestMapping(value ="inquiry/write" ,method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String  postInquiryWritePage(@RequestParam("title")String title,@RequestParam("content")String content,InquiryVO inquiryVO,HttpSession session)throws Exception{
		int userNo = (int)session.getAttribute("userNo");
		String userId = (String)session.getAttribute("userId");
		
		inquiryVO.setUserNo(userNo);
		inquiryVO.setWriter(userId);
		inquiryVO.setTitle(title);
		inquiryVO.setContent(content);
		userService.insertInquiry(inquiryVO);
		
		return "등록되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value ="inquiry/write/upload",method = RequestMethod.POST )
	public String  postInquiryFile(@RequestParam("fileContent")List<MultipartFile> multipartfile)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		if(multipartfile.size()!=0 &&! multipartfile.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<multipartfile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartfile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(userInquiryUploadPath+storedFileName);
				multipartfile.get(i).transferTo(targetFile);
				
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartfile.get(i).getSize());
				
				list.add(map);
			}
			
			for(int i=0; i<list.size(); i++) {
				userService.insertInquiryFile(list.get(i));
			}
		}
		
		return "UPLOAD FILE SUCCESS";
	}
	
	
	
	@RequestMapping(value = "mypage/main",method =RequestMethod.GET)
	public String getMypageMain(HttpSession session,Model model)throws Exception{
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("profileFile",userService.selectUserProfileYn(userId));

		model.addAttribute("account",userService.selectAccount(userId));
		
		return "user/mypage/main";
	}
	
	@RequestMapping(value = "mypage/profile",method =RequestMethod.GET)
	public String getMypageProfile(HttpSession session,Model model)throws Exception{
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("userVO",userService.selectUserByWriter(userId));
		
		model.addAttribute("profileFile",userService.selectUserProfileYn(userId));
		
		return "user/mypage/profile";
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/profile/passchk",method = RequestMethod.POST)
	public boolean postMypageProfilePassChk(HttpSession session ,UserVO userVO
			,@RequestParam("userPass")String userPass
			,@RequestParam("userPassChk")String userPassChk)throws Exception{
		String userId =(String)session.getAttribute("userId");
		
		userVO.setUserId(userId);
		userVO.setUserPass(userPass);
		userVO.setUserPassChk(userPassChk);
		
		boolean result = userService.selectUserPassChk(userVO);
	
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/profile/modifno",method =RequestMethod.POST ,produces ="application/text; charset=utf-8;" )
	public String postMypageUserProfile(HttpSession session 
									,@RequestParam(value = "userId" ,required = false)String userId
									,@RequestParam(value = "userName",required = false)String userName
									,@RequestParam(value = "userNick",required = false)String userNick
									,@RequestParam(value = "userMail",required = false)String userMail
									,@RequestParam(value = "userTel",required = false)String userTel
									,@RequestParam(value = "userBirth",required = false)String userBirth
									,@RequestParam(value = "userAddr1",required = false)String userAddr1
									,@RequestParam(value = "userAddr2",required = false)String userAddr2
									 )throws Exception{
		
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserName(userName);
		userVO.setUserNick(userNick);
		userVO.setUserMail(userMail);
		userVO.setUserTel(userTel);
		userVO.setUserBirth(userBirth);
		userVO.setUserAddr1(userAddr1);
		userVO.setUserAddr2(userAddr2);
		
		userService.updateUserInfo(userVO);
		
		return "정보가 수정되었습니다.";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/profile/file",method = RequestMethod.POST)
	public String postUserProfileFile(HttpSession session,
									@RequestParam("fileContent")List<MultipartFile>multipartFile,
									@RequestParam("fileNo")String fileNo
									)throws Exception{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		
		String userId = (String) session.getAttribute("userId");
		
		if(multipartFile.get(0).getSize()!=0 &&!multipartFile.get(0).getOriginalFilename().equals("")) {

			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(userProfileUploadPath+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("userId", userId);
				map.put("originFileName", originFileName);
				map.put("storedFileName", storedFileName);
				map.put("fileSize", multipartFile.get(i).getSize());
				
				list.add(map);
				
			}

			for(int i=0; i<list.size(); i++) {
				userService.insertUserPofileFile(list.get(i));
			}
			//기존 프로필 사진 삭제
			userService.deleteUserProfileFile( Integer.parseInt(fileNo));

		}
		
		return "Upload Success";
	}

	
	@RequestMapping(value = "mypage/profile/modpass" ,method = RequestMethod.GET)
	public String getProfileModPass()throws Exception{
		return "user/mypage/modpass";
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/profile/passchk/prev" ,method =  RequestMethod.POST)
	public String postPrevPassChk(HttpSession session)throws Exception{
		String userId = (String)session.getAttribute("userId");
		UserVO userVO = userService.selectPrevPassChk(userId);
		String userPass = userVO.getUserPass();
		
		return userPass;
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/profile/modpass" ,method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postProfileModPass(@RequestParam("userPass")String userPass
									,@RequestParam("userPassChk")String userPassChk
									,HttpSession session)throws Exception{
		
		String userId = (String)session.getAttribute("userId");
		
		UserVO userVO = new UserVO();
		
		userVO.setUserId(userId);
		userVO.setUserPass(userPass);
		userVO.setUserPassChk(userPassChk);
		
		userService.updateModPass(userVO);
		
		return "비밀번호가 변경되었습니다.";
	}

	@RequestMapping(value = "mypage/account",method = RequestMethod.GET)
	public String getProfileBank()throws Exception{
		return "user/mypage/account";
	}

	@ResponseBody
	@RequestMapping(value = "mypage/account",method = RequestMethod.POST ,produces = "application/text;charset=utf-8;")
	public String postProfileBank(HttpSession session,
									@RequestParam("userName")String userName,
									@RequestParam("accountNum")String accountNum,
									@RequestParam("tradeBank")String tradeBank,
									@RequestParam("saveMoney")String saveMoney)throws Exception{
		String userId = (String)session.getAttribute("userId");
		
		UserAccountVO userAccountVO = new UserAccountVO();
		userAccountVO.setUserId(userId);
		userAccountVO.setUserName(userName);
		userAccountVO.setAccountNum(accountNum);
		userAccountVO.setTradeBank(tradeBank);
		userAccountVO.setSaveMoney(Integer.parseInt(saveMoney));
		
		userService.insertAccount(userAccountVO);
		
		return "충전 되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "product/like",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postProductLike(HttpSession session ,@RequestParam("productNo")int productNo ,@RequestParam("price")int price,
									@RequestParam("title")String title,@RequestParam("content")String content,
									@RequestParam("location")String location)throws Exception{
		String userId = (String)session.getAttribute("userId");
		
		UserTradeVO userTradeVO = new UserTradeVO();
		userTradeVO.setUserId(userId);
		userTradeVO.setProductNo(productNo);
		userTradeVO.setTitle(title);
		userTradeVO.setContent(content);
		userTradeVO.setPrice(price);
		userTradeVO.setLocation(location);
		
		userService.insertUserTrade(userTradeVO);
		userService.updateUserLike(productNo);
		
		return "찜 하기 완료-!";
	}
	
	@ResponseBody
	@RequestMapping(value = "product/like/cancle",method = RequestMethod.POST,produces = "application/text; charset=utf-8;")
	public String postProductLikeCancle(HttpSession session ,@RequestParam("productNo")int productNo)throws Exception{
		
		userService.updateUserLikeCancle(productNo);
		
		return "찜 하기가 취소되었습니다.";
	}

	@RequestMapping(value = "trade/main",method = RequestMethod.GET)
	public String getUserTradeMain(@RequestParam("productNo")int productNo,Model model)throws Exception{
		model.addAttribute("product",userService.selectProductDetail(productNo));

		return "user/trade/main";
	}
	
	
	@RequestMapping(value = "mypage/like" ,method = RequestMethod.GET)
	public String getUserMypageLike(HttpSession session,Model model)throws Exception{
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("likeList",userService.selectLikeList(userId));
		
		return "user/mypage/like";
	}
	@RequestMapping(value = "mypage/sales" ,method = RequestMethod.GET)
	public String getUserMypageSales(HttpSession session,Model model)throws Exception{
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("salesList",userService.selectProductSalesList(userId));
		
		return "user/mypage/sales";
	}
	@RequestMapping(value = "mypage/location")
	public String getMypageLocation(HttpSession session,Model model)throws Exception{
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("user",userService.selectUserByUserId(userId));
		return "user/mypage/location";
	}
	
	@RequestMapping(value = "mypage/event",method = RequestMethod.GET)
	public String getEventList(SearchCriteria scri,Model model)throws Exception{
		List<EventVO> list = userService.selectEventList(scri);
		model.addAttribute("list",list);
	
		return "user/mypage/event";
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage/event",method = RequestMethod.POST)
	public List<EventVO> postEventList(SearchCriteria scri,Model model,@RequestParam("endRow")int endRow)throws Exception{
		
		scri.setStartRow(0);
		scri.setEndRow(endRow);
		List<EventVO> list = userService.selectEventList(scri);
		
		return list;
	}
	
	@RequestMapping(value = "mypage/notice/main",method = RequestMethod.GET)
	public String getNoticeList(SearchCriteria scri,Model model)throws Exception{
		List<NoticeVO> list = userService.selectNoticeList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(userService.selectNoticeTotalCnt(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "user/mypage/notice/main";
	}
	@RequestMapping(value = "mypage/notice/detail",method = RequestMethod.GET)
	public String getNoticeDetail(@RequestParam("noticeNo")int noticeNo ,Model model)throws Exception{
		
		model.addAttribute("noticeVO",userService.selectNoticeByNo(noticeNo));
		
		List<NoticeFileVO> file = userService.selectNoticeFile(noticeNo);
		model.addAttribute("file" ,file);
		
		return "user/mypage/notice/detail";
	}
	@RequestMapping(value = "mypage/notice/filedown",method = RequestMethod.POST )
	public void postNoticeFileDown(@RequestParam Map<String,Object> map,HttpServletRequest request
									,HttpServletResponse response)throws Exception{
		Map<String, Object> resultMap = userService.selectNoticeFileByNo(map);
		String originFileName = (String) resultMap.get("originFileName");
		String storedFileName = (String) resultMap.get("storedFileName");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(uploadPath+"notice\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("content-Disposition","attachment; fileName=\""+java.net.URLEncoder.encode(originFileName,"UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
