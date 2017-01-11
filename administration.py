from fulltime import *
from employees import * 
class Admin_Employee(FullTime, Employee):
  """Describes part-time employees"""

  def __init__(self, first_name, last_name):
    self.can_be_fired = True
    FullTime.__init__(self)
    Employee.__init__(self, first_name, last_name)