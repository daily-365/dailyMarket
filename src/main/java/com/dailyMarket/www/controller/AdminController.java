package com.dailyMarket.www.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONObject;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.AdminService;
import com.dailyMarket.www.utils.PageMaker;
import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.AnswerVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.EventVO;
import com.dailyMarket.www.vo.InquiryFileVO;
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
import com.dailyMarket.www.vo.UserProfileFileVO;
import com.dailyMarket.www.vo.UserTradeVO;
import com.dailyMarket.www.vo.UserVO;
import com.google.gson.JsonObject;


@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {

	private static final Logger logger= LoggerFactory.getLogger(AdminController.class);
	
	private static final String uploadPath ="C:\\dailyMarket\\dailyMarket\\src\\main\\webapp\\resources\\upload\\admin\\";
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "main",method =RequestMethod.GET)
	public String getAdminMain(Model model,SearchCriteria scri)throws Exception {
		logger.info("GET ADMIN MAIN");
		
		scri.setPagePerNum(15);
		
		model.addAttribute("event",adminService.selectEventList(scri));
		model.addAttribute("notice",adminService.selectNoticeList(scri));
		
		return "admin/main";
	}
	
	@RequestMapping(value = "login",method =RequestMethod.GET)
	public String getAdminLogin()throws Exception {
		logger.info("GET ADMIN LOGIN");
		return "admin/login";
		
	}
	@RequestMapping(value = "login",method =RequestMethod.POST)
	public String postAdminLogin(HttpSession session,AdminVO adminVO,RedirectAttributes rttr)throws Exception {
		boolean result =adminService.adminLogin(adminVO);
		if(result) {
			session.setAttribute("userId",adminVO.getUserId());
			return "redirect:/admin/main";
		}else {
			rttr.addFlashAttribute("failMsg","아이디와 비밀번호를 확인해주세요.");
			return "redirect:/admin/login";
		}
	}
	
	@RequestMapping(value = "logout",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/admin/login";
	}
	
	@RequestMapping(value = "product/main",method =RequestMethod.GET)
	public String getProductMain(@ModelAttribute("scri")SearchCriteria scri,ProductVO productVO,Model model)throws Exception {
		
		List<ProductVO> list = adminService.selectProductList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectProductTotalCount(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/product/main";
	}
	@RequestMapping(value = "product/detail",method = RequestMethod.GET)
	public String getProductDetail(Model model , @RequestParam("productNo")int productNo)throws Exception{
		ProductVO productVO = adminService.selectProductByProductNo(productNo);
		model.addAttribute("productVO",productVO);
		
		List<ProductFileVO> list = adminService.selectProductFile(productNo);
		model.addAttribute("file",list);
		
		return "admin/product/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "product/delete",method = RequestMethod.POST ,produces = "application/text; charset=UTF-8;")
	public String getProductDelete(@RequestParam("productNo")int productNo)throws Exception{
		adminService.deleteProduct(productNo);
		return "삭제 되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "product/update",method = RequestMethod.POST ,produces = "application/text; charset=UTF-8;")
	public String getProductupdate(@RequestParam("productNo")int productNo)throws Exception{
		adminService.updateProduct(productNo);
		return "복귀 되었습니다.";
	}
	
	
	@RequestMapping(value = "store/main",method =RequestMethod.GET)
	public String getStroeMain(Model model ,@ModelAttribute("scri")SearchCriteria scri,BusiVO busiVO)throws Exception {
		List<BusiVO> list =  adminService.selectBusiList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectBusiTotalCount(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/store/main";
	}
	@RequestMapping(value = "store/detail",method =RequestMethod.GET)
	public String getStroeDetail(@RequestParam("busiNo")int busiNo,Model model)throws Exception {
		BusiVO busiVO = adminService.selectBusiByBusiNo(busiNo);
		model.addAttribute("busiVO",busiVO);
		
		List<BusiFileVO> file = adminService.selectBusiFile(busiNo);
		model.addAttribute("file",file);
		
		List<StoreFileVO> store = adminService.selectStoreFile(busiNo);
		model.addAttribute("store",store);
		
		List<MenuVO> menu = adminService.selectMenuList(busiNo);
		model.addAttribute("menu",menu);
		
		return "admin/store/detail";
	}
	@ResponseBody
	@RequestMapping(value = "store/detail/update" ,method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postStoreDetailUpdate(@RequestParam("busiNo")int busiNo,@RequestParam("status")String status,BusiVO busiVO)throws Exception{
		String result ="";
		
		busiVO.setBusiNo(busiNo);
		busiVO.setStatus(status);
		
		if(status.equals("Y")) {
			adminService.updateBusistatus(busiVO);
			result ="승인 되었습니다.";
		}if(status.equals("N")) {
			adminService.updateBusistatus(busiVO);
			result ="요청 되었습니다.";
		}if(status.equals("S")) {
			adminService.updateBusistatus(busiVO);
			result ="승인이 취소 되었습니다.";
		}
		return result;
	}
	
	
	
	@RequestMapping(value = "job/main",method =RequestMethod.GET)
	public String getjobMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception {
		List<JobVO> list = adminService.selectJobList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new  PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectJobtotalCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/job/main";
	}
	
	@RequestMapping(value = "job/detail",method = RequestMethod.GET)
	public String getJobDetail(@RequestParam("jobNo")int jobNo,Model model)throws Exception{
		
		JobVO jobVO = adminService.selectJobDetail(jobNo);
		model.addAttribute("jobVO",jobVO);
		
		List<JobFileVO> file = adminService.selectJobFile(jobNo);
		model.addAttribute("file",file);
		
		return"admin/job/detail";
		
	}
	
	
	@RequestMapping(value = "estate/main",method =RequestMethod.GET)
	public String getEstateMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception {
		List<EstateVO> list = adminService.selectEstateList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectEstateTotalCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/estate/main";
	}
	@RequestMapping(value = "estate/detail",method =RequestMethod.GET)
	public String getEstateMain(Model model,@RequestParam("esNo")int esNo)throws Exception {
		EstateVO estateVO = adminService.selectEstateDetail(esNo);
		model.addAttribute("estateVO",estateVO);
		
		List<EstateFileVO> file = adminService.selectEstateFile(esNo);
		model.addAttribute("file",file);
		
		return "admin/estate/detail";
	}
	
	
	@RequestMapping(value = "car/main",method =RequestMethod.GET)
	public String getCartMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception {
		List<CarVO> list = adminService.selectCarList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectCarTotalCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		
		return "admin/car/main";
	}
	@RequestMapping(value = "car/detail",method =RequestMethod.GET)
	public String getCarDetail(Model model,@RequestParam("carNo")int carNo)throws Exception{
		CarVO carVO = adminService.selectCarDetail(carNo);
		model.addAttribute("carVO",carVO);
		
		List<CarFileVO> file = adminService.selectCarFile(carNo);
		model.addAttribute("file",file);
		
		return "admin/car/detail";
	}
	
	
	@RequestMapping(value = "user/main",method =RequestMethod.GET)
	public String getUserMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception {
		List<UserVO> list = adminService.selectUserList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectUserTotalCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/user/main";
	}
	@RequestMapping(value = "user/detail")
	public String getUserDetail(@RequestParam("userId")String userId,Model model)throws Exception{
		UserVO userVO = adminService.selectUserDetail(userId);
		model.addAttribute("userVO",userVO);
		
		List<UserProfileFileVO> file = adminService.selectUserFile(userId);
		model.addAttribute("file",file);
		
		List<UserAccountVO> account = adminService.selectUserAccount(userId);
		model.addAttribute("account",account);
		
		List<UserTradeVO> trade = adminService.selectUserTrade(userId);
		model.addAttribute("trade",trade);
		
		return "admin/user/detail";
	}
	
	
	
	@RequestMapping(value = "product/excelDown",method = RequestMethod.POST)
	public void postProductExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectProductTotalCount(scri));
		
		
		List<ProductVO> list = adminService.selectProductList(scri);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("PRODUCT DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectProductTotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("글제목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("판매형태");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("가격");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("설명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("위치");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("작성자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("거래상태");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("구매자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("구매일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("조회수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("추천수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("작성일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("수정일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(16);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getTitle());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getType());
			
			if(list.get(i).getPrice()==0) {
				dataCell = dataRow.createCell(4);
				dataCell.setCellValue("무료나눔");
			}else {
				dataCell = dataRow.createCell(4);
				dataCell.setCellValue(list.get(i).getPrice());
			}
			
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getContent());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getLocation());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getWriter());
			
			if(list.get(i).getTradeYn().equals("Y")) {
				dataCell = dataRow.createCell(8);
				dataCell.setCellValue("판매완료");
			}
			if(list.get(i).getTradeYn().equals("S")) {
				dataCell = dataRow.createCell(8);
				dataCell.setCellValue("판매중");
			}
			if(list.get(i).getTradeYn().equals("N")) {
				dataCell = dataRow.createCell(8);
				dataCell.setCellValue("판매취소");
			}
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getTradeId());
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getTradeDate());
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getHitCnt());
			dataCell = dataRow.createCell(12);
			dataCell.setCellValue(list.get(i).getLikeCnt());
			dataCell = dataRow.createCell(13);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(14);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(15);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(16);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	
	@RequestMapping(value = "busi/excelDown",method = RequestMethod.POST)
	public void postBusiExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectBusiTotalCount(scri));
		
		
		List<BusiVO> list = adminService.selectBusiList(scri);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("BUSI DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectBusiTotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("사업자번호");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("작성자 아이디");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("사업자 명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("연락처");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("사업장 명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("업종");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("가게 연락처");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("가게 주소");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("약관동의 여부");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("입점 현황");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("작성일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("수정일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getBusiNum());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getWriter());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getOwnerName());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getBusiTel());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getBusiName());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getBusiType1()+" "+list.get(i).getBusiType2()+" "+list.get(i).getBusiType3());
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getStoreTel());
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getStoreAddr()+" "+list.get(i).getStoreAddrDetail());
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getAgreeYn());
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getStatus());
			dataCell = dataRow.createCell(12);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(13);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(14);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(15);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "job/excelDown",method = RequestMethod.POST)
	public void postJobExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectJobtotalCount(scri));
		
		
		List<JobVO> list = adminService.selectJobList(scri);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("JOB DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectJobtotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("작성자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("업체명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("글제목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("급여형태");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("급여");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("위치");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("위치설명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("근무요일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("근무시간");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("설명");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("조회수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("작성일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("수정일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getJobWriter());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getJobCompany());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getJobTitle());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getJobType());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getJobMoney());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getJobLoc()+" ( "+list.get(i).getJobLocDetail()+" ) ");
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getJobWorkDate());
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getJobWorkTime());
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getJobLocContent());
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getJobContent());
			dataCell = dataRow.createCell(12);
			dataCell.setCellValue(list.get(i).getHitCnt());
			dataCell = dataRow.createCell(13);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(14);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(15);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(16);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "estate/excelDown",method = RequestMethod.POST)
	public void postEstateExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectEstateTotalCount(scri));
		
		
		List<EstateVO> list = adminService.selectEstateList(scri);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("ESTATE DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectEstateTotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("작성자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("세입자/집주인");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("워룸/빌라/오피스텔/상가/아파트");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("위치");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("단기/월세/전세/매매");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("가격");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("방향");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("공급면적");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("전용면적");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("방");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("화장실");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("층수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("관리비여부");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("관리비");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(16);
		headerCell.setCellValue("관리비에 포함된 항목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(17);
		headerCell.setCellValue("별도 항목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(18);
		headerCell.setCellValue("대출가능여부");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(19);
		headerCell.setCellValue("반려동물가능여부");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(20);
		headerCell.setCellValue("주차가능여부");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(21);
		headerCell.setCellValue("입주일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(22);
		headerCell.setCellValue("옵션");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(23);
		headerCell.setCellValue("등록일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(24);
		headerCell.setCellValue("수정일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(25);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(26);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getEsWriter());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getEsHumType());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getEsRoomType());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getEsLoc()+" ( "+list.get(i).getEsLocDetail()  +" ) ");
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getEsTradeType());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getEsPrice());
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getEsPosiType());
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getEsSize1());
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getEsSize2());
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getEsOption1());
			dataCell = dataRow.createCell(12);
			dataCell.setCellValue(list.get(i).getEsOption2());
			dataCell = dataRow.createCell(13);
			dataCell.setCellValue(list.get(i).getEsOption3());
			dataCell = dataRow.createCell(14);
			dataCell.setCellValue(list.get(i).getEsCostYn());
			dataCell = dataRow.createCell(15);
			dataCell.setCellValue(list.get(i).getEsCost());
			dataCell = dataRow.createCell(16);
			dataCell.setCellValue(list.get(i).getEsCostChk());
			dataCell = dataRow.createCell(17);
			dataCell.setCellValue(list.get(i).getEsSeperCostChk());
			dataCell = dataRow.createCell(18);
			dataCell.setCellValue(list.get(i).getEsLoanYn());
			dataCell = dataRow.createCell(19);
			dataCell.setCellValue(list.get(i).getEsAnimalYn());
			dataCell = dataRow.createCell(20);
			dataCell.setCellValue(list.get(i).getEsParkingYn());
			dataCell = dataRow.createCell(21);
			dataCell.setCellValue(list.get(i).getEsMoveDate());
			dataCell = dataRow.createCell(22);
			dataCell.setCellValue(list.get(i).getEsFacility());
			dataCell = dataRow.createCell(23);
			dataCell.setCellValue(list.get(i).getRegDate3());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(24);
			dataCell.setCellValue(list.get(i).getModDate3());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(25);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(26);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "car/excelDown",method = RequestMethod.POST)
	public void postCarExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectCarTotalCount(scri));
		
		
		List<CarVO> list = adminService.selectCarList(scri);
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("CAR DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectCarTotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("작성자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("가격");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("거래상태");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("차종");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("제조사");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("이름");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("등급");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("마력");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("연식");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("차량 등록일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("주행거리km");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("배기량cc");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("연료");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("변속기");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(16);
		headerCell.setCellValue("보험사고이력(횟수)");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(17);
		headerCell.setCellValue("차량 특수용도 변경 여부 (Y/N)");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(18);
		headerCell.setCellValue("차량소유주변경(횟수)");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(19);
		headerCell.setCellValue("내외장");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(20);
		headerCell.setCellValue("안전");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(21);
		headerCell.setCellValue("편의");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(22);
		headerCell.setCellValue("추가정보");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(23);
		headerCell.setCellValue("차량소개");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(24);
		headerCell.setCellValue("위치");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(25);
		headerCell.setCellValue("조회수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(26);
		headerCell.setCellValue("작성일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(27);
		headerCell.setCellValue("수정일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(28);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(29);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getCarWriter());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getCarPrice());
			dataCell = dataRow.createCell(4);
			if(list.get(i).getCarTradeYn().equals("Y")) {
				dataCell.setCellValue("판매완료");
			}if(list.get(i).getCarTradeYn().equals("S")) {
				dataCell.setCellValue("판매중");
			}if(list.get(i).getCarTradeYn().equals("N")) {
				dataCell.setCellValue("판매취소");
			}
			
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getCarType());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getCarManuFacturing());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getCarModel());
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getCarRank());
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getCarDetailRank());
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getCarDiffDate());
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getCarRegDate());
			dataCell = dataRow.createCell(12);
			dataCell.setCellValue(list.get(i).getCarDistance());
			dataCell = dataRow.createCell(13);
			dataCell.setCellValue(list.get(i).getCarDisplaceMent());
			dataCell = dataRow.createCell(14);
			dataCell.setCellValue(list.get(i).getCarFuel());
			dataCell = dataRow.createCell(15);
			dataCell.setCellValue(list.get(i).getCarTransMission());
			dataCell = dataRow.createCell(16);
			dataCell.setCellValue(list.get(i).getCarAccidentCnt());
			dataCell = dataRow.createCell(17);
			dataCell.setCellValue(list.get(i).getCarSpecialUseYn());
			dataCell = dataRow.createCell(18);
			dataCell.setCellValue(list.get(i).getCarChangeCnt());
			dataCell = dataRow.createCell(19);
			dataCell.setCellValue(list.get(i).getCarOption1().replace("<br>",","));
			dataCell = dataRow.createCell(20);
			dataCell.setCellValue(list.get(i).getCarOption2().replace("<br>",","));
			dataCell = dataRow.createCell(21);
			dataCell.setCellValue(list.get(i).getCarOption3().replace("<br>",","));
			dataCell = dataRow.createCell(22);
			dataCell.setCellValue(list.get(i).getCarAdditionInfo());
			dataCell = dataRow.createCell(23);
			dataCell.setCellValue(list.get(i).getCarIntro());
			dataCell = dataRow.createCell(24);
			dataCell.setCellValue(list.get(i).getCarLoc());
			dataCell = dataRow.createCell(25);
			dataCell.setCellValue(list.get(i).getHitCnt());
			dataCell = dataRow.createCell(26);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(27);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(28);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(29);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	
	@RequestMapping(value = "user/excelDown",method = RequestMethod.POST)
	public void postUserExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectUserTotalCount(scri));
		
		
		List<UserVO> list = adminService.selectUserList(scri);
		
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("USER DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectCarTotalCount(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("아이디");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("이름");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("닉네임");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("이메일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("전화번호");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("생년월일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("성별");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("주소");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("가입일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getUserId());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getUserName());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getUserNick());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getUserMail());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getUserTel());
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getUserBirth());
			dataCell = dataRow.createCell(8);
			if(list.get(i).getUserGender().equals("M")) {
				dataCell.setCellValue("남");
			}if(list.get(i).getUserGender().equals("F")){
				dataCell.setCellValue("여");
			}
			
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getUserAddr1()+ " ( "+list.get(i).getUserAddr2()+" ) ");
			dataCell = dataRow.createCell(10);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(11);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "event/excelDown",method = RequestMethod.POST)
	public void postEventExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectEventTotalCnt(scri));
		
		
		List<EventVO> list = adminService.selectEventList(scri);
		
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("EVENT DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectEventTotalCnt(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("번호");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("제목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("내용");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("등록일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("변경일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getEventNo());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getTitle());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getContent());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "notice/excelDown",method = RequestMethod.POST)
	public void postNoticeExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectNoticeTotalCnt(scri));
		
		
		List<NoticeVO> list = adminService.selectNoticeList(scri);
		
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("NOTICE DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectNoticeTotalCnt(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("번호");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("제목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("내용");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("등록일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("변경일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("삭제일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getNoticeNo());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getTitle());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getContent());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getModDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(7);
			dataCell.setCellValue(list.get(i).getDelDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "question/excelDown",method = RequestMethod.POST)
	public void postQuestionExcelDown(@RequestParam( "keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		
		SearchCriteria scri = new SearchCriteria();
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		//list.size를 위함 - 데이터 건수는 (조건포함) 처음부터 전체건수 까지
		scri.setPagePerNum(adminService.selectInquiryTotalCnt(scri));
		
		
		List<InquiryVO> list = adminService.selectInquiryList(scri);
		
		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet");
		
		CellStyle style =wb.createCellStyle();
		Font font =wb.createFont();
		
		font.setBold(true);
		font.setFontHeight((short)(16*18));
		font.setFontName("맑은 고딕");
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(font);
		
		Row titleRow = sheet.createRow(0);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue("Question DATA");
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		titleCell.setCellStyle(style);
		
		int rowNum =4;
		Row dataRow = null;
		Cell dataCell = null;
		
		Row totalCntRow = sheet.createRow(1);
		Cell totalCntCell = totalCntRow.createCell(0);
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectInquiryTotalCnt(scri)+" 건");
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
		totalCntCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(2);
		Cell headerCell = null;
		
		CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFont(font);
		
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("#");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("번호");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("제목");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("내용");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("작성자");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("조회수");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("답변상태");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("작성일");
		headerCell.setCellStyle(headerStyle);
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("삭제여부");
		headerCell.setCellStyle(headerStyle);
		
		//날짜 형식 변환
		XSSFDataFormat fmt = wb.createDataFormat();
		CellStyle rowCellStyle = wb.createCellStyle();
		rowCellStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd HH:mm:ss"));
		
		for(int i=0; i<list.size(); i++) {
			dataRow =sheet.createRow(rowNum++);
					
			dataCell = dataRow.createCell(1);
			dataCell.setCellValue(i+1);
			dataCell = dataRow.createCell(2);
			dataCell.setCellValue(list.get(i).getInquiryNo());
			dataCell = dataRow.createCell(3);
			dataCell.setCellValue(list.get(i).getTitle());
			dataCell = dataRow.createCell(4);
			dataCell.setCellValue(list.get(i).getContent());
			dataCell = dataRow.createCell(5);
			dataCell.setCellValue(list.get(i).getWriter());
			dataCell = dataRow.createCell(6);
			dataCell.setCellValue(list.get(i).getHitCnt());
			dataCell = dataRow.createCell(7);
			if(list.get(i).getStatus().equals("Y")) {
				dataCell.setCellValue("답변완료");
			}if(list.get(i).getStatus().equals("S")) {
				dataCell.setCellValue("답변 대기중");
			}
			dataCell = dataRow.createCell(8);
			dataCell.setCellValue(list.get(i).getRegDate());
			dataCell.setCellStyle(rowCellStyle);
			dataCell = dataRow.createCell(9);
			dataCell.setCellValue(list.get(i).getDeleteYn());
			
		}
	
		String fileName=null;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now= sdf.format(date);
	
		fileName ="ExcelFile_"+now+".xlsx";
		
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	    wb.write(response.getOutputStream());
	    
	}
	@RequestMapping(value = "event/main",method = RequestMethod.GET)
	public String getEventMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception{
		
		List<EventVO> list = adminService.selectEventList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectEventTotalCnt(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/event/main";
	}
	@RequestMapping(value = "event/write",method = RequestMethod.GET)
	public String getEventWrite()throws Exception{
		
		return "admin/event/write";
	}
	@RequestMapping(value = "event/detail",method = RequestMethod.GET)
	public String getEventDetail(@RequestParam("eventNo")int eventNo,Model model)throws Exception{
		
		EventVO eventVO = new EventVO();
		eventVO.setEventNo(eventNo);
		
		model.addAttribute("eventVO",adminService.selectEventVO(eventNo));
		
		return "admin/event/detail";
	}

	@ResponseBody
	@RequestMapping(value = "event/modify",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postEventModify(@RequestParam("eventNo")int eventNo, @RequestParam("title")String title,@RequestParam("content")String content)throws Exception{
		
		EventVO eventVO = new EventVO();
		eventVO.setEventNo(eventNo);
		eventVO.setTitle(title);
		eventVO.setContent(content);
		
		adminService.updateEventModify(eventVO);
		
		return "수정되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "event/delete",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postEventDelete(@RequestParam("eventNo")int eventNo)throws Exception{
		adminService.updateEventDelete(eventNo);
		
		return "삭제되었습니다.";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "event/write",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postEventWrite(@RequestParam("title")String title,@RequestParam("content")String content)throws Exception{
		
		EventVO eventVO = new EventVO();
		eventVO.setTitle(title);
		eventVO.setContent(content);
		
		adminService.insertEventData(eventVO);
		
		return "이벤트가 등록되었습니다.";
	}
	

	@RequestMapping(value = "ckeditor/upload",method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {
		
		//Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file =multiFile.getFile("upload");
		
		//파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 &&   StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						//파일 이름 설정
						String fileName = file.getName();
						//바이트 타입설정
						byte[] bytes;
						//파일을 바이트 타입으로 변경
						bytes = file.getBytes();
						//파일이 실제로 저장되는 경로 
						String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
						
						//저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						//파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");
						
						//파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/resources/ckimage/" + fileName;
						
						//생성된 json 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
						
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
			return null;
	}
	

	
	@RequestMapping(value = "notice/main",method = RequestMethod.GET)
	public String getNoticeMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception{
		List<NoticeVO> list = adminService.selectNoticeList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectNoticeTotalCnt(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/notice/main";
	}
	@RequestMapping(value = "notice/detail",method =  RequestMethod.GET)
	public String getNoticeDetail(@RequestParam("noticeNo")int noticeNo,Model model)throws Exception{
		
		NoticeVO noticeVO = adminService.selectNoticeVO(noticeNo);
		model.addAttribute("noticeVO",noticeVO);
		
		List<NoticeFileVO> file = adminService.selectNoticeFile(noticeNo);
		model.addAttribute("file",file);
		
		return "admin/notice/detail";
	}
	
	
	@RequestMapping(value = "notice/write",method = RequestMethod.GET)
	public String getNoticeWrite()throws Exception{
		
		return "admin/notice/write";
	}
	@ResponseBody
	@RequestMapping(value = "notice/write",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postNoticeWrite(@RequestParam("title")String title,@RequestParam("content")String content,Model model)throws Exception{
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setTitle(title);
		noticeVO.setContent(content);
		
		adminService.insertNoticeWrite(noticeVO);
		
		return "등록되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "notice/upload",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postNoticeUpload(@RequestParam("fileContent")List<MultipartFile>multipartFile)throws Exception{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map =null;
		
		if(multipartFile.get(0).getSize()>0 &&!multipartFile.get(0).getOriginalFilename().equals("")) {
			
			for(int i=0; i<multipartFile.size(); i++) {
				map = new HashMap<String, Object>();
				
				String originFileName = multipartFile.get(i).getOriginalFilename();
				String extendFileName = originFileName.substring(originFileName.lastIndexOf("."));
				String storedFileName = UUID.randomUUID()+extendFileName;
				
				File targetFile = new File(uploadPath+"notice\\"+storedFileName);
				multipartFile.get(i).transferTo(targetFile);
				
				map.put("originFileName",originFileName );
				map.put("storedFileName", storedFileName);
				map.put("fileSize",multipartFile.get(i).getSize() );
				
				list.add(map);
			
			}
			
			for(int i=0; i<list.size(); i++) {
				adminService.insertNoticeFile(list.get(i));
			}
		}
		
		
		return "파일이 추가되었습니다.";
	}
	
	@RequestMapping(value = "notice/filedown",method =  RequestMethod.POST)
	public void postNoticeFileDown(@RequestParam Map<String,Object>map,HttpServletResponse response)throws Exception{
		Map<String, Object> resultMap = adminService.selectNoticeFileNoMap(map);
		String originFileName = (String)resultMap.get("originFileName");
		String storedFileName = (String)resultMap.get("storedFileName");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(uploadPath+"notice\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLengthLong(fileByte.length);
		response.setHeader("content-Disposition", "attachment; fileName=\"" +java.net.URLEncoder.encode(originFileName,"UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}	
	@ResponseBody
	@RequestMapping(value = "notice/filedel",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postDeleteNoticeFile(@RequestParam("fileNo")int fileNo)throws Exception{
		adminService.deleteNoticeFile(fileNo);
		 return "해당 파일이 삭제되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "notice/modify",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postModifyNotice(@RequestParam("noticeNo")int noticeNo,@RequestParam("title")String title,@RequestParam("content")String content)throws Exception{
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNoticeNo(noticeNo);
		noticeVO.setTitle(title);
		noticeVO.setContent(content);
		
		adminService.updateNoticeVO(noticeVO);
		return "수정되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "notice/delete",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postDeleteNotice(@RequestParam("noticeNo")int noticeNo)throws Exception{
		adminService.deleteNoticeVO(noticeNo);
		
		return "삭제되었습니다.";
	}
	
	
	@RequestMapping(value = "question/main",method = RequestMethod.GET)
	public String getQuestionMain(@ModelAttribute("scri")SearchCriteria scri,Model model)throws Exception{
		List<InquiryVO> list = adminService.selectInquiryList(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.selectInquiryTotalCnt(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "admin/question/main";
	}
	@RequestMapping(value = "question/detail",method = RequestMethod.GET)
	public String getQuestionDetail(@RequestParam("inquiryNo")int inquiryNo , Model model)throws Exception{
		InquiryVO inquiryVO = adminService.selectByInquiryNo(inquiryNo);
		model.addAttribute("inquiryVO",inquiryVO);
		
		List<InquiryFileVO> file = adminService.selectInquiryFile(inquiryNo);
		model.addAttribute("file",file);
		
		return "admin/question/detail";
	}
	
	@RequestMapping(value = "question/write",method = RequestMethod.GET)
	public String getQuestionWrite(Model model,@RequestParam("inquiryNo")int inquiryNo)throws Exception{
		AnswerVO answerVO = adminService.selectAnswerByInquiryNo(inquiryNo);
		model.addAttribute("answerVO",answerVO);
		
		return "admin/question/write";
	}
	
	@ResponseBody
	@RequestMapping(value = "question/write",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String getQuestionWrite(@RequestParam("inquiryNo")int inquiryNo
								,@RequestParam("title")String title
								,@RequestParam("content")String content)throws Exception{
		
		AnswerVO answerVO = new AnswerVO();
		answerVO.setTitle(title);
		answerVO.setContent(content);
		answerVO.setInquiryNo(inquiryNo);
		
		adminService.insertAnswerByInquiryNo(answerVO);
		
		//상태값을 (답변완료)로 변경
		adminService.updateInquiryStatus(inquiryNo);
		
		return "등록되었습니다.";
	}
	@ResponseBody
	@RequestMapping(value = "question/update",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String getQuestionUpdate(@RequestParam("inquiryNo")int inquiryNo
								,@RequestParam("title")String title
								,@RequestParam("content")String content)throws Exception{
		
		AnswerVO answerVO = new AnswerVO();
		answerVO.setTitle(title);
		answerVO.setContent(content);
		answerVO.setInquiryNo(inquiryNo);
		
		adminService.updateAnswerByInquiryNo(answerVO);
		
		return "수정되었습니다.";
	}
	
	@ResponseBody
	@RequestMapping(value = "question/delete",method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String getQuestionDelete(@RequestParam("inquiryNo")int inquiryNo)throws Exception{
		adminService.deleteAnswerByInquiryNo(inquiryNo);
		
		return "삭제되었습니다.";
	}
}
