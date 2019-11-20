<%@ page import="graded.Semester" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Add Modul</title>
</head>

<body>
<div class="container">
    <h1>
       Modul hinzufügen
    </h1>
    <g:form controller="modul" action="create" class="">
        <div class="form-group">
            <label for="kuerzel">Kürzel:</label>
            <g:textField id="kuerzel" name="modulKuerzel" value="${modul.modulKuerzel}" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="bezeichnung">Bezeichnung:</label>
            <g:textField id="bezeichnung" name="modulBezeichnung" value="${modul.modulBezeichnung}"
                         class="form-control"/>
        </div>

        <div class="form-group">
            <label for="credits">Credits:</label>
            <g:textField id="credits" name="credits" value="${modul.credits}" class="form-control" type="number"/>
        </div>

        <div class="form-group">
            <label for="dozent">Dozent:</label>
            <g:textField id="dozent" name="dozent" value="${modul.dozent}" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="semester">Semester:</label>
            <g:select name="semester" class="custom-select"
                      from="${graded.Semester.list()}"
                      optionKey="id"/>
        </div>

        <div class="form-group">
            <g:actionSubmit value="Speichern" class="btn btn-outline-primary"/>
            <input type="button" value="Abbrechen" class="btn btn-outline-secondary"/>
        </div>
    </g:form>
</div>
</body>
</html>