####################################################################
# Version:                  v1.0
# Description:              function to get the vaule by passing nested object and key
# Example: object = {“a”:{“b”:{“c”:”d”}}}
#          key    = a/b/c
#          object = {“x”:{“y”:{“z”:”a”}}}
#          key = x/y/z
#          value = a
# Required Parameters:      Nested Object and Keys
# Created By:               Ankaj Thakur (01-04-2023)
####################################################################

# Define Function
def func_get_value_from_nested_object(object, key):
    # split the key into individual keys
    keys = key.split('/')

    # loop through the keys to get to the final value
    for key in keys:
        object = object[key]

    return object


# call the function
object = {"a": {"b": {"c": "d"}}}
key = "a/b/c"
value = func_get_value_from_nested_object(object, key)
print(value)
object = {"x": {"y":{"z": "a"}} }
key = "x/y/z"
value = func_get_value_from_nested_object(object, key)
print(value)
