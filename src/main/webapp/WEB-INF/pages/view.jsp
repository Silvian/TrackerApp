<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		  <li class="active">
			<a href="/TrackerApp/view">Tracker App</a>
		  </li>
		</ul>
		<ul class="left">
		  <li>
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
			  <th width="250">Person Name</th>
			  <th width="250">Person Email</th>
			  <th width="500">Reason</th>
			  <th width="100">Score</th>
			  <th width="100">Add Points</th>
		    </tr>
		    <c:forEach items="${listPersons}" var="person">
			  <tr>
			    <td>${person.name}</td>
		        <td>${person.email}</td>
		        <td>${person.reason}</td>
		        <td>${person.points}</td>
		        <td><a href="add-point/${person.id}" id="add-reason-link" value="/add-point/${person.id}">Add Point</a></td>
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

    <script src="<c:url value="/resources/js/vendor/jquery.js" />"></script>
    <script src="<c:url value="/resources/js/foundation.min.js" />"></script>
    <script>
      $(document).foundation();
    </script>
  </body>
</html>