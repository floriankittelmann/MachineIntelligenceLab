#!/usr/bin/env bash
nof_trainings_total=`expr 27`
nof_training=`expr 1`
for batchsize in 2000 1500 2500
do
  for discount in 0.99 0.994 0.986
  do
    for learningRate in 0.1 0.16 0.04
    do
      echo "---------------- START WITH NEW TRAINING ----------------"
      echo "batchsize: $batchsize"
      echo "discount: $discount"
      echo "learning_rate: $learningRate"
      echo "training $nof_training out of $nof_trainings_total"
      echo "---------------- START WITH NEW TRAINING ----------------" >>result_hyperparameter_tuning_cart_pole.txt
      echo "batchsize: $batchsize" >> result_hyperparameter_tuning_cart_pole.txt
      echo "discount: $discount" >> result_hyperparameter_tuning_cart_pole.txt
      echo "learning_rate: $learningRate" >> result_hyperparameter_tuning_cart_pole.txt
      ./docker_run.sh simplepg/main.py CartPole-v0 --render True \
        --batch_size $batchsize \
        --discount $discount \
        --learning_rate $learningRate >> result_hyperparameter_tuning_cart_pole.txt
      nof_training=`expr $nof_training + 1`
    done
  done
done