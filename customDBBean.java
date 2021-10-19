 package magicwepapp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

public class customDBBean {

private static customDBBean instance;
    
    
    private customDBBean(){}
    public static customDBBean getInstance(){
        if(instance==null)
            instance=new customDBBean();
        return instance;
    }
  
    
    
    public void insertCustom(customBean custom) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            
            conn = DBconnection.getConnection();
            
            
            conn.setAutoCommit(false);
            
            StringBuffer sql = new StringBuffer();
            sql.append("insert into JSP_MEMBER values");
            sql.append("(?, ?, ?, ?, ?)");        
            
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, custom.getId());
            pstmt.setString(2, custom.getPwd());
            pstmt.setString(3, custom.getNickname());
            pstmt.setString(4, custom.getEmail());
            pstmt.setInt(5, custom.getNum());            
            pstmt.executeUpdate();
            
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }  
    } 
}



