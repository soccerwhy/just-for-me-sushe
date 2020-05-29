package com.example.springbootbase.util;

import javax.servlet.http.HttpServletRequest;

public class Page {


    /**当前第几页*/
    public int index ;
    /**总记录数*/
    public int rows;
    /**分页大小，每页显示的行数*/
    public int size = 12;
    /**总页数*/
    public int pages;


    public static Integer  getLimitNumber(Integer pageIndex){
        return (pageIndex - 1) * 12;
    }

    public static Page getPage(HttpServletRequest request, Integer listCount) {
        String pageIndex = request.getParameter("pageIndex");//第几页

        Page page = new Page();

        if(pageIndex == null || "".equals(pageIndex)) {
            page.index = 1;
        }else {
            page.index = Integer.parseInt(pageIndex);
        }
        page.size = 12;
        page.rows = listCount;
        page.pages = (page.rows / 12) + 1;
        return page;
    }


}
