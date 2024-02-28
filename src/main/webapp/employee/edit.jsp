<%@ page import="com.entities.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="mb-3 mt-3 text-center">Edit Employee</h1>
            <div class="row">
                <div class="col-4 mx-auto">
                    <% Employee employee = (Employee) request.getAttribute("employee"); %>
                    <form action="edit-employee?id=<%= employee.getEmployeeId() %>" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Employee Name</label>
                            <input type="text" name="name" value="<%= employee.getEmployeeName() %>" class="form-control" id="name" required />
                        </div>

                        <div class="mb-3">
                            <label for="birthday" class="form-label">BirthDay</label>
                            <input type="date" name="birthday" value="<%= employee.getBirthday() %>" class="form-control" id="birthday" required />
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" name="phone" value="<%= employee.getPhoneNumber() %>" class="form-control" id="phone" minlength="10" required />
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" value="<%= employee.getEmail() %>" class="form-control" id="email" required/>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 mb-3">Save Change</button>
                        <a href="list-employee" class="text-center">Back to List Employee</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
