<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<h2>Modulnoten</h2>

<table class="table">
    <thead>
    <tr>
        <th>Semester</th>
        <th>Kürzel</th>
        <th>Bezeichnung</th>
        <th>Credits</th>
        <th colspan="${maxENs}">Semesternoten</th>
        <th>EN</th>
        <th>MSP</th>
        <th>Modulnote</th>
        <th></th>
    </tr>
    </thead>
    <% module.each { modul -> %>
    <tr>
        <td>${modul.semester.semesterTyp.toString()} ${modul.semester.jahr}</td>
        <td>${modul.modulKuerzel}</td>
        <td>${modul.modulBezeichnung}</td>
        <td>${modul.credits}</td>
        <g:if test="${modul.ens}">
            <g:each var="en" in="${modul.ens.init()}">
                <td>${en.note}</td>
            </g:each>
            <td colspan="${maxENs - modul.ens.size() + 1}">${modul.ens.last().note}</td>
        </g:if>
        <g:elseif test="${modul.isTestat}">
            <td colspan="${maxENs}">Testat</td>
        </g:elseif>
        <g:else>
            <td colspan="${maxENs}"></td>
        </g:else>
        <td>${modul.erfahrungsnote()}</td>
        <td>
            <g:if test="${modul.hasMsp}">
                <g:if test="${modul.msp}">
                    ${modul.msp.note}
                </g:if>
                <g:elseif test="${modul.isTestat}">
                </g:elseif>
                <g:else>
                    -
                </g:else>
            </g:if>
            <g:else>
                Keine MSP
            </g:else>
        </td>
        <td>${modul.modulnote()}</td>
        <td>
            <g:if test="${modul.passed()}">
                <span class="oi oi-check" title="bestanden"></span>
            </g:if>
            <g:elseif test="${modul.completed()}">
                <span class="oi oi-ellipses" title="offen">
            </g:elseif>
            <g:else>
                <span class="oi oi-ban" title="nicht bestanden">
            </g:else>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
