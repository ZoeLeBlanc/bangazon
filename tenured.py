from fulltime import *
class Tenured(FullTime):
  """Describes part-time employees"""

  def __init__(self):
    this.tenured = true
    this.can_be_fired = false
    FullTime.__init__()