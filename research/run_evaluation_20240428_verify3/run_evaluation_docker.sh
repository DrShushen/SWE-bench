# First run:
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify3/check-harness.jsonl \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify3/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify3/testbed

# Then retry run:
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify3/check-harness.jsonl \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify3/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify3/testbed \
    --skip_existing
