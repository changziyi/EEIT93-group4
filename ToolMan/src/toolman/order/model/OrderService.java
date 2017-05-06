package toolman.order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;




public class OrderService {

	OrderDAO_Interface dao = null;
	
	public OrderService() {
		dao = new OrderDAO();
	}
	
	public void insert(OrderVO orderVO){
		dao.insert(orderVO);
	}
	

    public List<OrderVO>  getAllOrder(){
    	List<OrderVO> orderlist = dao.getAllOrder();
    	return orderlist;
    }
    public List<OrderVO>  getOrderByDate(Timestamp o_bdate1, Timestamp o_bdate2){
    	
    	List<OrderVO> orderlist = dao.getOrderByDate(o_bdate1, o_bdate2);
    	return orderlist;
    }
    public List<OrderVO>  getOrderByM(Integer m_id){
    	
    	List<OrderVO> orderlist = dao.getOrderByM(m_id);
    	return orderlist;
    }
    public List<OrderVO>  getAllOrderByMAndDate(Integer m_id,Timestamp o_bdate1, Timestamp o_bdate2){
    	List<OrderVO> orderlist = dao.getAllOrderByMAndDate(m_id, o_bdate1, o_bdate2);
    	return orderlist;
    }
    public List<OrderVO>  getOrderByC(String c_id){
    	List<OrderVO> orderlist = dao.getOrderByC(c_id);
    	return orderlist;
    }
    public List<OrderVO>  getOrderByCAndDate(String c_id,Timestamp o_bdate1, Timestamp o_bdate2){
    	List<OrderVO> orderlist = dao.getOrderByCAndDate(c_id, o_bdate1, o_bdate2);
    	return orderlist;
    }
    public List<OrderVO>  getOrderByCAndSname(String c_id, String s_name){
    	List<OrderVO> orderlist = dao.getOrderByCAndSname(c_id, s_name);
    	return orderlist;
    }
    public List<OrderVO>  getOrderByMAndSname(Integer m_id, String s_name){
    	List<OrderVO> orderlist = dao.getOrderByMAndSname(m_id, s_name);
    	return orderlist;
    }
    public List<OrderVO>  getAllOrderByMAndDateAndSname(Integer m_id,Timestamp o_bdate1, Timestamp o_bdate2,String s_name){
    	List<OrderVO> orderlist = dao.getAllOrderByMAndDateAndSname(m_id, o_bdate1, o_bdate2, s_name);
    	return orderlist;
    }
    public List<OrderVO>  getAllOrderByCAndDateAndSname(String c_id,Timestamp o_bdate1, Timestamp o_bdate2,String s_name){
    	List<OrderVO> orderlist = dao.getAllOrderByCAndDateAndSname(c_id, o_bdate1, o_bdate2, s_name);
    	return orderlist;
    }        
    public void deleteById(Integer o_id){
    	dao.deleteById(o_id);
    }
    public void updateOrder(OrderVO orderVO){
    	dao.updateOrder(orderVO);
    }
    
    public void updateOrderSnameToFishedById(){
	    	dao = new OrderDAO();
			List<OrderVO> orders = dao.getAllOrder();
			for(OrderVO orderVO2 : orders) {
			if(orderVO2.getM_rating()!=null && orderVO2.getC_rating()!=null){
	        dao = new OrderDAO();  
	    	dao.updateOrderSnameToFishedById(orderVO2.getO_id());
			}
		 }
    }
    public void updateOrderSnameToUnfinishedReviewById(){
    	dao = new OrderDAO();
		List<OrderVO> orders = dao.getAllOrder();
		for(OrderVO orderVO2 : orders) {
			if((orderVO2.getM_rating()==null&orderVO2.getC_rating()!=null)||(orderVO2.getM_rating()!=null&orderVO2.getC_rating()==null)){
		        dao = new OrderDAO();  
		    	dao.updateOrderSnameToUnfinishedReviewById(orderVO2.getO_id());
		    	}
	 }
}
    public void deleteExpiredOrder(){

            //examine all orders and delete expired orders
    		dao = new OrderDAO();
    		List<OrderVO> orders = dao.getAllOrder();
            for(OrderVO orderVO2 : orders) {
            	dao = new OrderDAO();           	
             	Long currenttime = System.currentTimeMillis();
            	Long orderdate = orderVO2.getO_tdate().getTime();
            	Long exptime = orderVO2.getReq_exp();
                if(orderdate-currenttime  >= exptime ) {
                	dao.updateSnameAsDeletedById(orderVO2.getO_id());
                }
            }
        }
    
// -------------------------rating
    
    public 	OrderVO  getRate(Integer o_id) {
		return  dao.getRate(o_id);

	}
    
    public Integer updateOrderRate(Integer m_rating, Integer c_rating, String ca_des, String ma_des,Integer o_id) {
    	Integer  count = dao.updateOrderRate( m_rating,  c_rating, ca_des,  ma_des, o_id);
    	return  count;
    }        
    	
    	
    	
//		OrderVO orderVO = new OrderVO();
//
//		orderVO.setO_id(o_id);
//
//		orderVO.setM_rating(m_rating);
//		orderVO.setC_rating(c_rating);
//		orderVO.setCa_des(ca_des);
//		orderVO.setMa_des(ma_des);
//
//		
//		dao.updateOrder(orderVO);
//
//		return dao.getRate(o_id);
//	}
    
    }

