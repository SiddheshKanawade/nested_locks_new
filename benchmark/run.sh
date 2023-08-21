#!/bin/bash


#list programs to be analysed
#for user interface mode run ./interface.sh instead ./run.sh

scripts=(
  sumo/sumo.c
  
)
  # fse_obstacle/fse_obstacle.c
  # avionics/avionics.c
  # biped_robot/biped_robot.c
  # sumo/sumo.c
  # nxtgt/nxtgt.c
  # lego_osek/lego_osek.c
  # objectfollower/objectfollower.c
  # nxtway_gs/nxtway_gs.c
  # car/car.c
  # ardupilot/ardupilot.c
  # follower/follower.c
  # sumo/sumoR.c
  # car/carR.c

all_results=all_results.csv
all_ruleCoverage=all_ruleCoverage.csv
all_schedulabilityResults=all_schedulabilityResults.csv
echo "Program","LoC", "Tasks", " CAs" , "PRs "," %Elim" > $all_results
echo "Program", " CAs", "R1", "R2", "R3", "R4", "R5", "R6"  > $all_ruleCoverage
echo "Program", "Task", "Schedulability", "WCRT", "Period" > $all_schedulabilityResults
for script in ${scripts[@]}; do
  echo 
  echo $script 
  #Uncomment below to collect results for schedulability analysis of all benchmarks if running from terminal  
  sudo cilly -c -w --save-temps --dodisjoint --schedulabilityCheck $script 
  #Uncomment below to collect results for analysis of all benchmarks running from terminal
  #sudo cilly -c -w --save-temps --dodisjoint $script
  #Uncomment below to collect results for schedulability analysis of all benchmarks if running using docker image pepracer 
  #sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --dodisjoint --schedulabilityCheck $script 
  
  sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --dodisjoint $script
  
  (wc -l $script) 2>&1 | awk '{ print $1 }' >> results.dat
  echo ", " >> results.dat
  sed -i 'N;s/\(.*\)\n\(.*\)/\2\1/' results.dat
  echo $script >> results.dat
  sed -i 'N;s/\(.*\)\n\(.*\)/\2\1/' results.dat
  sed -i 'N;s/\(.*\)\n\(.*\)/\2\1/' results.dat
  #cat results.dat
  cat results.dat >> $all_results

  
  echo $script >> ruleCoverage.dat
  sed -i 'N;s/\(.*\)\n\(.*\)/\2\1/' ruleCoverage.dat
  cat ruleCoverage.dat >> $all_ruleCoverage

  #sed  -i '1i text' schedulabilityResults.dat
  echo $script >> schedulabilityResults.dat
  sed -i '1h;1d;$!H;$!d;G' schedulabilityResults.dat
  #sed -i 'N;s/\(.*\)\n\(.*\)/\2\1/' schedulabilityResults.dat
  cat schedulabilityResults.dat >> $all_schedulabilityResults
  > schedulabilityResults.dat
done

