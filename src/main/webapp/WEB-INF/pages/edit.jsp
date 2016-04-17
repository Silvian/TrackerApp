<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Score | Tracker App</title>
    <link href="<c:url value="/resources/css/foundation.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/vendor/modernizr.js" />"></script>
  </head>
  <body>

    <nav class="top-bar" data-topbar role="navigation">
      <section class="top-bar-section">
        <!-- Left Nav Section -->
        <ul class="left">
          <li>
            <a href="/TrackerApp/view">Tracker App</a>
          </li>
        </ul>
        <ul class="left">
          <li class="active">
            <a href="/TrackerApp/edit">Edit Data</a>
          </li>
        </ul>
        </section>
    </nav>

      <div class="row">
       <div class="large-12 columns">
         </br>
         <h1>Score Tracker</h1>
         </br>
       </div>
      </div>

      <br/>

      <div class="row">
        <div class="large-12 columns">
          <div class="panel">

          <c:if test="${!empty listPersons}">
            <table id="list-persons">
              <tr>
                <th width="70">Person ID</th>
                <th width="200">Person Name</th>
                <th width="200">Person Email</th>
                <th width="350">Reason</th>
                <th width="70">Points</th>
                <th width="70">Edit</th>
                <th width="70">Delete</th>
              </tr>
              <c:forEach items="${listPersons}" var="person">
                <tr>
                  <td>${person.id}</td>
                  <td>${person.name}</td>
                  <td>${person.email}</td>
                  <td>${person.reason}</td>
                  <td>${person.points}</td>
                  <td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
                  <td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
                </tr>
              </c:forEach>
            </table>
          </c:if>

          </div>
        </div>
      </div>

      <div class="row">

        <hr />

      </div>

    <div class="row">
	 <div class="large-12 columns">
	   </br>
	   <h3>Add New Person</h3>
	   </br>
	 </div>
   	</div>

    <div class="row">
	  <div class="large-6 columns">

        <c:if test="${not empty response}">
          <c:if test="${isSuccessful}">
            <div data-alert class="alert-box success radius">
              ${response}
              <a href="#" class="close">&times;</a>
            </div>
          </c:if>
          <c:if test="${not isSuccessful}">
            <div data-alert class="alert-box alert radius">
              ${response}
              <a href="#" class="close">&times;</a>
            </div>
          </c:if>
        </c:if>

		<h5>Please fill in person details below:</h5>
        <hr/>

        <c:url var="addAction" value="/edit/add" ></c:url>

        <form:form id="add-form" name="add-form" action="${addAction}" commandName="person">
          <div class="row">
            <c:if test="${!empty person.name}">
              <div class="large-12 medium-12 columns">
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
              </div>
              <div class="large-12 medium-12 columns">
                    <form:input path="id" readonly="true" size="8"  disabled="true" />
                    <form:hidden path="id" />
              </div>
            </c:if>
            <div class="large-12 medium-12 columns">
              <form:label path="name">Name
                <form:input id="person-name" name="person-name" path="name" type="text" placeholder="Enter person name" required="true" maxlength="50"/>
              </form:label>
            </div>
            <div class="large-12 medium-12 columns">
              <form:label path="email">Email Address
                <form:input id="person-email" name="person-email" path="email" type="email" placeholder="Enter person email address" required="true" maxlength="50"/>
              </form:label>
            </div>
            <div class="large-12 medium-12 columns">
              <form:label path="reason">Reason
                <form:input id="person-reason" name="person-reason" path="reason" type="text" placeholder="Enter a reason" required="false" maxlength="250"/>
              </form:label>
            </div>
            <div class="large-12 medium-12 columns">
              <form:label path="points">Score
                <form:input id="person-points" name="person-points" path="points" type="text" placeholder="Enter person Score" required="false" maxlength="11"/>
              </form:label>
            </div>

            <div class="large-12 medium-12 columns">
              <c:if test="${!empty person.name}">
                <input type="submit" value="Edit Person" class="small button"/><br/>
              </c:if>
              <c:if test="${empty person.name}">
                <input type="submit" value="Add Person" class="small button"/><br/>
              </c:if>
            </div>
          </div>
        </form:form>

     </div>

    </div>

    <script src="<c:url value="/resources/js/vendor/jquery.js" />"></script>
    <script src="<c:url value="/resources/js/foundation.min.js" />"></script>
    <script>
      $(document).foundation();
    </script>
  </body>
</html>