package toolman.building.model;

import toolman.mdata.model.MdataDAO_interface;

public class BuildingService {

	private BuildingDAO_Interface dao;
	
	public BuildingVO getBuildingByType(Integer h_type){
		return dao.getBuildingByType(h_type);
	}
	
}
