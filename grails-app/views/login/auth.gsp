<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body id="loginPage">
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Login Form -->
        <form action="login/authenticate" method="post" id="loginForm">
            <label for="username"></label>
            <input type="text" name="username" id="username"
                   class="fadeIn second loginInput" autocapitalize="none"
                   data-kpxc-id="username" placeholder="Benutzername">
            <label for="password"></label>
            <input type="password" name="password" class="fadeIn third loginInput"
                   id="password"
                   data-kpxc-id="password" placeholder="Passwort">
            <input type="submit" class=" btn btn-primary" style="margin-top:10px " value="Anmelden">
        </form>
    </div>
</div>
</body>
</html>