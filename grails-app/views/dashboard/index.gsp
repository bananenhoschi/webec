<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container-fluid">
    <span>Nicht bestanden: ${nichtBestanden?.size()}</span><br/>
    <span>Bestanden: ${bestanden?.size()}</span><br/>
    <span>Offen: ${aktuell?.size()}</span><br/>
    <span>MAX: ${max}</span><br/>
</div>

</body>
</html>