<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div id="list-modul" role="main">
    <% modulList.each { modul -> %>
     <p>${modul.modulKuerzel} ${modul.modulBezeichnung} ${modul.credits}</p>
    <%}%>
</div>
</body>
</html>
