#!/usr/bin/env sh

source activate carnd-capstone

python ./models/research/object_detection/train.py --pipeline_config_path=training.config --train_dir=training_intermediate

rm -rf training_results

python ./models/research/object_detection/export_inference_graph.py --pipeline_config_path=training.config --trained_checkpoint_prefix=training_intermediate/model.ckpt-10000 --output_directory=training_results

cp -f ./training_results/frozen_inference_graph.pb training_results.pb