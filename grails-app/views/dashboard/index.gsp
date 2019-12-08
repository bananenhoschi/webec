<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <h3>Aktuelles Semester</h3>
                </div>

                <div class="card-body">
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
                        <% module.each { modul -> %>
                        <tbody class="table table-striped ">
                        <tr>
                            <td>${modul.kuerzel}</td>
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
                                    <span class="oi oi-check" title="bestanden"></span>
                                </g:if>
                                <g:elseif test="${!modul.isCompleted()}">
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
            </div>
        </div>

        <div class="col-sm">
            <div class="card">
                <div class="card-header">
                    <h3><span class="oi oi-bar-chart"></span> Dein Fortschritt</h3>
                </div>

                <div class="card-body">

                    <div width="320" height="320" style="margin: 20px">

                        <canvas id="max" style="position: absolute"></canvas>

                        <canvas id="bestanden" style="position: absolute"></canvas>
                        <canvas id="nichtBestanden" style="position: absolute"></canvas>
                        <canvas id="aktuell" style="position: absolute"></canvas>

                        <h1>${ectsBestanden}</h1>
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
                            ctx.fillStyle = "#3e9712";
                            ctx.fillRect(0, 0, ${ectsBestanden}, 40);
                            ctx.stroke();

                            var c = document.getElementById("aktuell");
                            var ctx = c.getContext("2d");
                            ctx.beginPath();
                            ctx.fillStyle = "#ffe722";
                            ctx.fillRect(${ectsBestanden}, 0, ${ectsAktuell}, 40);
                            ctx.stroke();

                            var c = document.getElementById("nichtBestanden");
                            var ctx = c.getContext("2d");
                            ctx.beginPath();
                            ctx.fillStyle = "#f63a18";
                            ctx.fillRect(0, 0, ${ectsNichtBestanden}, 40);
                            ctx.stroke();
                        </script>
                    </div>
                </div>
            </div>
            <br/>

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
        </div>
    </div>
</div>
</body>
</html>