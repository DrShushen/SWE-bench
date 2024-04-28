# python filter_by_instance_ids.py input.json other.json other_filtered.json
# Filter the SWE-bench format JSON `other.json` to only contain `instance_id`s from input.json

import json
import sys

def filter_json_instances(input_file_path, other_file_path, output_file_path):
    # Load the instance IDs from the input file
    with open(input_file_path, 'r') as file:
        input_data = json.load(file)
    input_ids = {item['instance_id'] for item in input_data}

    # Load data from the other file
    with open(other_file_path, 'r') as file:
        other_data = json.load(file)

    # Filter items that have matching instance IDs
    filtered_data = [item for item in other_data if item['instance_id'] in input_ids]

    # Write the filtered data to the output file
    with open(output_file_path, 'w') as file:
        json.dump(filtered_data, file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python filter_by_instance_ids.py input.json other.json other_filtered.json")
        sys.exit(1)
    
    # Command line arguments for file paths
    input_file_path = sys.argv[1]
    other_file_path = sys.argv[2]
    output_file_path = sys.argv[3]
    
    filter_json_instances(input_file_path, other_file_path, output_file_path)
