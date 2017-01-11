# from employees import *
class Department(object):
    """Parent class for all departments

    Methods: __init__, get_name, get_chancellor, get_university,    get_campus, get_size_of_department
    """

    def __init__(self, name, chancellor, department_size, university, campus):
        self.name = name
        self.chancellor = chancellor
        self.size = department_size
        self.university = university
        self.campus = campus
        self.budget = 100000
        self.employees = set()

    def get_name(self):
        """Returns the name of the department"""
        return self.name

    def get_chancellor(self):
        """Returns the name of the chancellor"""
        return self.chancellor

    def get_size_of_department(self):
        """Returns the size of the department"""
        return self.size

    def get_university(self):
        """Returns the name of the university"""
        return self.university

    def get_campus(self):
        """Returns the campus"""
        return self.campus

    def get_budget(self):
        """Returns the budget"""
        return self.budget

    def get_employees(self):
        """Returns all employees"""
        employee_names = ""
        for employee in self.employees:
            employee_names = employee_names + employee.first_name + " " + employee.last_name + ", "
        
        return "In {}, there are the following employees: {}".format(self.name, employee_names[0:-2]) 
        