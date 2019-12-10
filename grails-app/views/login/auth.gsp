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
            <label for="username">&nbsp;</label>
            <input type="text" name="username" id="username"
                   class="fadeIn second loginInput"
                   placeholder="Benutzername">
            <label for="password">&nbsp;</label>
            <input type="password" name="password" class="fadeIn third loginInput"
                   id="password"
                   placeholder="Passwort">
            <input type="submit" class=" btn btn-primary" style="margin-top:10px " value="Anmelden">
        </form>
    </div>
</div>
</body>
</html>