package toolman.favorite.model;

public class FavoriteService {
	private FavoriteDAO_interface dao;

	public FavoriteService() {
		dao = new FavoriteJDBCDAO();
	}

	
	
	
	public FavoriteVO addFavorite(String c_id, Integer m_id) {

		FavoriteVO favoriteVO = new FavoriteVO();

		
		favoriteVO.setC_id(c_id);
		favoriteVO.setM_id(m_id);
		
		dao.insert(favoriteVO);

		return favoriteVO;
	}

}
