package toolman.favorite.model;

import java.util.List;


import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;

public class FavoriteService {
	private FavoriteDAO_interface dao;

	public FavoriteService() {
		dao = new FavoriteDAO();
	}

	public List<FavoriteVO>  getAllFavorite(){
    	List<FavoriteVO> favoritelist = dao.getAllFavorite();
    	return favoritelist;
    }
	
	public void deleteFavorite(Integer f_id) {
		dao.delete(f_id);
	}
	
	
	
	public FavoriteVO addFavorite(String c_id, Integer m_id) {

		FavoriteVO favoriteVO = new FavoriteVO();

		
		

		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		favoriteVO.setCdataVO(cdataVO);

		MdataVO mdataVO = new MdataVO();
		mdataVO.setM_id(m_id);
		favoriteVO.setMdataVO(mdataVO);
	
		dao.insert(favoriteVO);

		return favoriteVO;
	}

}
