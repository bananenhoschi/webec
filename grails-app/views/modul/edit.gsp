<%@ page import="graded.Semester" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Modul</title>
</head>

<body>
<div class="container">
    <h1>
        <g:if test="${modul.modulBezeichnung}">${modul.modulBezeichnung}</g:if>
        <g:else>${modul.modulKuerzel}</g:else>
    </h1>
    <g:form controller="modul" action="update">
        <g:hiddenField name="id" value="${modul.id}"/>
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
                      value="${modul?.semester.semesterTyp}${modul?.semester.jahr}"
                      optionKey="id"/>
        </div>

        <div class="form-group">
            <h3>Noten</h3>
            <g:link controller="modul" action="addNote" resource="${modul}" class="btn btn-outline-success btn-sm"><span
                    class="oi oi-plus"></span> Note hinzufügen</g:link>
            <g:if test="${!modul.ens.isEmpty()}">

                <% modul.ens.each { en -> %>
                <div class="form-inline">
                    <label for="en-${en.id}" class="col-1">Note:</label>&nbsp;
                <g:textField id="en-${en.id}" name="en-${en.id}" value="${en.note}"
                             class="form-control col-sm-1"/>&nbsp;
                <g:textField id="gewichtung-${en.id}" name="gewichtung-${en.id}" value="${en.gewichtung}"
                             class="form-control col-sm-1"/>

                </div>
                <% } %>
            </g:if>
            <hr/>
            <g:if test="${modul.msp != null}">

                <div class="form-inline">
                    <label for="msp" class="col-1">MSP:</label>
                    <g:textField id="msp" name="msp" value="${modul.msp.note}" class="form-control col-sm-1"/>
                </div>
            </g:if>
        </div>

        <div class="form-group">
            <input type="submit" name="save" class="btn btn-outline-secondary" value="Speichern" id="save"/>
            <input type="button" value="Abbrechen" class="btn btn-outline-secondary"/>
        </div>
    </g:form>
</div>
</body>
</html>