# NOTE: DOESN'T WORK

import pandas as pd
import sys

def parquet_to_json(parquet_file_path, json_file_path):
    # Read the Parquet file
    df = pd.read_parquet(parquet_file_path)
    
    # Write the DataFrame to a JSON file
    df.to_json(json_file_path, orient='records', lines=True)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python parquet_to_json.py input.parquet output.json")
        sys.exit(1)
    
    # Command line arguments for file paths
    input_file_path = sys.argv[1]
    output_file_path = sys.argv[2]
    
    parquet_to_json(input_file_path, output_file_path)
