<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div id="list-student" class="content scaffold-list" role="main">
    <f:table collection="${modulList}"
             properties="['modulKuerzel', 'modulBezeichnung']"/>
</div>
</body>
</html>
