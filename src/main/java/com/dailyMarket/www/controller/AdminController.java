package com.dailyMarket.www.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dailyMarket.www.service.AdminService;
import com.dailyMarket.www.utils.PageMaker;
import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;


@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {

	private static final Logger logger= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "main",method =RequestMethod.GET)
	public String getAdminMain()throws Exception {
		logger.info("GET ADMIN MAIN");
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
	
	@RequestMapping(value = "product/main",method =RequestMethod.GET)
	public String getProductMain(@ModelAttribute("productVO")ProductVO productVO,Model model)throws Exception {
		
		List<ProductVO> list = adminService.selectProductList(productVO);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(productVO);
		pageMaker.setTotalCount(adminService.selectProductTotalCount(productVO));
		
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
	public String getStroeMain(Model model ,@ModelAttribute("busiVO")BusiVO busiVO)throws Exception {
		List<BusiVO> list =  adminService.selectBusiList(busiVO);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(busiVO);
		pageMaker.setTotalCount(adminService.selectBusiTotalCount(busiVO));
		
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
		
		return "admin/store/detail";
	}
	@ResponseBody
	@RequestMapping(value = "store/detail/update" ,method = RequestMethod.POST,produces = "application/text; charset=UTF-8;")
	public String postStoreDetailUpdate(@RequestParam("busiNo")int busiNo,@RequestParam("state")String state,BusiVO busiVO)throws Exception{
		String result ="";
		
		busiVO.setBusiNo(busiNo);
		busiVO.setState(state);
		
		if(state.equals("Y")) {
			adminService.updateBusiState(busiVO);
			result ="승인 되었습니다.";
		}if(state.equals("N")) {
			adminService.updateBusiState(busiVO);
			result ="요청 되었습니다.";
		}if(state.equals("S")) {
			adminService.updateBusiState(busiVO);
			result ="승인이 취소 되었습니다.";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "excelDown",method = RequestMethod.POST )
	public String excelDown(@RequestParam("keyword")String keyword
							,@RequestParam("searchType")String searchType
							,@RequestParam("startDate")String startDate
							,@RequestParam("endDate")String endDate
							,HttpServletResponse response
							,HttpServletRequest request
							)throws Exception{
		BusiVO busiVO = new BusiVO();
		busiVO.setKeyword(keyword);
		busiVO.setSearchType(searchType);
		busiVO.setStartDate(startDate);
		busiVO.setEndDate(endDate);
		
		List<BusiVO> list = adminService.selectBusiList(busiVO);
		
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
		totalCntCell.setCellValue("총 데이터 건수 : "+adminService.selectBusiTotalCount(busiVO)+" 건");
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
			dataCell.setCellValue(list.get(i).getState());
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
	    
		
		return "EXCEL FILE DOWNLOAD SUCCESS";
		
	}
	
	
	@RequestMapping(value = "job/main",method =RequestMethod.GET)
	public String getjobMain()throws Exception {
		return "admin/job/main";
	}
	
	
	
	@RequestMapping(value = "estate/main",method =RequestMethod.GET)
	public String getEstateMain()throws Exception {
		return "admin/estate/main";
	}
	
	
	
	@RequestMapping(value = "car/main",method =RequestMethod.GET)
	public String getCartMain()throws Exception {
		return "admin/car/main";
	}
	
	
	
	
	@RequestMapping(value = "user/main",method =RequestMethod.GET)
	public String getUserMain()throws Exception {
		return "admin/user/main";
	}
}
