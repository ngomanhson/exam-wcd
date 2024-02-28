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
import java.util.List;

@WebServlet("/search-employee")
public class EmployeeSearchController extends HttpServlet {

    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employee/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchKeyword = request.getParameter("searchKeyword");

        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            List<Employee> list = session.createQuery("SELECT e FROM Employee e WHERE e.employeeId LIKE :keyword OR e.employeeName LIKE :keyword", Employee.class)
                    .setParameter("keyword", "%" + searchKeyword + "%")
                    .getResultList();

            request.setAttribute("searchResults", list);
            session.getTransaction().commit();
        }
        request.getRequestDispatcher("employee/search.jsp").forward(request, response);
    }
}
