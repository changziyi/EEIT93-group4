package toolman.favorite.model;

import java.util.List;

public interface FavoriteDAO_interface {
	
    public void insert(FavoriteVO favoriteVO);
    public void delete(Integer F_id);
    public FavoriteVO findByPrimaryKey(Integer F_id);
    public List<FavoriteVO> getAllFavorite();

}
