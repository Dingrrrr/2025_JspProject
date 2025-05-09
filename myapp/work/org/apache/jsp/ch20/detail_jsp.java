/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.93
 * Generated at: 2025-03-28 03:43:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ch20;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ch20.MUtil;
import ch20.BusanThemeBean;

public final class detail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(3);
    _jspx_imports_classes.add("ch20.BusanThemeBean");
    _jspx_imports_classes.add("ch20.MUtil");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      ch20.BusanThemeMgr mgr = null;
      mgr = (ch20.BusanThemeMgr) _jspx_page_context.getAttribute("mgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mgr == null){
        mgr = new ch20.BusanThemeMgr();
        _jspx_page_context.setAttribute("mgr", mgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\"/>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<title>부산테마여행</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/common.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div id=\"wrap\">\r\n");
      out.write("        <!-- header -->\r\n");
      out.write("        <header id=\"header\">\r\n");
      out.write("            <!-- nav -->\r\n");
      out.write("            <nav id=\"nav\">\r\n");
      out.write("                <h3 class=\"logo\">\r\n");
      out.write("                    <span>부산</span>\r\n");
      out.write("                </h3>\r\n");
      out.write("            </nav>\r\n");
      out.write("        </header>\r\n");
      out.write("        <!-- main -->\r\n");
      out.write("        <main class=\"common_wrap\" id=\"theme_detail_page\">\r\n");
      out.write("            <div id=\"container\">\r\n");
      out.write("                <section class=\"common_box content_box\">\r\n");
      out.write("                    <div class=\"common_title theme_title\">\r\n");
      out.write("                        <h1>테마 여행 상세보기</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"theme_field\">\r\n");
      out.write("                       ");

                       		int ucSeq = MUtil.parseInt(request, "ucSeq");
                       		BusanThemeBean bean = mgr.getBusanThemeDetail(ucSeq);
                       		if(bean != null){
                       
      out.write("\r\n");
      out.write("                        <div class=\"theme_detail_content\">\r\n");
      out.write("                            <div class=\"theme_detail_img\">\r\n");
      out.write("                                <img src=\"");
      out.print(bean.getMainImgNormal());
      out.write("\" \r\n");
      out.write("                                alt = \"");
      out.print(bean.getMainTitle());
      out.write("\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"theme_detail_info\">\r\n");
      out.write("                                <h2 class=\"theme_detail_title\">");
      out.print(bean.getMainTitle());
      out.write("</h2>\r\n");
      out.write("                                <p class=\"theme_detail_subtitle\">");
      out.print(bean.getSubtitle()!=null? bean.getSubtitle():"");
      out.write("</p>\r\n");
      out.write("                                <ul class=\"theme_detail_fields\">\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">지역:");
      out.print(bean.getGugunNm() );
      out.write("</span></li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">카테고리:");
      out.print(bean.getCate2Nm() );
      out.write("</span></li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">위치:");
      out.print(bean.getPlace() );
      out.write("</span> </li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">주소:");
      out.print(bean.getAddr1() );
      out.write("</span> </li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">홈페이지:</span> \r\n");
      out.write("                                    <a href=\"");
      out.print(bean.getHomepageUrl().length()!=0? bean.getHomepageUrl():"#" );
      out.write("\" target=\"_blank\">\r\n");
      out.write("                                    ");
      out.print(bean.getHomepageUrl().length()!=0?bean.getHomepageUrl(): "홈페이지 없음" );
      out.write("</a></li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">\r\n");
      out.write("                                    교통 정보:</span >\r\n");
      out.write("                                    <span class=\"theme_detail_textarea\">\r\n");
      out.write("                                    ");
      out.print(bean.getTrfcInfo().length()!=0?bean.getTrfcInfo(): "교통 정보 없음");
      out.write("</span></li>\r\n");
      out.write("                                    <li><span class=\"theme_detail_label\">상세 설명:</span> \r\n");
      out.write("                                    <span class=\"theme_detail_textarea\">");
      out.print(bean.getItemcntnts());
      out.write("</span></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"action_btn\">\r\n");
      out.write("                            <button onclick=\"window.history.back()\">목록으로 돌아가기</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        ");
 } else { 
      out.write("\r\n");
      out.write("                        <p>해당 테마 여행 정보를 찾을 수 없습니다.</p>\r\n");
      out.write("                       ");
 } // -- if else 
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </section>\r\n");
      out.write("            </div>\r\n");
      out.write("        </main>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
