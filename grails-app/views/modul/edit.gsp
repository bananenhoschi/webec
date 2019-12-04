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
                <label for="kuerzel">Kürzel:</label>
                <g:textField id="kuerzel" name="kuerzel" value="${this.modul.kuerzel}" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="bezeichnung">Bezeichnung:</label>
                <g:textField id="bezeichnung" name="bezeichnung" value="${this.modul.bezeichnung}"
                             class="form-control"/>
            </div>

            <div class="form-group">
                <label for="credits">Credits:</label>
                <g:textField id="credits" name="credits" value="${this.modul.credits}" class="form-control"
                             type="number"/>
            </div>

            <div class="form-group">
                <label for="dozent">Dozent:</label>
                <g:textField id="dozent" name="dozent" value="${this.modul.dozent}" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="semester">Semester:</label>
                <!-- TODO vom Controller mitgeben-->
                <g:select name="semester" class="custom-select"
                          from="${graded.Semester.list()}"
                          value="${this.modul?.semester?.semesterTyp}${this.modul?.semester?.jahr}"
                          optionKey="id"/>
            </div>
            <g:if test="${modul.hasTestat}">
                <div class="form-inline">
                    <div class="form-check col-sm-1 left ">
                        <label for="hasTestat" class="form-check-label">
                            <g:checkBox id="hasTestat" name="hasTestat" value="${modul.hasTestat}"
                                        class="form-check-input"
                                        disabled="true"/>
                            hat Testat
                        </label>
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
                        <g:field type="checkbox" id="hasMsp" name="hasMsp" value="${modul.hasMsp}"
                                 class="form-check-input" disabled="true"/>
                        hat Modulschlussprüfung
                    </label>
                </div>
            </g:else>
        </div>

        <div class="m-3"></div>

        <div class="form-group card card-body">
            <h3>Noten:</h3>
        <!-- TODO @ribeaud  -->
        <g:each in="${this.modul.noten}" var="note">
            <div class="form-row">
                <div class="col form-inline col-sm-4">
                    <label class="col-sm-2 col-form-label col-form-label">Note:</label>
                    <input type="number" value="${fieldValue(bean: note, field: 'note')}" />
                </div>

            </div>
        </g:each>
        <g:if test="${this.modul.hasMsp}">
            <hr/>

            <div class="form-inline">
                <label for="msp" class="col-1">MSP:</label>
                <input type="number" id="msp" name="msp" value="${this.modul.msp}" class="form-control col-sm-1"
                       step="0.1"/>
            </div>
            </div>
        </g:if>

        <fieldset class="buttons">
            <input class="btn btn-primary" type="submit" value="Speichern"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
