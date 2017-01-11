import random
class Employee():
    """Parent class for all employees

    Methods: __init__, get_name, get_chancellor, get_university,    get_campus, get_size_of_department
    """
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

    def eat(self, food=None, companions=None):
        restaurants = ["Magic Mushroom", "Funk Seoul Brother", "Tin Angel", "Tavern", "Panera"]
        selected_restaurant = random.choice(restaurants)
        name = self.first_name + " " + self.last_name
        if food is None:
            chosen_food = "ordered nothing "
        else:
            chosen_food = "ordered" + food

        if companions is None:
            chosen_companions = "while alone "
        else:
            chosen_companions = " with"
            for companion in companions:
                chosen_companions = chosen_companions + " " + companion + " and"

        return "{} went to {}, and {}, {}".format(name, selected_restaurant, chosen_food, chosen_companions[0:-3])