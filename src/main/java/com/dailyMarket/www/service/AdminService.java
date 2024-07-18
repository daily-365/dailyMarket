package com.dailyMarket.www.service;

import java.util.List;

import com.dailyMarket.www.utils.SearchCriteria;
import com.dailyMarket.www.vo.AdminVO;
import com.dailyMarket.www.vo.BusiFileVO;
import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.ProductFileVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;

public interface AdminService {

	public boolean adminLogin(AdminVO adminVO)throws Exception;
	
	public List<ProductVO>selectProductList(ProductVO productVO)throws Exception;
	public int selectProductTotalCount(ProductVO productVO)throws Exception;
	public ProductVO selectProductByProductNo(int productNo)throws Exception;
	public void deleteProduct(int productNo)throws Exception;
	public void updateProduct(int productNo)throws Exception;
	public List<ProductFileVO>selectProductFile(int productNo)throws Exception;
	
	public List<BusiVO>selectBusiList(BusiVO busiVO)throws Exception;
	public BusiVO selectBusiByBusiNo(int busiNo)throws Exception;
	public void updateBusiState(BusiVO busiVO)throws Exception;
	public int selectBusiTotalCount(BusiVO busiVO)throws Exception;
	public List<BusiFileVO>selectBusiFile(int busiNo)throws Exception;
	public List<StoreFileVO>selectStoreFile(int busiNo)throws Exception;
}
