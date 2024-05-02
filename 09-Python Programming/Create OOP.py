class DataAnalyst:
    def __init__(self, name, age, company):
        self.name = name
        self.age = age
        self.company = company

    def greeting(self, names):
        print(f"Hello! welcome to the job future {names}")

    def role(self):
        if self.age <= 25 :
            print("Make report and presentation")
        else :
            print("Youy role include decision making")

    def company_size(self, size):
        print(f"Your company size is {size}")

name_1 = DataAnalyst("Top", 22, "Safran")
print(name_1.name)

name_1.role()
name_1.company_size("medium")

# Top
# Make report and presentation
# Your company size is medium
