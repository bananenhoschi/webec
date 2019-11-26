<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'modul.label', default: 'Modul')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div id="edit-modul" class="content scaffold-edit" role="main">

    <h1><g:if
            test="${this.modul.modulBezeichnung}">${this.modul.modulBezeichnung}</g:if><g:else>${this.modul.modulKuerzel}</g:else></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

<!-- Error Fields -->
    <g:hasErrors bean="${this.modul}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.modul}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form resource="${this.modul}" method="PUT">
        <g:hiddenField name="version" value="${this.modul?.version}"/>
        <div class="form-group">
            <label for="kuerzel">Kürzel:</label>
            <g:textField id="kuerzel" name="modulKuerzel" value="${this.modul.modulKuerzel}" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="bezeichnung">Bezeichnung:</label>
            <g:textField id="bezeichnung" name="modulBezeichnung" value="${this.modul.modulBezeichnung}"
                         class="form-control"/>
        </div>

        <div class="form-group">
            <label for="credits">Credits:</label>
            <g:textField id="credits" name="credits" value="${this.modul.credits}" class="form-control" type="number"/>
        </div>

        <div class="form-group">
            <label for="dozent">Dozent:</label>
            <g:textField id="dozent" name="dozent" value="${this.modul.dozent}" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="semester">Semester:</label>
            <g:select name="semester" class="custom-select"
                      from="${graded.Semester.list()}"
                      value="${this.modul?.semester.semesterTyp}${this.modul?.semester.jahr}"
                      optionKey="id"/>
        </div>

        <div class="form-group">
            <h3>Noten</h3>
            <g:link controller="modul" action="addNote" resource="${this.modul}"
                    class="btn btn-outline-success btn-sm"><span
                    class="oi oi-plus"></span> Note hinzufügen</g:link>
            <hr/>

            <div class="form-inline">
                <label for="msp" class="col-1">MSP:</label>
                <input type="number" id="msp" name="msp" value="${this.modul.msp}" class="form-control col-sm-1"
                       step="0.1"/>
            </div>
        </div>
        <fieldset class="buttons">
            <input class="btn btn-primary" type="submit" value="Speichern"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
