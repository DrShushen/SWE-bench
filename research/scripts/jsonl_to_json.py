# python jsonl_to_json.py input.jsonl output.json
# Convert input.jsonl JSONL to a JSON (output.json).

import json
import sys

def jsonl_to_json(jsonl_file_path, json_file_path):
    # Read the JSONL file
    with open(jsonl_file_path, 'r') as file:
        jsonl_data = file.readlines()
    
    # Parse each line as JSON
    json_data = [json.loads(line) for line in jsonl_data]
    
    # Write the list of JSON objects to a JSON file
    with open(json_file_path, 'w') as file:
        json.dump(json_data, file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python jsonl_to_json.py input.jsonl output.json")
        sys.exit(1)
    
    # Command line arguments for file paths
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    
    jsonl_to_json(input_path, output_path)
