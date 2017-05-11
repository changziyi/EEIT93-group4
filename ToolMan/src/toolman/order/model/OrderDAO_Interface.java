package toolman.order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import toolman.cdata.model.CdataVO;



public interface OrderDAO_Interface {
    public void insert(OrderVO orderVO);
    public List<OrderVO>  getAllOrder();
    public List<OrderVO>  getOrderByDate(Timestamp o_bdate1, Timestamp o_bdate2);
    public List<OrderVO>  getOrderByM(Integer m_id);
    public List<OrderVO>  getAllOrderByMAndDate(Integer m_id,Timestamp o_bdate1, Timestamp o_bdate2);
    public List<OrderVO>  getOrderByC(String c_id);
    public List<OrderVO>  getOrderByCAndDate(String c_id,Timestamp o_bdate1, Timestamp o_bdate2);
    public List<OrderVO>  getOrderByCAndSname(String c_id, String s_name);
    public List<OrderVO>  getOrderByMAndSname(Integer m_id, String s_name);
    public List<OrderVO>  getAllOrderByMAndDateAndSname(Integer m_id,Timestamp o_bdate1, Timestamp o_bdate2,String s_name);
    public List<OrderVO>  getAllOrderByCAndDateAndSname(String c_id,Timestamp o_bdate1, Timestamp o_bdate2,String s_name);        
    public Integer deleteById(Integer o_id);
    public void updateSnameAsDeletedById(Integer o_id);
    public void updateOrderSnameToFishedById(Integer o_id);
    public void updateOrderSnameToUnfinishedReviewById(Integer o_id);
    public void updateOrder(OrderVO orderVO);

   //----------------------------ratting 
    
    public OrderVO  getRate(Integer o_id);
    public Integer updateOrderRate(Integer m_rating, Integer c_rating,String ca_des, String ma_des,Integer o_id);



}
