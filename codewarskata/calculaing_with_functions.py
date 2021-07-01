def perform_operation(operations, number):
    if not operations: return number
    if operations["sign"] == "*":
        return operations["value"] * number
    if operations["sign"] == "+":
        return operations["value"] + number
    if operations["sign"] == "-":
        return number - operations["value"] 
    if operations["sign"] == "/":
        return  number // operations["value"]

zero = lambda operations=None : perform_operation(operations, 0)
one = lambda operations=None : perform_operation(operations, 1)
two = lambda operations=None : perform_operation(operations, 2)
three = lambda operations=None : perform_operation(operations, 3)
four = lambda operations=None : perform_operation(operations, 4)
five = lambda operations=None : perform_operation(operations, 5)
six = lambda operations=None : perform_operation(operations, 6)
seven = lambda operations=None : perform_operation(operations, 7)
eight = lambda operations=None : perform_operation(operations, 8)
nine = lambda operations=None : perform_operation(operations, 9)

get_operation = lambda operation, num : {"sign": operation, "value": num}
plus = lambda num : get_operation("+", num)
minus = lambda num : get_operation("-", num)
times = lambda num : get_operation("*", num)
divided_by = lambda num : get_operation("/", num)

