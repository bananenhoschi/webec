<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grader - Modul hinzufügen</title>
</head>

<body>
<div id="create-modul" class="container-fluid" role="main">
    <h1>Modul erfassen</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.modul}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.modul}" var="error">
                <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.modul}" method="POST">
        <div class="form-group row">
            <label for="kuerzel" class="col-md-2 col-form-label col-form-label-md">Kürzel:</label>

            <div class="col-md-10">
                <g:textField id="kuerzel" name="kuerzel" value="${this.modul.kuerzel}"
                             class="form-control form-control-md col-md-1"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="bezeichnung" class="col-md-2 col-form-label col-form-label-md">Bezeichnung:</label>

            <div class="col-md-10">
                <g:textField id="bezeichnung" name="bezeichnung" value="${this.modul.bezeichnung}"
                             class="form-control form-control-md col-md-3"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="semester" class="col-md-2 col-form-label col-form-label-md">Semester:</label>

            <div class="col-md-10">

                <g:select name="semester"
                          from="${graded.Semester.list()}"
                          optionKey="id"
                          class="form-control form-control-md custom-select col-md-1"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="credits" class="col-md-2 col-form-label col-form-label-md">Credits:</label>

            <div class="col-md-10">
                <input id="credits" name="credits" value="${this.modul.credits}"
                             class="form-control form-control-md col-md-1"
                             type="number"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="dozent" class="col-md-2 col-form-label col-form-label-md">Dozent (Kürzel):</label>

            <div class="col-md-10">
                <g:textField id="dozent" name="dozent" value="${this.modul.dozent}"
                             class="form-control form-control-md col-md-1"/>
            </div>
        </div>

        <div class="form-check ">
            <label for="hasTestat" class="form-check-label">
                <g:checkBox id="hasTestat" name="hasTestat" value="${this.modul.hasTestat}" class="form-check-input "/>
                nur Testat
            </label>
        </div>

        <div class="form-check ">
            <label for="hasMsp" class="form-check-label">
                <g:checkBox id="hasMsp" name="hasMsp" value="${this.modul.hasMsp}" class="form-check-input"/>
                hat Modulschlussprüfung
            </label>
        </div>

        <div class="form-group row">
            <label for="anzahlNoten" class="col-md-2 col-form-label col-form-label-md">Anzahl Noten (ohne MSP):</label>

            <div class="col-md-10">
                <input id="anzahlNoten" name="anzahlNoten"
                       class="form-control form-control-md col-md-1"
                       type="number"/>
            </div>
        </div>

        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-primary" value="Speichern"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
