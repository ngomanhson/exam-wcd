package com.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @Column(nullable = false, unique = true, length = 20)
    public String employeeId;

    @Column(nullable = false, length = 64)
    public String employeeName;

    @Column(nullable = false)
    public String email;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    public Date birthday;

    @Column(nullable = false, length = 11)
    public String phoneNumber;

    public String getEmployeeId() {
        return employeeId;
    }

    public Employee setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
        return this;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public Employee setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Employee setEmail(String email) {
        this.email = email;
        return this;
    }

    public Date getBirthday() {
        return birthday;
    }

    public Employee setBirthday(Date birthday) {
        this.birthday = birthday;
        return this;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Employee setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        return this;
    }
}
