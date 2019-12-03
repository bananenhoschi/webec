<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-sm card mr-2">
            <h3>Aktuelles Semester</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>Kürzel</th>
                    <th>EN</th>
                    <th>MSP</th>
                    <th>Modulnote</th>
                    <th></th>
                </tr>
                </thead>
                <% aktuell.each { modul -> %>
                <tbody>
                <tr>
                    <td>${modul.semester.semesterTyp.toString()} ${modul.semester.jahr}</td>
                    <td><g:link action="edit" id="${modul.id}">${modul.kuerzel}</g:link></td>
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
                    <td>${modul.getModulnote()}</td>
                    <td>
                        <g:if test="${modul.isPassed()}">
                            <span class="oi oi-check" title="bestanden"></span>
                        </g:if>
                        <g:elseif test="${modul.isCompleted()}">
                            <span class="oi oi-clock" title="offen"></span>
                        </g:elseif>
                        <g:else>
                            <span class="oi oi-ban" title="nicht bestanden"></span>
                        </g:else>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <div class="col-sm card ml-2">

            <div width="220" height="220" style="margin: 20px">
                <!--  <div style="width: <g:if
                        test="${nichtBestanden?.size()} == 0">0px</g:if><g:else>${nichtBestanden?.size()}px</g:else>; height:20px; background-color: darkred">${nichtBestanden?.size()}</div>
                <div style="width: <g:if
                        test="${bestanden?.size()} == 0">0px</g:if><g:else>${bestanden?.size()}px</g:else>; height:20px; background-color: #1e7e34">${bestanden?.size()}</div>-->
                <canvas id="progress" style="margin: 10px;"/>
                <script>
                    var c = document.getElementById("progress");
                    var ctx = c.getContext("2d");
                    ctx.beginPath();
                    ctx.arc(100, 100, 50, 0 * Math.PI, 1.5 * Math.PI);
                    ctx.strokeStyle = "#FF0000";
                    ctx.stroke();
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>