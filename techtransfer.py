from department import *

class TechTransfer(Department):
    """Class for representing Technology Transfer department

    Methods: __init__, add_policy, get_policy, add_technology, get_technology, get_profits, set_profits, set_budget, get_budget etc.
    """

    def __init__(self, name, chancellor, department_size, university, campus):
        super().__init__(name, chancellor, department_size, university, campus)
        self.policies = {}
        self.technologies = set()
        self.profits = 0

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

    def add_technology(self, technology_name, technology_creator, technology_worth):
        """Adds a technology, as a tuple, to the set of technology

        Arguments:
        technology_name (string)
        technology_creator (string)
        """
        self.profits = self.profits + technology_worth
        self.technologies.add((technology_name, technology_creator, technology_worth))

    def get_technologies(self):
        """ Returns technology """
        return self.technologies

    def set_profits(self):
        """ Calculates profits"""
        self.profits = self.profits - self.budget
    
    def get_profits(self):
        """ Returns profits """
        return self.profits

    def get_budget(self):
        super().get_budget()
        """ Returns tech transfer budget """
        self.budget = self.profits / 2

    