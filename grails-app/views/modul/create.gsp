<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grader - Modul hinzufügen</title>
</head>

<body>
<div id="create-modul" class="container" role="main">
    <div class="card">
        <div class="card-header">

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
        </div>

        <div class="card-body">
            <g:form resource="${this.modul}" method="POST">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Kürzel:</label>
                            <g:textField id="kuerzel" name="kuerzel" value="${this.modul.kuerzel}"
                                         class="form-control"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Bezeichnung:</label>
                            <g:textField id="bezeichnung" name="bezeichnung" value="${this.modul.bezeichnung}"
                                         class="form-control"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Semester:</label>

                            <g:select name="semester"
                                      from="${graded.Semester.list()}"
                                      optionKey="id"
                                      class="form-control"/>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Credits:</label>
                            <input id="credits" name="credits" value="${this.modul.credits}"
                                   class="form-control"
                                   type="number"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Dozent (Kürzel):</label>

                            <g:textField id="dozent" name="dozent" value="${this.modul.dozent}"
                                         class="form-control"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">
                                <g:checkBox id="hasTestat" name="hasTestat" value="${this.modul.hasTestat}"
                                            class="form-check-input "/>
                                nur Testat
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">
                                <g:checkBox id="hasMsp" name="hasMsp" value="${this.modul.hasMsp}"
                                            class="form-check-input "/>
                                hat Modulschlussprüfung
                            </label>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="form-row">
                        <div class="col form-inline text-left col-sm-5">
                            <label class="col-sm-4 col-form-label col-form-label text-left">Anzahl Noten (ohne MSP):</label>


                            <input id="anzahlNoten" name="anzahlNoten"
                                   class="form-control"
                                   type="number"/>
                        </div>
                    </div>
                </div>
                </div>
                <div class="card-footer">
                        <fieldset class="buttons">
                    <g:submitButton name="create" class="btn btn-primary" value="Speichern"/>
                    <g:link controller="modul" action="index" class="btn btn-outline-secondary ">
                        Abbrechen
                    </g:link>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
