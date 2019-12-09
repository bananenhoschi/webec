<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">&nbsp;</span>
    <title>Graded - Dashboard</title>
</head>

<body>
<div class="container-fluid mt-4">
    <div class="row">
        <sec:ifAnyGranted roles="ROLE_STUDENT, ROLE_ADMIN">
        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <h3>Aktuelles Semester</h3>
                </div>

                <div class="card-body">
                    <g:if test="${!aktuell.empty}">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="col-sm-1">Kürzel</th>
                                <th>EN</th>
                                <th>MSP</th>
                                <th>Modulnote</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody class="table table-striped ">
                            <% aktuell.each { modul -> %>
                            <tr>
                                <td>
                                    <div class="popup_wrapper">
                                        <a href="#" class="popup_title">${modul.kuerzel}</a>
                                        <g:if test="${(modul.bezeichnung != null)}">
                                            <div class="popup_content"><a
                                                    href="https://www.google.com/search?client=firefox-b-d&q=fhnw+${modul.kuerzel}">${modul.bezeichnung}</a>
                                            </div>
                                        </g:if>
                                    </div>
                                </td>
                                <td>
                                    <g:if test="${modul.getErfahrungsnote() > 0}">
                                        ${modul.getErfahrungsnote()}
                                    </g:if>
                                    <g:else>
                                        -
                                    </g:else>
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
                                        Keine MSP
                                    </g:else>
                                </td>
                                <td>
                                    <g:if test="${modul.getModulnote() > 0}">
                                        ${modul.getModulnote()}
                                    </g:if>
                                    <g:else>
                                        -
                                    </g:else>
                                </td>
                                <td>
                                    <g:if test="${modul.isPassed()}">
                                        <span class="oi oi-check" title="bestanden">&nbsp;</span>
                                    </g:if>
                                    <g:elseif test="${!modul.isCompleted()}">
                                        <span class="oi oi-clock" title="offen">&nbsp;</span>
                                    </g:elseif>
                                    <g:else>
                                        <span class="oi oi-ban" title="nicht bestanden">&nbsp;</span>
                                    </g:else>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </g:if>
                    <g:else>
                        <div class="alert alert-info">Du besuchst aktuell keine Module oder hast alle in diesem Semester bestanden.</div>
                    </g:else>
                </div>
            </div>
        </div>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_GUEST, ROLE_ADMIN, ROLE_STUDENT">
            <div class="col-sm">
                <div class="card">
                    <div class="card-header">
                        <h3><span class="oi oi-bar-chart">&nbsp;</span> Dein ECTS Fortschritt</h3>
                    </div>

                    <div class="card-body">
                        <div class="graded-progress-wrapper">
                            <div class="graded-progress-text">

                                <p class="text-open">${ectsAktuell} Aktuell offen</p>

                                <p class="text-passed">${ectsBestanden} Bestanden</p>

                                <p class="text-failed">${ectsNichtBestanden} Nicht Bestanden</p>

                            </div>

                            <div class="graded-progress-bar">
                                <div class="graded-progress-bar-max">
                                    <div class="graded-progress-bar-failed"
                                         style="height: ${ectsNichtBestanden}px"></div>

                                    <div class="graded-progress-bar-passed"
                                         style="height: ${ectsBestanden}px; bottom:${ectsNichtBestanden + 22}px;"></div>

                                    <div class="graded-progress-bar-open"
                                         style="height: ${ectsAktuell}px;bottom: ${ectsBestanden + 22}px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
                <sec:ifAnyGranted roles="ROLE_STUDENT, ROLE_ADMIN">
                    <div class="card">
                        <div class="card-header">
                            <h3>Ø Dein Durchschnitt</h3>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h1>${avg}</h1><span>Ungewichtet</span>
                                </div>

                                <div class="col-sm-4">
                                    <h1>${avgGewichtet}</h1><span>Gewichtet</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </sec:ifAnyGranted>
            </div>
        </sec:ifAnyGranted>
    </div>
</div>
</body>
</html>