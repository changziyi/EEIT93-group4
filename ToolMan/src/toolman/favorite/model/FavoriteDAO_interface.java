package toolman.favorite.model;

import java.util.List;

public interface FavoriteDAO_interface {
	
    public void insert(FavoriteVO favoriteVO);
    public void delete(Integer f_id);
    public FavoriteVO findByPrimaryKey(Integer f_id);
    public List<FavoriteVO> getAllFavorite();

}
