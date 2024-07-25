# todo: learn what this file does
# Import the necessary modules
import math

# ! Don't know what this one does yet.
# Define a simple function to calculate the area of a circle
def calculate_area(radius):
    """
    Calculate the area of a circle given its radius.
    :param radius: The radius of the circle
    :return: The area of the circle
    """
    # Use the formula: area = π * radius^2
    area = math.pi * radius ** 2
    return area

# ! Don't know what this one does yet.
# Define the main function
def main():
    """
    Main function to execute the script.
    """
    # Define a list of radii
    radii = [1, 2, 3, 4, 5]
    
    # Loop through each radius and calculate the area
    for radius in radii:
        # Calculate the area
        area = calculate_area(radius)
        # Print the result
        print(f"The area of a circle with radius {radius} is {area:.2f}")

# ? I have a guess for this one
# Check if the script is being run directly
if __name__ == '__main__':
    main() # Call the main function
