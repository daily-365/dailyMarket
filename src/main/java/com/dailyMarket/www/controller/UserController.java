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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.UserService;
import com.dailyMarket.www.vo.BusiNoticeFileVO;
import com.dailyMarket.www.vo.BusiNoticeVO;
import com.dailyMarket.www.vo.BusiReviewFileVO;
import com.dailyMarket.www.vo.BusiReviewVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.GetUserJobVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserJobVO;
import com.dailyMarket.www.vo.UserVO;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private static final String productUploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\product\\";
	private static final String estateUploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\estate\\";
	private static final String carUploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\car\\";
	private static final String companyUploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\company\\";
	private static final String userJobUploadPath ="C:\\eclipse-workspace\\dailyMarket\\src\\main\\webapp\\resources\\upload\\user\\job\\";
	
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
		List<ProductVO> detail= userService.selectProductDetail(productNo);
		model.addAttribute("detail",detail);
		return "user/product/detail";
	}
	
	@RequestMapping(value = "company/main" ,method = RequestMethod.GET)
	public String getcompanyMain(BusiVO busiVO,Model model)throws Exception{
		List<BusiVO> list = userService.selectBusiList(busiVO);
		model.addAttribute("list",list);
		
		List<BusiReviewVO> review = userService.selectCompanyReviewList();
		model.addAttribute("review",review);
		
		return "user/company/main";
	}
	@RequestMapping(value = "company/detail" ,method = RequestMethod.GET)
	public String getcompanyDetail(@RequestParam("busiNo")int busiNo,Model model,HttpSession session)throws Exception{
		BusiVO busiVO = userService.selectByBusiNo(busiNo);
		model.addAttribute("busiVO",busiVO);
		
		List<StoreFileVO> store = userService.selectStoreList(busiNo);
		model.addAttribute("store",store);
		
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		String userId =(String )session.getAttribute("userId");
		
		List<BusiNoticeVO> notice = userService.selectCompanyNoticeList(userId);
		model.addAttribute("notice",notice);
		
		List<BusiNoticeFileVO> file = userService.selectCompanyNoticeFile(userId);
		model.addAttribute("file",file);	
		
		BusiReviewVO review = userService.selectCompanyReviewByBusiNo(busiNo);
		model.addAttribute("review",review);
		
		return "user/company/detail";
	}
	
	@RequestMapping(value = "company/product/main" ,method = RequestMethod.GET)
	public String getProductMain(@RequestParam("busiNo")int busiNo,Model model)throws Exception{
		List<MenuVO> menu = userService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		//페이지 전환시 파라미터 값을 위함 : 추후 코드 수정 필요
		BusiReviewVO review = userService.selectCompanyReviewByBusiNo(busiNo);
		model.addAttribute("review",review);
		
		return "user/company/product/main";
	}
	
	@RequestMapping(value = "company/notice/main" ,method = RequestMethod.GET)
	public String getCompanyNoticeMain(Model model,HttpSession session //추후 수정
																	,@RequestParam("busiNo")int busiNo)throws Exception{
		String userId = (String)session.getAttribute("userId");
		List<BusiNoticeVO> noticeList = userService.selectCompanyNoticeList(userId);
		List<BusiNoticeFileVO> fileList =userService.selectCompanyNoticeFile(userId);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("fileList",fileList);
		
		//페이지 전환시 파라미터 값을 위함 : 추후 코드 수정 필요
		BusiReviewVO review = userService.selectCompanyReviewByBusiNo(busiNo);
		model.addAttribute("review",review);
		
		return "user/company/notice/main";
	}
	@RequestMapping(value = "company/notice/detail" ,method = RequestMethod.GET)
	public String getCompanyNoticeDetail(@RequestParam("busiNoticeNo")int busiNoticeNo,//추후 수정
																	@RequestParam("busiNo")int busiNo, Model model)throws Exception{
		BusiNoticeVO busiNoticeVO = userService.selectCompanyNoticeByNO(busiNoticeNo);
		List<BusiNoticeFileVO> file = userService.selectCompanyNoticeFileByNo(busiNoticeNo);
		
		model.addAttribute("vo",busiNoticeVO);
		model.addAttribute("file",file);
		
		//페이지 전환시 파라미터 값을 위함 : 추후 코드 수정 필요
		BusiReviewVO review = userService.selectCompanyReviewByBusiNo(busiNo);
		model.addAttribute("review",review);
		
		return "user/company/notice/detail";
	}
	
	@RequestMapping(value = "company/review/write",method = RequestMethod.GET)
	public String getCompanyReviewWrite()throws Exception{
		return "user/company/review/write";
	}
	
	@RequestMapping(value = "company/review/write",method = RequestMethod.POST)
	public String postCompanyReviewWrite(BusiReviewVO busiReviewVO)throws Exception{
		userService.insertCompanyReview(busiReviewVO);
		
		return "redirect:/user/company/main";
	}
	
	@RequestMapping(value = "company/review/main",method = RequestMethod.GET)
	public String getCompanyReviewMain(@RequestParam("busiNo")int busiNo,
										@RequestParam("busiReviewNo")int busiReviewNo,
										Model model )throws Exception{
		List<BusiReviewVO> list = userService.selectCompanyReviewListByBusiNo(busiNo);
		model.addAttribute("list",list);
		
		List<BusiReviewFileVO> file = userService.selectCompanyReviewFileByBusiViewNo(busiReviewNo);
		model.addAttribute("file",file);
		return "user/company/review/main";
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
	public String getEstateMain(Model model ,EstateVO estateVO, EstateFileVO estateFileVO)throws Exception{
		List<EstateVO> estate= userService.selectEstateList(estateVO);
		model.addAttribute("estate",estate);
		
		List<EstateFileVO> estateFile = userService.selectEstateFile(estateFileVO);
		model.addAttribute("estateFile",estateFile);
		
		return "user/estate/main";
	}
	
	
	@RequestMapping(value = "estate/writeOne" ,method = RequestMethod.GET)
	public String getEstateWriteOne(Model model)throws Exception{
		return "user/estate/writeOne";
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
	
	@RequestMapping(value = "estate/writeTwo" ,method = RequestMethod.GET)
	public String getEstateWriteTwo()throws Exception{
		return "user/estate/writeTwo";
	}
	@ResponseBody
	@RequestMapping(value = "estate/writeTwo" ,method = RequestMethod.POST ,produces="application/text;charset=utf-8")
	public String postEstateWriteTwo(@RequestParam(required = false,value="esTradeType")String esTradeType ,@RequestParam(required = false,value="esPrice")String esPrice
									,@RequestParam(required = false,value="esPosiType")String esPosiType ,@RequestParam(required = false,value="esSize1")String esSize1
									,@RequestParam(required = false,value="esSize2")String esSize2,@RequestParam(required = false,value="esOption1")String esOption1 
									,@RequestParam(required = false,value="esOption2")String esOption2,@RequestParam(required = false,value="esOption3")String esOption3
									,@RequestParam(required = false,value="esCostYn")String esCostYn,@RequestParam(required = false,value="esCost")String esCost
									,@RequestParam(required = false,value="esCostChk")String esCostChk,@RequestParam(required = false,value="esSeperCostChk")String esSeperCostChk
									,@RequestParam(required = false,value="esCostContent")String esCostContent
								)throws Exception{
		
		EstateVO estateVO = new EstateVO();
		
		estateVO.setEsTradeType(esTradeType);
		estateVO.setEsPrice(esPrice);
		estateVO.setEsPosiType(esPosiType);
		estateVO.setEsSize1(Integer.parseInt(esSize1));
		estateVO.setEsSize2(Integer.parseInt(esSize2));
		estateVO.setEsOption1(Integer.parseInt(esOption1));
		estateVO.setEsOption2(Integer.parseInt(esOption2));
		estateVO.setEsOption3(Integer.parseInt(esOption3));
		estateVO.setEsCostYn(esCostYn);
		estateVO.setEsCost(Integer.parseInt(esCost));
		estateVO.setEsCostChk(esCostChk);
		estateVO.setEsSeperCostChk(esSeperCostChk);
		estateVO.setEsCostContent(esCostContent);
		
		userService.updateEstateTwo(estateVO);
		
		return "저장 되었습니다.";
	}
	
	
	@RequestMapping(value = "estate/writeThree" ,method = RequestMethod.GET)
	public String getEstateWriteThree()throws Exception{
		return "user/estate/writeThree";
	}

	
	@ResponseBody
	@RequestMapping(value = "estate/writeThree" ,method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String getEstateDetail(@RequestParam(value="esLoanYn",required = false)String esLoanYn ,@RequestParam(value="esAnimalYn",required = false)String esAnimalYn   
								,@RequestParam(value="esParkingYn",required = false)String esParkingYn ,@RequestParam(value="esMoveYn",required = false)String esMoveYn   
								,@RequestParam(value="esMoveDate",required = false)String esMoveDate ,@RequestParam(value="esFacility",required = false)String esFacility   
								,@RequestParam(value="esAdvantage",required = false)String esAdvantage ,@RequestParam(value="esHouseIntro",required = false)String esHouseIntro  
								)throws Exception{
		
		EstateVO estateVO = new EstateVO();
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
		
		return "user/estate/detail";
	}
	
	
	@RequestMapping(value = "car/main" ,method = RequestMethod.GET)
	public String getCarMain(Model model,CarVO carVO,CarFileVO carFileVO)throws Exception{
		List<CarVO> list = userService.selectCarList(carVO);
		model.addAttribute("list",list);
		
		List<CarFileVO> file = userService.selectCarFile(carFileVO);
		model.addAttribute("file",file);
		
		return "user/car/main";
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
		carVO.setcarDisplaceMent(carDisplaceMent);
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
	public String getCarDetail(@RequestParam("carNo")int carNo,Model model,CarFileVO carFileVO)throws Exception{
		model.addAttribute("carVO",userService.selectCarVO(carNo));
		
		model.addAttribute("file" ,userService.selectCarFile(carFileVO));
		
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
	public String getJobMain(Model model , JobVO jobVO,JobFileVO jobFileVO)throws Exception{
		List<JobVO> list = userService.selectJobList(jobVO);
		model.addAttribute("list",list);
		
		List<JobFileVO> file =userService.selectJobFile(jobFileVO);
		model.addAttribute("file",file);
		
		return "user/job/main";
	}
	
	@RequestMapping(value = "job/detail" ,method = RequestMethod.GET)
	public String getjobDetail(Model model,@RequestParam("jobNo")int jobNo,JobFileVO jobFileVO,HttpSession session)throws Exception{
		JobVO jobVO = userService.selectJobByNo(jobNo);
		model.addAttribute("jobVO",jobVO);
		
		List<JobFileVO> file =userService.selectJobFile(jobFileVO);
		model.addAttribute("file",file);
		
		//이력서 작성여부
		String userId = (String)session.getAttribute("userId");
		boolean jobWriteYn= userService.selectUserJobWrtieYn(userId);
		model.addAttribute("jobWriteYn",jobWriteYn);
		
		//지원 여부
		boolean getJobYn = userService.selectGetUserJobYn(userId);
		model.addAttribute("getJobYn",getJobYn);
		
		return "user/job/detail";
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
	
	@RequestMapping(value = "mypage/main",method =RequestMethod.GET)
	public String getMypageMain()throws Exception{
		return "user/mypage/main";
	}
	
	
}
