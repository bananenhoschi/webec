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
            <h2>Semester Übersicht</h2>
            <g:link controller="semester" action="create" class="btn btn-outline-success float-right">
                <span class="oi oi-plus"></span> Neues Semester
            </g:link>
        </div>

        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th>Semester</th>
                    <th>Jahr</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <% semesterList.each { semester -> %>
                <tr>
                    <td class="col-md-2">${semester.semesterTyp.getName()}</td>
                    <td>${semester.jahr}</td>
                    <td class="float-right">
                        <g:link action="edit" id="${semester.id}"><span
                                class="oi oi-pencil"></span></g:link>
                        <g:link action="delete" id="${semester.id}"><span
                                class="oi oi-trash"></span></g:link>
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