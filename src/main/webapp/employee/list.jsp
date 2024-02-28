<%@ page import="com.entities.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 28/02/2024
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="mb-3 mt-3 text-center">ABC Company's Employee List</h1>

            <div class="d-flex align-items-center justify-content-between">
                <a href="create-employee" class="btn btn-primary">Add New</a>

                <form class="row" method="post" action="search-employee">
                    <div class="col-auto p-0">
                        <input type="text" name="searchKeyword" class="form-control"  placeholder="Search here" required />
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-light btn-outline-secondary">
                            <i class="fa-solid fa-magnifying-glass"></i> Search
                        </button>
                    </div>
                </form>
            </div>

            <table class="table">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Employee Id</th>
                        <th scope="col">Employee Name</th>
                        <th scope="col">Birthday</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Email</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Employee s: (List<Employee>) request.getAttribute("employees")) { %>
                    <tr>
                        <th scope="row"><%= s.getEmployeeId() %></th>
                        <td><%= s.getEmployeeName() %></td>
                        <td><%= s.getBirthday() %></td>
                        <td><%= s.getPhoneNumber() %></td>
                        <td><%= s.getEmail() %></td>
                        <td>
                            <a href="edit-employee?id=<%= s.getEmployeeId() %>" class="btn btn-primary">
                                <i class="fa-solid fa-pen"></i>
                            </a>
                            <a onclick="deleteEmployee('<%= s.getEmployeeId() %>')" href="javascript:void(0);" class="btn btn-danger">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </section>

    <script>
        function deleteEmployee(id) {
            if (confirm("Are you sure?")){
                var url = `list-employee?id=` + id;
                fetch(url, {
                    method: 'DELETE'
                }).then(response => {
                    if (response.ok) {
                        if (confirm("Reload page?")) {
                            window.location.reload();
                        }
                    } else {
                        throw new Error("Cannot delete employee. Please try again!");
                    }
                }).catch(error => {
                    alert(error.message);
                });
            }
        }
    </script>
</body>
</html>
