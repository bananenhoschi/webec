<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body id="loginPage">
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Login Form -->
        <form action="login/authenticate" method="post">
            <input type="text" class="text_" name="username" id="username" class="fadeIn second" autocapitalize="none"
                   data-kpxc-id="username" kpxc-username-field="true" placeholder="Benutzername">
            <input type="password" class="text_" name="password" class="fadeIn third" id="password"
                   data-kpxc-id="password" kpxc-password-generator="true" kpxc-pwgen-next-field-exists="false"
                   kpxcfields-onchange="true" placeholder="Passwort">
            <input type="submit" class=" btn btn-primary" style="margin-top:10px " value="Anmelden">
        </form>
    </div>
</div>
</body>
</html>