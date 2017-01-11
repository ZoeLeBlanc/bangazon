from department import *
class MedicalSchool(Department):
    """Class for representing Medical School department

    Methods: __init__, add_specialty, get_specialty, add_patient, get_enrolled_patients, add_degree, get_degree.
    """

    def __init__(self, name, chancellor, department_size, university, campus):
        super().__init__(name, chancellor, department_size, university, campus)
        self.degrees= {}
        self.specialties = set()
        self.enrolled_patients = set()
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

    def add_specialty(self, specialty_name, specialty_time_to_degree):
        """Adds a specialty, as a tuple, to the set of faculties

        Arguments:
        specialty_name (string)
        specialty_time_to_degree (number)
        """
        self.faculties.add((specialty_name, specialty_time_to_degree))

    def get_specialties(self):
        """ Returns the faculties """
        return self.faculties

    def add_student(self, student_name, student_year):
        """Adds a student, as a tuple, to the set of students

        Arguments:
        student_name (string)
        student_year (string)
        """
        self.students.add((student_name, student_year))

    def get_students(self):
        """ Returns the enrolled students """
        return self.enrolled_students

    def get_number_of_specialties(self): 
        """Calculate size of entire department by number of faculties, not employees"""
        return len(self.specialties)  