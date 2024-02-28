package com.controllers;

import com.entities.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/create-employee")
public class EmployeeCreateController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("employee/create.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setEmployeeId(req.getParameter("id"));
        employee.setEmployeeName(req.getParameter("name"));
        employee.setEmail(req.getParameter("email"));
        employee.setPhoneNumber(req.getParameter("phone"));

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthday = dateFormat.parse(req.getParameter("birthday"));
            employee.setBirthday(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(employee);
            session.getTransaction().commit();
        }
        resp.sendRedirect("list-employee");
    }
}
