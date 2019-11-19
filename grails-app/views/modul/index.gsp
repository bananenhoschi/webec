<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container">
    <div id="list-modul" role="main">
        <h2>Modulnoten</h2>

        <div>
            <table class="table">
                <thead>
                <tr>
                    <th>Semester</th>
                    <th>Kürzel</th>
                    <th>Bezeichnung</th>
                    <th>Credits</th>
                    <th colspan="${maxENs}">Erfahrungsnoten</th>
                    <th>MSP</th>
                    <th>Bestanden</th>
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
                    <td><g:if test="${modul.passed()}"><span class="oi oi-circle-check"></span></g:if><g:else><span class="oi oi-circle-x"></g:else></td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>
</div>
</body>
</html>
