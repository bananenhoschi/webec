<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="open-iconic/font/css/open-iconic-bootstrap.css"/>
    <asset:javascript src="application.js"/>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">

        <a class="navbar-brand" href="${createLink(uri: '/')}"><g:img dir="images" file="logo.png"/></a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${createLink(controller: 'dashboard', action: 'index')}"><span
                            class="oi oi-pie-chart"></span> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${createLink(controller: 'modul', action: 'index')}"><span
                            class="oi oi-calculator"></span> Modulnoten</a>
                </li>
                <li class="nav-item navbar-expand-sm">
                    <a class="nav-link" href="${createLink(controller: 'admin', action: 'index')}"><span
                            class="oi oi-wrench"></span> Verwaltung</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<main role="main">

    <div class="container-fluid bg-light vh-100">
        <g:layoutBody/>
    </div>

</main>
</body>
</html>
