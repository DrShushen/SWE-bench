python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/fake_solutions.json \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/testbed

# PARTIAL...
# fake_solutions_PART.json takes first 22 problems
# We want to see if the weird requests/urllib exceptions import error resurfaces.
# It happens with the full set.
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/fake_solutions_PART.json \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/testbed


### FINAL
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/fake_solutions_WORKING.json \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/testbed
python /home/user/SWE-bench/swebench/harness/run_evaluation.py \
    --predictions_path /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/fake_solutions_WORKING.json \
    --swe_bench_tasks /home/user/SWE-bench/research/datasets/swe-bench.json \
    --log_dir /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/logs \
    --testbed /home/user/SWE-bench/research/run_evaluation_20240428_verify_swebenchlite/testbed \
    --skip_existing
