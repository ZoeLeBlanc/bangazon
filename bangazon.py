from department import *
from techtransfer import *
from artsandsciences import *
from medicalschool import *
from humanresources import *
from employees import *
from parttime import *
from fulltime import *
from tenured import *
from adjunct import *
from gradstudents import *
from administration import *

Arts = Arts_and_Sciences("Arts", "Zeppos", 40, "Vanderbilt", "central")


Arts.add_faculty("History", 40)
print(Arts)
print(Arts.get_size())
CTTC = TechTransfer("CTTC", "Zeppos", 20, "Vanderbilt", "central")
CTTC.add_technology("Archivlo", "Zoe LeBlanc", 20000)
CTTC.get_budget()
CTTC.set_profits()

print(CTTC.get_profits())

Zoe = Grad_Student("Zoe", "LeBlanc")
Zoe.eat()
print(Zoe.eat("pizza", ["Dani", "Whitney", "Dan"]))
Dan = Employee("Dan", "Miller")
print(Zoe)
Arts.add_employee(Zoe)
Arts.add_employee(Dan)

Helana = Admin_Employee("Helana", "IDK")
International_Students_Office = HumanResources("International Students Office", "Zeppos", 800, "Vanderbilt", "2500 West End Ave")
International_Students_Office.add_employee(Helana)
print(International_Students_Office.get_employees())
print(Arts.get_employees())