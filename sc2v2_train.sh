#!/bin/bash
rm -rf datasets/*.pkl
python3 src/main.py --config=MAICC --env-config=sc2v2 with env_args.map_name="smac_test" train_mode=0
python3 src/main.py --config=MAICC --env-config=sc2v2 with env_args.map_name="smac_test" train_mode=1 checkpoint_path="results/models/IC-MARL_sc2v2_mode0"

for i in {1..10}
do
    echo "Running the script $i times..."
    python3 src/main.py --config=MAICC --env-config=sc2v2 with env_args.map_name="smac_test" train_mode=1 checkpoint_path="results/models/IC-MARL_sc2v2_mode1" evaluate=True use_tensorboard=False weight=0.8 ind_weight=0.2
done
