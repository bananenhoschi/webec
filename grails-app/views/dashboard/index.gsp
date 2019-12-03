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

            <div width="320" height="320" style="margin: 20px">
                <canvas id="max" style="position: absolute"></canvas>

                <canvas id="bestanden" style="position: absolute"></canvas>
                <canvas id="nichtBestanden" style="position: absolute"></canvas>
               <h1> ${ectsBestanden}</h1>
                <script>

                    var c = document.getElementById("max");
                    var ctx = c.getContext("2d");
                    ctx.beginPath();
                    ctx.fillStyle = "#787878";
                    ctx.fillRect(0, 0, 180, 40);
                    ctx.stroke();

                    var c = document.getElementById("bestanden");
                    var ctx = c.getContext("2d");
                    ctx.beginPath();
                    ctx.fillStyle = "#00B300";
                    ctx.fillRect(0, 0, ${ectsBestanden}, 40);
                    ctx.stroke();

                    var c = document.getElementById("bestanden");
                    var ctx = c.getContext("2d");
                    ctx.beginPath();
                    ctx.fillStyle = "#ffe722";
                    ctx.fillRect( ${ectsBestanden}, 0, ${ectsAktuell}, 40);
                    ctx.stroke();

                    var c = document.getElementById("nichtBestanden");
                    var ctx = c.getContext("2d");
                    ctx.beginPath();
                    ctx.fillStyle = "#FF0000";
                    ctx.fillRect(0, 0, ${ectsNichtBestanden}, 40);
                    ctx.stroke();
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>