package com.dailyMarket.www.dao;

import java.util.List;
import java.util.Map;

import com.dailyMarket.www.vo.BusiVO;
import com.dailyMarket.www.vo.CarFileVO;
import com.dailyMarket.www.vo.CarVO;
import com.dailyMarket.www.vo.EstateFileVO;
import com.dailyMarket.www.vo.EstateVO;
import com.dailyMarket.www.vo.JobFileVO;
import com.dailyMarket.www.vo.JobVO;
import com.dailyMarket.www.vo.MenuVO;
import com.dailyMarket.www.vo.ProductVO;
import com.dailyMarket.www.vo.StoreFileVO;
import com.dailyMarket.www.vo.UserVO;

public interface UserDAO {

	public void insertUserRegist(UserVO userVO)throws Exception;
	public int selectUserLogin(UserVO userVO)throws Exception;
	public void insertUserProduct(ProductVO productVO)throws Exception;
	public void insertUserFile(Map<String,Object> map)throws Exception;
	public List<ProductVO> selectProductList(ProductVO productVO)throws Exception;
	public List<ProductVO> selectProductDetail(int productNo)throws Exception;
	public List<BusiVO> selectBusiList(BusiVO busiVO)throws Exception;
	public BusiVO selectByBusiNo(int busiNo)throws Exception;
	public List<StoreFileVO> selectStoreList(int busiNo)throws Exception;
	public List<MenuVO> selectMenuList(int busiNo)throws Exception;
	public void insertEstateOne(EstateVO estateVO)throws Exception;
	public void insertEstateFile(Map<String, Object> map)throws Exception;
	public void updateEstateTwo(EstateVO estateVO)throws Exception;
	public void updateEstateThree(EstateVO estateVO)throws Exception;
	public List<EstateVO>selectEstateList(EstateVO estateVO)throws Exception;
	public List<EstateFileVO>selectEstateFile(EstateFileVO estateFileVO)throws Exception;
	public EstateVO selectEstateDetail(int esNo)throws Exception;
	public List<EstateFileVO> selectEstateFileDetail(int esNo)throws Exception;
	public void insertCarRegist(CarVO carVO)throws Exception;
	public void insertCarFile(Map<String, Object>map)throws Exception;
	public List<CarVO>selectCarList(CarVO carVO)throws Exception;
	public List<CarFileVO>selectCarFile(CarFileVO carFileVO)throws Exception;
	public CarVO selectCarVO(int carNo)throws Exception;
	public List<JobVO>selectJobList(JobVO jobVO)throws Exception;
	public List<JobFileVO>selectJobFile(JobFileVO jobFileVO)throws Exception;
	public JobVO selectJobByNo(int jobNo)throws Exception;
}
