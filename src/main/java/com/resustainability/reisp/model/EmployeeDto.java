package com.resustainability.reisp.model;

public class EmployeeDto {
	 private String empCode;
	    private String firstName;

	    public EmployeeDto() {
	    }

	    public EmployeeDto(String empCode, String firstName) {
	        this.empCode = empCode;
	        this.firstName = firstName;
	    }

	    public String getEmpCode() {
	        return empCode;
	    }

	    public void setEmpCode(String empCode) {
	        this.empCode = empCode;
	    }

	    public String getFirstName() {
	        return firstName;
	    }

	    public void setFirstName(String firstName) {
	        this.firstName = firstName;
	    }

	    @Override
	    public String toString() {
	        return "EmployeeDto{" +
	                "empCode='" + empCode + '\'' +
	                ", firstName='" + firstName + '\'' +
	                '}';
	    }
}
