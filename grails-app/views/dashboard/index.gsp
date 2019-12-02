<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<h2>Dashboard</h2>
<div class="container-fluid">
    <div class="row">

        <div class="col-sm">
            <h3>Aktuelles Semester</h3>
        </div>
        <div class="col-sm">
            <div style="width: 180px; height:40px; background-color: #5a6268">
              <!--  <div style="width: <g:if test="${nichtBestanden?.size()} == 0">0px</g:if><g:else>${nichtBestanden?.size()}px</g:else>; height:20px; background-color: darkred">${nichtBestanden?.size()}</div>
                <div style="width: <g:if test="${bestanden?.size()} == 0">0px</g:if><g:else>${bestanden?.size()}px</g:else>; height:20px; background-color: #1e7e34">${bestanden?.size()}</div>-->
                <div style="width: 10px; height:20px; background-color: darkred">${nichtBestanden?.size()}</div>
                <div style="width:120px; height:20px; background-color: #1e7e34; float: left">${bestanden?.size()}</div><div style="width:20px; height:20px; background-color: yellow; float: left">${aktuell?.size()}</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>