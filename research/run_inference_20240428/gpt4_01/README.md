```bash
EXPPATH="/home/user/SWE-bench/research/run_inference_20240428/gpt4_01"
OUTPATH="$EXPPATH/out"

# From SWE-bench/inference, run:
cd inference
python run_api.py \
    --dataset_name_or_path princeton-nlp/SWE-bench_oracle \
    --model_name_or_path gpt-4-1106-preview \
    --output_dir $OUTPATH \
    --split dev

python /home/user/SWE-bench/research/scripts/jsonl_to_json.py $OUTPATH/gpt-4-1106-preview__SWE-bench_oracle__dev.jsonl $OUTPATH/gpt-4-1106-preview__SWE-bench_oracle__dev.json

python /home/user/SWE-bench/research/scripts/filter_by_instance_ids.py $OUTPATH/gpt-4-1106-preview__SWE-bench_oracle__dev.json /home/user/SWE-bench/research/datasets/swe-bench-dev.json $OUTPATH/swe-bench-dev-filtered.json

mkdir $EXPPATH/eval
mkdir $EXPPATH/eval/logs
mkdir $EXPPATH/eval/testbed

cd swebench/harness
python run_evaluation.py \
    --predictions_path $OUTPATH/gpt-4-1106-preview__SWE-bench_oracle__dev.json \
    --swe_bench_tasks $OUTPATH/swe-bench-dev-filtered.json \
    --log_dir $EXPPATH/eval/logs \
    --testbed $EXPPATH/eval/testbed

```
