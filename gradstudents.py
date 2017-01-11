from parttime import *
from employees import *


class Grad_Student(PartTime, Employee):

    def __init__(self, first_name, last_name):
        self.can_be_fired = True
        PartTime.__init__(self)
        Employee.__init__(self, first_name, last_name)

    def __str__(self):
        return "It is {} that they can be fired, and they work {} hours/per week".format(self.can_be_fired, self.hours_per_week) 