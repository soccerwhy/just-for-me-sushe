//package com.tang.dao;
//
//import com.example.springbootbase.learn.DVDInfoData;
//
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.regex.Pattern;
///**
// * @author Mr Tang
// * 这个类被用来处理来自数据库的DVD数据，增删改查以及其他功能的实现。
// * 继承自DBUtilsBaseDao,简化数据库操作
// */
//public class DvdDaoS{
//    /**
//     * @author Mr Tang
//     * @throws SQLException
//     * @expression This method is used to show all DVD information to users.
//     *It must be do this...
//     */
//    @SuppressWarnings("unchecked")
//    public static  List<DVDInfoData> ShowAllDVD() throws SQLException{
//        String sql="SELECT * FROM dvddb order by dvdname desc" ;
//        Object[] params= {};
//        return (List<DVDInfoData>) JDBCUtil.query(sql, params, new BeanListHandler(DVDInfoData.class));
//    }
//    /**
//     *
//     *2018年10月21日下午11:38:46
//     *这个函数的功能是添加DVD信息
//     */
//    public static int addDVD(String dvdNum,String dvdName,String dvdstate,String dvdtype,String dvdphoto) throws SQLException {
//        int result=0;
//        if(dvdNum!=""&&dvdName!="") {
//            Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
//            if(pattern.matcher(dvdNum).matches()){
//                String sql="INSERT INTO dvddb (dvdnum,dvdname,dvdstate,dvdtype,dvdphoto) VALUES (?,?,?,?,?)" ;
//                Object[] params=new Object[]{
//                        dvdNum,
//                        dvdName,
//                        dvdstate,
//                        dvdtype,
//                        dvdphoto
//                };
//                result=JDBCUtil.update(sql, params);
//            }
//        }
//        return result;
//    }
//}