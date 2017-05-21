package toolman.order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import toolman.cdata.model.CdataVO;
import toolman.favorite.model.FavoriteVO;
import toolman.opro.model.OproVO;




public class OrderService {

	OrderDAO_Interface dao = null;
	
	public OrderService() {
		dao = new OrderDAO();
	}
	
	public void insert(OrderVO orderVO){
		dao.insert(orderVO);
	}
	public OrderVO getById(Integer o_id){
		return dao.getById(o_id);
	}

    public List<OrderVO>  getAllOrder(){ 
    	List<OrderVO> orderlist = dao.getAllOrder();
    	return orderlist;
    }
    public List<OrderVO>  getOrderByDate(Timestamp o_bdate1, Timestamp o_bdate2){
    	
    	List<OrderVO> orderlist = dao.getOrderByDate(o_bdate1, o_bdate2);
    	return orderlist;
    }
    public String getOrderBySnameAndDateJson(String s_name,Timestamp o_tdate1,Timestamp o_tdate2){
    	
    	List<OrderVO> orderlist = dao.getOrderBySnameAndDate(s_name,o_tdate1, o_tdate2);
    	List list = new ArrayList();
		orderlist = dao.getBySname(s_name);
		
		for(int i=0; i<orderlist.size();i++){
			
			OrderVO orderVO = orderlist.get(i);
			Timestamp o_tdatestamp = orderVO.getO_tdate();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String o_tdate = df.format(o_tdatestamp);
			Set<OproVO> opros = orderVO.getOpros();						
			//map outside opro, so only get the last 1 opro, just as what I want
			Map map = new HashMap();
			map.put("o_tdate", o_tdate);
			map.put("o_bname", orderVO.getB_name());
			map.put("m_id", orderVO.getM_id().getM_id());
			map.put("c_id", orderVO.getC_id().getC_id());
			map.put("o_id", orderVO.getO_id());
			
			for(OproVO oproVO : opros){
				String	opro = oproVO.getO_pro();	
				map.put("opros", opro);
				System.out.println(opro);
			}
			map.put("o_location", orderVO.getO_location().substring(0,6));
			map.put("s_name", orderVO.getS_name());
			map.put("c_rating", orderVO.getC_rating());
			map.put("m_rating",orderVO.getM_rating());
			map.put("sa_onote",orderVO.getSa_onote());
			list.add(map);
			
		}		
		String ojasonstring = JSONValue.toJSONString(list);
//		out.write(ojasonstring);
		System.out.println(ojasonstring);
	
		return ojasonstring;
    }// end  getOrderBySnameAndDateJson
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
//    
//    public Set<CdataVO> getOrderByC(String c_id) {
//    	OrderVO orderVO = new OrderVO();
//		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_id(c_id);
//		orderVO.setC_id(cdataVO);
//		
//		return dao.getOrderByC(c_id);
//	}
    
    
    
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
			if((orderVO2.getM_rating()!=null) && (orderVO2.getC_rating()!=null)&&(!"已完成".equals(orderVO2.getS_name()))){
	        dao = new OrderDAO();  
	    	dao.updateOrderSnameToFishedById(orderVO2.getO_id());
	    	
			}
		 }
    }
    public void updateOrderSnameToInProgressById(Integer o_id){
    	dao.updateOrderSnameToInProgressById(o_id);	
    }
    public void updateOrderSnameToUnfinishedReviewById(){
    	dao = new OrderDAO();
		List<OrderVO> orders = dao.getAllOrder();
		for(OrderVO orderVO2 : orders) {
			
			if((orderVO2.getM_rating()==null&orderVO2.getC_rating()!=null)||(orderVO2.getM_rating()!=null&orderVO2.getC_rating()==null
					||orderVO2.getM_rating()==null && orderVO2.getC_rating()==null)){
		        dao = new OrderDAO();  
		    	dao.updateOrderSnameToUnfinishedReviewById(orderVO2.getO_id());
		    					}
			
		    		
						
	 }
}
    public int updateOrderSaonote(Integer o_id, String sa_onote){
    	return dao.updateOrderSaonote(o_id,sa_onote);
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
    public String getAllOrderJson(){
    	List list = new ArrayList();
		List<OrderVO> orderlist = new ArrayList<OrderVO>();
		OrderService orderservice = new OrderService();
		orderlist = orderservice.getAllOrder();
		
		for(int i=0; i<orderlist.size();i++){
			
			OrderVO orderVO = orderlist.get(i);
			Timestamp o_tdatestamp = orderVO.getO_tdate();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String o_tdate = df.format(o_tdatestamp);
			
			String o_bname = orderVO.getB_name();
			String c_id = orderVO.getC_id().getC_id();
			Integer m_id = orderVO.getM_id().getM_id();
			Integer o_id  = orderVO.getO_id();
			Set<OproVO> opros = orderVO.getOpros();
			
			String o_location = orderVO.getO_location().substring(0,6);
			String s_name = orderVO.getS_name();
			Integer c_rating = orderVO.getC_rating();
			Integer m_rating = orderVO.getM_rating();
			String sa_onote = orderVO.getSa_onote();
			//map outside opro, so only get the last 1 opro, just as what I want
			Map map = new HashMap();
			map.put("o_tdate", o_tdate);
			map.put("o_bname", o_bname);
			map.put("m_id", m_id);
			map.put("c_id", c_id);
			map.put("o_id", o_id);
			for(OproVO oproVO : opros){
				String	opro = oproVO.getO_pro();	
				map.put("opros", opro);
				System.out.println(opro);
			}
			map.put("o_location", o_location);
			map.put("s_name", s_name);
			map.put("c_rating", c_rating);
			map.put("m_rating", m_rating);
			map.put("sa_onote",sa_onote);
			list.add(map);
			
		}		
		String ojasonstring = JSONValue.toJSONString(list);
//		out.write(ojasonstring);
		System.out.println(ojasonstring);
	
		return ojasonstring;
    	
    }	
    
    public String getBySnameJson(String s_name){
    		List list = new ArrayList();
    		List<OrderVO> orderlist = new ArrayList<OrderVO>();
    		orderlist = dao.getBySname(s_name);
    		
    		for(int i=0; i<orderlist.size();i++){
    			
    			OrderVO orderVO = orderlist.get(i);
    			Timestamp o_tdatestamp = orderVO.getO_tdate();
    			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			String o_tdate = df.format(o_tdatestamp);
    			
    			String o_bname = orderVO.getB_name();
    			String c_id = orderVO.getC_id().getC_id();
    			Integer m_id = orderVO.getM_id().getM_id();
    			Integer o_id  = orderVO.getO_id();
    			Set<OproVO> opros = orderVO.getOpros();
    			
    			String o_location = orderVO.getO_location().substring(0,6);
    			s_name = orderVO.getS_name();
    			Integer c_rating = orderVO.getC_rating();
    			Integer m_rating = orderVO.getM_rating();
    			String sa_onote = orderVO.getSa_onote();
    			//map outside opro, so only get the last 1 opro, just as what I want
    			Map map = new HashMap();
    			map.put("o_tdate", o_tdate);
    			map.put("o_bname", o_bname);
    			map.put("m_id", m_id);
    			map.put("c_id", c_id);
    			map.put("o_id", o_id);
    			for(OproVO oproVO : opros){
    				String	opro = oproVO.getO_pro();	
    				map.put("opros", opro);
    				System.out.println(opro);
    			}
    			map.put("o_location", o_location);
    			map.put("s_name", s_name);
    			map.put("c_rating", c_rating);
    			map.put("m_rating", m_rating);
    			map.put("sa_onote",sa_onote);
    			list.add(map);
    			
    		}		
    		String ojasonstring = JSONValue.toJSONString(list);
//    		out.write(ojasonstring);
    		System.out.println(ojasonstring);
    	
    		return ojasonstring;
    }
// -------------------------rating
    
    public 	OrderVO  getRate(Integer o_id) {
		return  dao.getRate(o_id);

	}
    
    public Integer updateOrderRate(Integer m_rating, Integer c_rating, String ca_des, String ma_des,Integer o_id) {
    	Integer  count = dao.updateOrderRate( m_rating,  c_rating, ca_des,  ma_des, o_id);
    	return  count;
    }        
    public Integer updateOrderRateByC(Integer m_rating, String ca_des,Integer o_id) {
    	Integer  count = dao.updateOrderRateByC( m_rating, ca_des, o_id);
    	return  count;
    } 
    public Integer updateOrderRateByM( Integer c_rating, String ma_des,Integer o_id) {
    	Integer  count = dao.updateOrderRateByM(  c_rating,   ma_des, o_id);
    	return  count;
    } 
    
    
    
    }

