package toolman.favorite.model;

import java.util.List;

import toolman.order.model.OrderVO;

public class FavoriteService {
	private FavoriteDAO_interface dao;

	public FavoriteService() {
		dao = new FavoriteJDBCDAO();
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

		
		favoriteVO.setC_id(c_id);
		favoriteVO.setM_id(m_id);
		
		dao.insert(favoriteVO);

		return favoriteVO;
	}

}
