#!/bin/bash
rm -rf datasets/*.pkl
python3 src/main.py --config=MAICC --env-config=gymma with env_args.time_limit=20 env_args.key="lbforaging:Foraging-1s-9x9-3p-1f-coop-task10-v1" train_mode=0
python3 src/main.py --config=MAICC --env-config=gymma with env_args.time_limit=20 env_args.key="lbforaging:Foraging-1s-9x9-3p-1f-coop-task10-v1" train_mode=1 checkpoint_path="results/models/IC-MARL_gymma_mode0"

for i in {1..10}
do
    echo "Running the script $i times..."
    python3 src/main.py --config=MAICC --env-config=gymma with env_args.time_limit=20 env_args.key="lbforaging:Foraging-1s-9x9-3p-1f-coop-task10-v1" train_mode=1 checkpoint_path="results/models/IC-MARL_gymma_mode1" evaluate=True use_tensorboard=False weight=0.8 ind_weight=0.2
done
