<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="label.pm_title"/></title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css"
          type=text/css rel=stylesheet>
</head>
<body>
<h1>JTalks</h1>

<div class="wrap pm_page">


    <div class="all_forums">
        <h2><a class="heading" href="#"><spring:message code="label.new_pm"/></a></h2>

        <div class="forum_misc_info">
            Напиши меня, детка!
        </div>
        <a class="forums_list" href="#" title="Список форумов">Список форумов</a>
        <span class="arrow"> > </span>
        <a class="forums_list" href="#" title="Для новичков">Личные сообщения</a>


        <jsp:include page="pmNavigationMenu.jsp"/>
        <form:form action="${pageContext.request.contextPath}/pm/new.html" modelAttribute="privateMessageDto"
                   method="POST"
                   onsubmit="this.getAttribute('submitted')" name="editForm">
            <ul class="forum_table"> <!-- Форма ответа -->
                <li class="forum_row">
                    <div class="forum_answer_left">
                        <spring:message code="label.recipient"/>
                    </div>
                    <div class="forum_answer_right">
                        <form:input path="recipient" size="45" maxlength="60" tabindex="1" class="post"/>
                        <form:errors path="recipient"/>
                    </div>
                </li>
                <li class="forum_row">
                    <div class="forum_answer_left">
                        <spring:message code="label.title"/>
                    </div>
                    <div class="forum_answer_right">
                        <form:input path="title" size="45" maxlength="60" tabindex="1" class="post"/>
                        <form:errors path="title"/>
                    </div>
                </li>
                <li class="forum_row">
                    <div class="forum_answer_left align-top">
                        <spring:message code="label.body"/>
                        <table class="smiles_table">
                            <tbody>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="forum_answer_right">
                        <div class="formatting_buttons">
                            <input id="format_b" type="button" class="button" accesskey="b" name="format_b"
                                   value=" B "/>
                            <input id="format_i" type="button" class="button" accesskey="i" name="format_i"
                                   value=" i "/>
                            <input id="format_u" type="button" class="button" accesskey="u" name="format_u"
                                   value=" u "/>
                            <input id="format_quote" type="button" class="button" accesskey="q" name="format_quote"
                                   value="Quote"/>
                            <input id="format_code" type="button" class="button" accesskey="c" name="format_code"
                                   value="Code"/>
                            <input id="format_list" type="button" class="button" accesskey="l" name="format_list"
                                   value="List"/>
                            <input id="format_listeq" type="button" class="button" accesskey="o" name="format_listeq"
                                   value="List="/>
                            <input id="format_img" type="button" class="button" accesskey="p" name="format_img"
                                   value="Img"/>
                            <input id="format_url" type="button" class="button" accesskey="w" name="format_url"
                                   value="URL"/>
                        </div>
						<span class="genmed">
							Цвет шрифта:
							<select id="select_color" name="select_color">
                                <option>Чорный</option>
                                <option>Белiй</option>
                            </select>
							Размер шрифта:
							<select id="select_size" name="select_size">
                                <option>Mali</option>
                                <option>Bolsho</option>
                                <option>Oche Bolsho</option>
                            </select>
						</span>
                        <a href="#" onmouseover="helpline('a')">Закрыть теги</a>

                        <div id="helpline">Здесь должна быть подсказка</div>
                        <form:textarea path="body" rows="15" cols="35" tabindex="3" class="post"/>
                        <form:errors path="body"/>
                    </div>
                </li>
                <li class="forum_row">
                    <div class="forum_answer_left">
                        Опции
                    </div>
                    <div class="forum_answer_right options">
                        <input id="notify" type="checkbox" name="notify"/> Сообщать мне о получении ответа
                        <br/>
                        <input id="nosmiles" type="checkbox" name="nosmiles"/> Не отображать смайлы
                    </div>
                </li>
            </ul>
            <input id="preview" type="submit" class="button" tabindex="5" name="preview"
                   value="<spring:message code="label.preview"/>"/>
            <input id="post" type="submit" class="button" accesskey="s" tabindex="6" name="post"
                   value="<spring:message code="label.send"/>"
                   onclick="document.editForm.action='${pageContext.request.contextPath}/pm/new.html'"/>
            <input id="save_pm" type="submit" class="button" name="save_pm" value="<spring:message code="label.save"/>"
                   onclick="document.editForm.action='${pageContext.request.contextPath}/pm/save.html'"/>
        </form:form>
    </div>
    <div class="footer_buffer"></div>
    <!-- Несемантичный буфер для прибития подвала -->

</div>
</body>
</html>

