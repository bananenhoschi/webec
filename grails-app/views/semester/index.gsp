<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Semester Übersicht</h2>
            <g:link controller="semester" action="create" class="btn btn-outline-success float-right">
                <span class="oi oi-plus">&nbsp;</span>Neues Semester
            </g:link>
        </div>

        <div class="card-body">
            <g:if test="${!semesters.empty}">
            <table class="table">
                <thead>
                <tr>
                    <th>Semester</th>
                    <th>Jahr</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <% semesters.each { semester -> %>
                <tr>
                    <td class="col-md-2">${semester.semesterTyp.getName()}</td>
                    <td class="col-md-2">${semester.jahr}</td>
                    <td class="col-md-8">
                        <g:link action="edit" id="${semester.id}"><span
                                class="oi oi-pencil col-sm-1 text-primary">&nbsp;</span></g:link>
                        <g:link action="delete" id="${semester.id}" method="delete"><span
                                class="oi oi-trash col-sm-1 text-danger">&nbsp;</span></g:link>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            </g:if>
            <g:else>
                <div class="alert alert-info">Du hast noch keine Semester erfasst.</div>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>