import csv
from collections import defaultdict


def analyze_data(filename):
    data = defaultdict(int)

    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip the header row

        for row in csv_reader:
            hour = row[0]
            count = int(row[2])
            data[hour] += count

    max_hour = max(data, key=data.get)
    max_count = data[max_hour]

    return max_hour, max_count


def output_max_hour_operations(filename, max_hour):
    operations = {}

    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip the header row

        for row in csv_reader:
            hour = row[0]
            operation_name = row[1]
            count = int(row[2])

            if hour == max_hour:
                operations[operation_name] = count

    return operations


filename = 'data.csv'  # Replace 'data.csv' with the actual filename

max_hour, max_count = analyze_data(filename)
print(f"The maximal hour with the highest count is: {max_hour} with a count of {max_count}")

operations = output_max_hour_operations(filename, max_hour)

print(f"\nOperations and their intensities within the maximal hour ({max_hour}):")
for operation, intensity in operations.items():
    print(f"Operation: {operation}\tIntensity: {intensity}")
