from department import *
class Arts_and_Sciences(Department):
    """Class for representing Arts and Sciences department

    Methods: __init__, add_faculty, get_faculty, add_student, get_enrolled_students, add_degree, get_degree, get_size.
    """

    def __init__(self, name, chancellor, department_size, university, campus):
        super().__init__(name, chancellor, department_size, university, campus)
        self.degrees= {}
        self.faculties = set()
        self.enrolled_students = set()
    def add_degree(self, degree_name, degree_text):
        """Adds a degree, as a tuple, to the set of degrees

        Arguments:
        degree_name (string)
        degree_text (string)
        """
        self.degrees.add((degree_name, degree_text))

    def get_degree(self):
        """ Returns the degrees awarded """
        return self.degrees

    def add_faculty(self, faculty_name, faculty_size):
        """Adds a faculty, as a tuple, to the set of faculties

        Arguments:
        faculty_name (string)
        faculty_size (number)
        """
        self.size = self.size + faculty_size
        self.faculties.add((faculty_name, faculty_size))

    def get_faculties(self):
        """ Returns the faculties """
        return self.faculties

    def add_student(self, student_name, student_year):
        """Adds a student, as a tuple, to the set of students

        Arguments:
        student_name (string)
        student_year (string)
        """
        self.enrolled_students.add((student_name, student_year))

    def get_students(self):
        """ Returns the enrolled students """
        return self.enrolled_students

    def get_size(self): 
        """Calculate size of entire department by number of faculties, not employees"""
        return self.size 
          
    def add_employee(self, employee):
        """Adds employee to set"""
        self.employees.add(employee)

    def remove_employee(self, employee):
        """Removes employee from set"""
        self.employees.remove(employee)

    def __str__(self):
        faculty_list = ""
        for faculty, size in self.faculties:
            faculty_list = faculty+ " with a size of " + str(size) +", "
        return "Department is {} with faculties in {}".format(self.name, faculty_list[0:-2])