<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container-fluid">
    <div class="card">

        <div class="card-header">
            <h2>Modulübersicht</h2>
            <g:link controller="modul" action="create" class="btn btn-outline-success float-right">
                <span class="oi oi-plus"></span> Neues Modul
            </g:link>
        </div>

        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th>Semester</th>
                    <th>Kürzel</th>
                    <th>Bezeichnung</th>
                    <th>Dozent</th>
                    <th>Credits</th>
                    <th colspan="${hoechsteAnzahlNoten}">Semesternoten</th>
                    <th>EN</th>
                    <th>MSP</th>
                    <th>Modulnote</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <% module.each { modul -> %>
                <tr <g:if test="${modul.semester.id % 2 == 0}">style="background-color: #f8f8f8"</g:if>>
                    <td>${modul.semester.semesterTyp.toString()} ${modul.semester.jahr}</td>
                    <td><g:link action="edit" id="${modul.id}">${modul.kuerzel}</g:link></td>
                    <td>${modul.bezeichnung}</td>
                    <td>${modul.dozent}</td>
                    <td>${modul.credits}</td>
                    <g:if test="${modul.noten}">
                        <g:each var="en" in="${modul.noten.init()}">
                            <td>${en.note}</td>
                        </g:each>
                        <td colspan="${hoechsteAnzahlNoten - modul.noten?.size() + 1}">${modul.noten.last().note}</td>
                    </g:if>
                    <g:elseif test="${modul.hasTestat}">
                        <td colspan="${hoechsteAnzahlNoten}">Testat</td>
                    </g:elseif>
                    <g:else>
                        <td colspan="${hoechsteAnzahlNoten}"></td>
                    </g:else>

                    <td>
                        <g:if test="${modul.getErfahrungsnote() > 0}">
                            ${modul.getErfahrungsnote()}
                        </g:if>
                    </td>
                    <td>
                        <g:if test="${modul.hasMsp}">
                            <g:if test="${modul.msp}">
                                ${modul.msp.note}
                            </g:if>
                            <g:elseif test="${modul.hasTestat}">
                            </g:elseif>
                            <g:else>
                                -
                            </g:else>
                        </g:if>
                        <g:else>
                            <g:if test="${modul.hasTestat}">
                            </g:if>
                            <g:else>
                                Keine MSP
                            </g:else>
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${modul.hasTestat || modul.angerechnet}">
                        </g:if>
                        <g:else>
                            ${modul.getModulnote()}
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${modul.isPassed()}">
                            <span class="oi oi-check passed" title="bestanden"></span>
                        </g:if>
                        <g:elseif test="${!modul.isCompleted()}">
                            <span class="oi oi-clock active" title="offen"></span>
                        </g:elseif>
                        <g:else>
                            <span class="oi oi-ban failed" title="nicht bestanden"></span>
                        </g:else>
                    </td>
                    <td class="float-right">
                        <g:link action="edit" id="${modul.id}"><span
                                class="oi oi-pencil col-sm-1 text-primary"></span></g:link>
                        <g:link action="delete" id="${modul.id}" method="delete"><span
                                class="oi oi-trash col-sm-1 text-danger"></span></g:link>
                    </td>
                </tr>
                <% } %>
                </tbody>

            </table>
        </div>
    </div>
</div>

</body>
</html>