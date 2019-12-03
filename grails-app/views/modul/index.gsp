<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<h2>Modulnoten</h2>
<g:link controller="modul" action="create" class="btn btn-outline-success float-right"><span
        class="oi oi-plus"></span> Neues Modul</g:link>
<table class="table">
    <thead>
    <tr>
        <th>Semester</th>
        <th>Kürzel</th>
        <th>Bezeichnung</th>
        <th>Dozent</th>
        <th>Credits</th>
        <th colspan="${maxENs}">Semesternoten</th>
        <th>EN</th>
        <th>MSP</th>
        <th>Modulnote</th>
        <th></th>
    </tr>
    </thead>
    <% modulList.each { modul -> %>
    <tr>
        <td>${modul.semester.semesterTyp.toString()} ${modul.semester.jahr}</td>
        <td><g:link action="edit" id="${modul.id}">${modul.kuerzel}</g:link></td>
        <td>${modul.bezeichnung}</td>
        <td>${modul.dozent}</td>
        <td>${modul.credits}</td>
        <g:if test="${modul.noten}">
            <g:each var="en" in="${modul.noten.init()}">
                <td>${en.note}</td>
            </g:each>
            <td colspan="${maxENs - modul.noten?.size() + 1}">${modul.noten.last().note}</td>
        </g:if>
        <g:elseif test="${modul.hasTestat}">
            <td colspan="${maxENs}">Testat</td>
        </g:elseif>
        <g:else>
            <td colspan="${maxENs}"></td>
        </g:else>
        <td>
            <g:if test="${modul.angerechnet}">
            </g:if>
            <g:elseif test="${modul.erfahrungsnote > 0}">
                ${modul.erfahrungsnote}
            </g:elseif>
            <g:else>
                -
            </g:else>
        </td>
        <td>
            <g:if test="${modul.hasMsp}">
                <g:if test="${modul.hasTestat || modul.angerechnet}">
                </g:if>
                <g:elseif test="${modul.msp}">
                    ${modul.msp.note}
                </g:elseif>
                <g:else>
                    -
                </g:else>
            </g:if>
            <g:elseif test="${modul.angerechnet}">

            </g:elseif>
            <g:else>
                Keine MSP
            </g:else>
        </td>
        <td>
            <g:if test="${modul.angerechnet}">
            </g:if>
            <g:else>${modul.modulnote}</g:else>
        </td>
        <td>
            <g:if test="${modul.passed}">
                <span class="oi oi-check" title="bestanden"></span>
            </g:if>
            <g:elseif test="${modul.completed}">
                <span class="oi oi-clock" title="offen"></span>
            </g:elseif>
            <g:else>
                <span class="oi oi-ban" title="nicht bestanden"></span>
            </g:else>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>