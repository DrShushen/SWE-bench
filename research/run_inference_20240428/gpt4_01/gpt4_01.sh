# From SWE-bench/inference, run:
cd inference
python run_api.py \
    --dataset_name_or_path princeton-nlp/SWE-bench_oracle \
    --model_name_or_path gpt-4-1106-preview \
    --output_dir /home/user/SWE-bench/research/run_inference_20240428/gpt4_01/out \
    --split dev

# See:
# https://github.com/princeton-nlp/SWE-bench/blob/main/inference/README.md

# Evaluation
cd swebench/harness
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240427/swe-bench-example-preds.json \
    --swe_bench_tasks /home/user/SWE-bench/research/reused/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240427/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240427/testbed
