<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="open-iconic/font/css/open-iconic-bootstrap.css"/>

</head>

<body>
<nav class="navbar navbar-dark bg-dark shadow">
    <a class="navbar-brand" href="#">
        <g:img dir="images" file="logo.png" alt="Grader - die Noten-App" title="Grader - die Noten-App" />
    </a>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span class="oi oi-home"></span>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span class="oi oi-calculator"></span>
                            Modulnoten
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="justify-content-between">
                <g:layoutBody/>
            </div>
        </main>
    </div>
</div>
</body>
</html>
