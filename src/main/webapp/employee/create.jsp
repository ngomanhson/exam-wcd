
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 28/02/2024
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="mb-3 mt-3 text-center">Create Employee</h1>
           <div class="row">
               <div class="col-4 mx-auto">
                   <form action="create-employee" method="post">
                       <div class="mb-3">
                           <label for="id" class="form-label">Employee Id</label>
                           <input type="text" name="id" class="form-control" id="id" required />
                       </div>
                       <div class="mb-3">
                           <label for="name" class="form-label">Employee Name</label>
                           <input type="text" name="name" class="form-control" id="name" required />
                       </div>

                       <div class="mb-3">
                           <label for="birthday" class="form-label">BirthDay</label>
                           <input type="date" name="birthday" class="form-control" id="birthday" required />
                       </div>

                       <div class="mb-3">
                           <label for="phone" class="form-label">Phone</label>
                           <input type="text" name="phone" class="form-control" id="phone" minlength="10" required/>
                       </div>

                       <div class="mb-3">
                           <label for="email" class="form-label">Email</label>
                           <input type="email" name="email" class="form-control" id="email" required/>
                       </div>

                       <button type="submit" class="btn btn-primary w-100 mb-3">Create</button>
                       <a href="list-employee" class="text-center">Back to List Employee</a>
                   </form>
               </div>
           </div>
        </div>
    </section>
</body>
</html>
