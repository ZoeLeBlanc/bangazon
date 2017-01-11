from department import *
class HumanResources(Department):
    """Class for representing Human Resources department

    Methods: __init__, add_specialty, get_specialty, add_patient, get_enrolled_patients, add_degree, get_degree.
    """
    def __init__(self, name, chancellor, department_size, university, campus):
        super().__init__(name, chancellor, department_size, university, campus)
        self.policies = {}
        self.issues = set()
        self.resolutions = 0

    def add_policy(self, policy_name, policy_text):
        """Adds a policy, as a tuple, to the set of policies

        Arguments:
            policy_name (string)
            policy_text (string)
        """
        self.policies.add((policy_name, policy_text))

    def get_policy(self):
        """ Returns policies """
        return self.policies

    def add_issue(self, issue_description, issue_creator, issue_resolved):
        """Adds a issue, as a tuple, to the set of issue

        Arguments:
        issue_description (string)
        issue_creator (string)
        issue_resolved (boolean)
        """
        if issue_resolved is true:
            self.resolutions = self.resolutions + 1

        self.issues.add((issue_description, issue_creator, issue_resolved))

    def get_issues(self):
        """ Returns all issues """
        return self.issues

    def get_resolutions(self):
        """ Returns tech transfer budget """
        return self.resolutions

    def add_employee(self, employee):
        """Adds employee to set"""
        self.employees.add(employee)

    def remove_employee(self, employee):
        """Removes employee from set"""
        self.employees.remove(employee)
    