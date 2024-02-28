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

@WebServlet(value = "/edit-employee")
public class EmployeeEditController extends HttpServlet {
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
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee employee = session.get(Employee.class, entityId);
            session.getTransaction().commit();
            if (employee != null){
                req.setAttribute("employee", employee);
                req.getRequestDispatcher("employee/edit.jsp").forward(req,resp);
            } else {
                resp.setStatus(404);
            }
        } catch (Exception e){
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");

        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Employee employee = session.get(Employee.class, entityId);
            if (employee != null){
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
                session.update(employee);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-employee");
        } catch (Exception e){
            resp.setStatus(500);
        }
    }
}
