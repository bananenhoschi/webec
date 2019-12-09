<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grader - Modul hinzufügen</title>
</head>

<body>
<div id="create-semester" class="container" role="main">
    <div class="card">
        <div class="card-header">

            <h1>Modul erfassen</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.semester}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.semester}" var="error">
                        <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
        </div>

        <div class="card-body">
            <g:form resource="${this.semester}" method="POST">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-4">
                            <label class="col-sm-3 col-form-label col-form-label text-left">Semester:</label>
                            <g:select id="semesterTyp" name="semesterTyp" from="${graded.SemesterTyp.values()}"
                                      value="${fieldValue(bean: semesterTyp, field: 'semesterTyp')}"
                                      class="form-control"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-4">
                            <label class="col-sm-3 col-form-label col-form-label text-left">Jahr:</label>
                            <g:textField id="jahr" name="jahr" value="${this.semester.jahr}"
                                         class="form-control"/>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                     <fieldset class="buttons">
                <g:submitButton name="create" class="btn btn-primary" value="Speichern"/>
                <g:link controller="semester" action="index" class="btn btn-outline-secondary ">
                    Abbrechen
                </g:link>
                </fieldset>
            </g:form>
        </div>
        </div>
    </div>
</body>
</html>