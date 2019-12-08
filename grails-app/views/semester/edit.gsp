<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Graded - Semester [${this.semester}] berarbeiten</title>
</head>

<body>
<div id="edit-semester" class="container" role="main">

<h1>Semester [${this.semester}]</h1>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<!-- Error Fields -->
<g:hasErrors bean="${this.semester}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.semester}" var="error">
            <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:form resource="${this.semester}" method="PUT">
    <div class="card card-body">
        <g:hiddenField name="version" value="${this.semester?.version}"/>
        <div class="form-group">
            <div class="form-row">
                <div class="col form-inline text-left col-sm-4">
                    <label class="col-sm-3 col-form-label col-form-label text-left">Semester:</label>
                    <g:select id="semesterTyp" name="semesterTyp" from="${graded.SemesterTyp.values()}"
                              class="form-control" value="${this.semester?.semesterTyp}"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="form-row">
                <div class="col form-inline col-sm-4">
                    <label class="col-sm-3 col-form-label col-form-label">Jahr:</label>
                    <g:textField id="jahr" name="jahr" value="${this.semester?.jahr}"
                                 class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="card-footer">
    <fieldset class="buttons">
        <input class="btn btn-primary" type="submit" value="Speichern"/>
    <g:link controller="semester" action="index" class="btn btn-outline-secondary ">
        Abbrechen
    </g:link>
    <g:link controller="semester" action="delete" params="${this.semester.id}"
            class="btn btn-outline-danger float-right ">
        Löschen
    </g:link>
    </fieldset>
</g:form>
</div>
</body>
</html>
