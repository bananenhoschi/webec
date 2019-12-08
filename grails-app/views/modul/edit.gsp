<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grader - ${this.modul.kuerzel} berarbeiten</title>
</head>

<body>
<div id="edit-modul" class="container-fluid" role="main">

    <h1><g:if
            test="${this.modul.bezeichnung}">${this.modul.bezeichnung}</g:if><g:else>${this.modul.kuerzel}</g:else></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

<!-- Error Fields -->
    <g:hasErrors bean="${this.modul}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.modul}" var="error">
                <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form resource="${this.modul}" method="PUT">
        <div class="card card-body">
            <g:hiddenField name="version" value="${this.modul?.version}"/>
            <div class="form-group">
                <div class="form-row">
                    <div class="col form-inline text-left col-sm-4">
                        <label class="col-sm-3 col-form-label col-form-label text-left">Kürzel:</label>
                        <g:textField id="kuerzel" name="kuerzel" value="${this.modul.kuerzel}" class="form-control"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="form-row">
                    <div class="col form-inline col-sm-4">
                        <label class="col-sm-3 col-form-label col-form-label">Bezeichnung:</label>
                        <g:textField id="bezeichnung" name="bezeichnung" value="${this.modul.bezeichnung}"
                                     class="form-control"/>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="form-row">
                    <div class="col form-inline col-sm-4">
                        <label class="col-sm-3 col-form-label col-form-label">Credits:</label>
                        <g:textField id="credits" name="credits" value="${this.modul.credits}" class="form-control"
                                     type="number"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="form-row">
                    <div class="col form-inline col-sm-4">
                        <label class="col-sm-3 col-form-label col-form-label">Dozent:</label>
                        <g:textField id="dozent" name="dozent" value="${this.modul.dozent}" class="form-control"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="form-row">
                    <div class="col form-inline col-sm-4">
                        <label class="col-sm-3 col-form-label col-form-label">Semester:</label>
                        <!-- TODO vom Controller mitgeben-->
                        <g:select name="semester" class="custom-select"
                                  from="${graded.Semester.list()}"
                                  value="${this.modul?.semester?.semesterTyp}${this.modul?.semester?.jahr}"
                                  optionKey="id"/>
                    </div>
                </div>
            </div>
            <g:if test="${modul.hasTestat}">
                <div class="form-inline">
                    <div class="form-row">
                        <div class="col form-inline col-sm-4">
                            <label class="col-sm-3 col-form-label col-form-label">
                                <g:checkBox id="hasTestat" name="hasTestat" value="${modul.hasTestat}"
                                            class="form-check-input"
                                            disabled="true"/>
                                hat Testat
                            </label>
                        </div>
                    </div>

                    <div class="form-check ">
                        <label for="testatPassed" class="form-check-label">
                            <g:field type="checkbox" id="testatPassed" name="testatPassed" value="${modul.testatPassed}"
                                     class="form-check-input "
                                     readonly="readonly"/>
                            Testat erfüllt
                        </label>
                    </div>
                </div>
            </g:if>
            <g:else>
                <div class="form-check ">
                    <label for="hasMsp" class="form-check-label">
                        <g:field type="checkbox" id="hasMsp" name="hasMsp"
                                 value="${fieldValue(bean: modul, field: 'hasMsp')}"
                                 class="form-check-input" disabled="true"/>
                        hat Modulschlussprüfung
                    </label>
                </div>
            </g:else>
        </div>

        <div class="m-3"></div>

        <div class="form-group card card-body">
            <h3>Noten:</h3>
        <g:each in="${this.modul.noten}" var="note">
            <div class="form-row">
                <div class="col form-inline col-sm-4">
                    <label class="col-sm-3 col-form-label col-form-label">Note:</label>
                    <input step="0.01" type="number" value="${fieldValue(bean: note, field: 'note')}"/>
                </div>

            </div>
        </g:each>
        <g:if test="${this.modul.hasMsp}">
            <hr/>

            <div class="form-row">
                <div class="col form-inline col-sm-4">
                    <label class="col-sm-3 col-form-label col-form-label">MSP:</label>
                    <input id="msp" step="0.01" type="number" value="${fieldValue(bean: modul.msp, field: 'note')}"/>
                </div>
            </div>
        </g:if>

        <fieldset class="buttons">
            <input class="btn btn-primary" type="submit" value="Speichern"/>
            <g:link controller="modul" action="index" class="btn btn-outline-secondary ">
                Abbrechen
            </g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
