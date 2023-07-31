# PePRacer
Paper related to this work available: [https://link.springer.com/content/pdf/10.1007/978-3-030-99336-8_11.pdf](https://link.springer.com/content/pdf/10.1007/978-3-030-99336-8_11.pdf).


PePRacer is the OCaml based C Intermediate Language (CIL) static analysis framework.

Follow the instructions:

### Contents in paper61.zip

- benchmark: benchmarks used to test PePRacer tool explained in the paper.
- cil-develop: C Intermediate Language (CIL) is a front-end for the C programming language that facilitates program analysis and transformation. The rules for data race detection is added in /cil-develop/src/ext/analysis.
- Dockerfile: The docker instructions to build image.
- heptane_svn: Worst Case Execution Time (WCET) analysis tool used.
- WCET_Results.pdf: WCET results for the benchmarks.

### 1. Getting Started Guide

##### PePRacer using Docker

- Install docker [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/).

    - Ubuntu: [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/).
    - Windows: [https://docs.docker.com/desktop/windows/install/](https://docs.docker.com/desktop/windows/install/).
    - Mac: [https://docs.docker.com/desktop/mac/install/](https://docs.docker.com/desktop/mac/install/).


###### Building the Docker image locally.

The size of the docker image ~6GB. Time taken ~30min

```
$ git clone https://gitlab.com/VividTyro/pepracer.git
$ cd pepracer/
$ unzip paper61.zip
$ cd paper61
$ sudo docker build -t pepracer . --progress=plain --platform=linux/amd64

```
Set permission
```
$ cd benchmark
$ chmod 755 results.dat
$ chmod 755 ruleCoverage.dat
$ chmod 755 schedulabilityResults.dat
```
Run the pepracer from the benchmark folder.

###### Enter Docker Container and run

```
$ sudo docker run --rm -i -v "$PWD":/data pepracer <command>

<command> is given below:

$ cilly -c -w --save-temps --dodisjoint <path to input file> //input programs without library functions
$ cilly -c -w --save-temps -I/<path to folder> --dodisjoint <path to input file> //input programs with library functions

```

```
$ cd benchmark
$ sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --dodisjoint fse_obstacle/fse_obstacle.c

```

Similarly other benchmark programs can be run using pepracer.

##### Sample Input

fse_obstacle.c

Input program is in C language with functions inlined in it. Add a function, void main().

Add task details:
* create_task(task name, function name, priority, period, WCET);

Add critical block details(if present): 
* create_block(line number, function name, lock, number of locks, task priority, WCET of block);

```
int Obstacle = 0; int Forward = 50;

void ProgA (int Sensor_input)
{
  Obstacle = 0;
  if (Sensor_input <= 10)
  {
    Obstacle = 1;
    Forward = -100;
  }
}

void ProgB ()
{
  if (!Obstacle)
  {
    Forward = 100; 
  }
}

void main()
{
  create_task("ProgA","ProgA",2,100,0.016);
  create_task("ProgB","ProgB",1,200,0.009);
}

```

##### Sample Output

Expected output: 

Results:
- No. of periodic tasks in the program.
- Schedulable or not - Task name : WCRT 
- Conflicting accesses of the input program is listed as an access pair

(<TaskName, LineNo., Variable, AccessType>,<TaskName, LineNo., Variable, AccessType>) 

For eg: (<ProgA,5,Obstacle,write>,<ProgB,15,Obstacle,read>)
- Rules for checking disjointness are applied on the list of conflicting accesses. Non racy accesses are eliminated in this process.
- Finally the number of potentially racy accesses are listed.
- Potential races : 0, means the listed conflicting accesses of the program are non-racy.

Rule Coverage:
- Shows the number of conflicting accesses eliminated by each rule independently.

Result for fse_obstacle.c

```

Results
No. of tasks: 2
Schedulable - ProgA : WCRT = 0.016000
Schedulable - ProgB : WCRT = 0.025000
Conflicting Accesses: 3
(<ProgA,5,Obstacle,write>,<ProgB,15,Obstacle,read>)
(<ProgA,8,Obstacle,write>,<ProgB,15,Obstacle,read>)
(<ProgA,9,Forward,write>,<ProgB,17,Forward,write>)
 
Potentially racy accesses remaining after rule1 : 3

Potentially racy accesses remaining after rule2 : 3

Potential races: 0 

Rule Coverage

Conflicting Accesses : 3
Applying rule.....1
No. of CAs eliminated: (3-3) = 0

Applying rule.....2
No. of CAs eliminated: (3-3) = 0

Applying rule.....3
No. of CAs eliminated: (3-0) = 3

Applying rule.....4
No. of CAs eliminated: (3-3) = 0

Applying rule.....5
No. of CAs eliminated: (3-3) = 0

Applying rule.....6
No. of CAs eliminated: (3-3) = 0


...Analysis Completed...

```
Command to collect all results
```
$ cd benchmark
$ ./run.sh

```
Running above command results in:
- benchmark/all_results.csv- Result of the PePRacer for all the benchmark programs.
- benchmark/all_ruleCoverage.csv- Conflicting accesses eliminated by single rule(Table 3: Rule Coverage in paper61.pdf)
- benchmark/all_schedulabilityResults.csv- Results for the schedulability analysis.

###### Time taken by tool

Running time is calculated using the command given below. 

```
$ cd benchmark
$ sudo docker run --rm -i -v "$PWD":/data pepracer time -p cilly -c -w --save-temps --dodisjoint fse_obstacle/fse_obstacle.c

```
Average of (user + sys) value for 10 runs is calculated. Refer Section 7.3, Table 2: Results of paper61.pdf

### 2. Step by Step Instructions

- We ran our tool on an Intel Quad Core i7-3770 3.40GHz machine running Ubuntu 18.04.4.

##### PePRacer from terminal

##### 2.1 CIL

```
$ cd cil-develop
$ sudo make
$ sudo make install

```

For more information refer [CIL](https://people.eecs.berkeley.edu/~necula/cil/)

##### 2.2 Inline functions

```
$ sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --inline="<function name>" -I/<path to directory containing header files> <path to input_file> 

```
###### Inliner Sample
A sample program to demonstrate inlining is given in paper61/benchmark/sample_inline/sample_fse.c

```
$ cd benchmark/sample_inline
$ sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --inline="setForward" sample_fse.c
$ sudo sed -i '/#line/d' sample_fse.cil.c

```
The input to the inliner is sample_fse.c and the inlined program is sample_fse.cil.c. Repeat this step for each function to be inlined. After inlining the comments generated by the CIL is removed.

##### 2.3 Worst Case Execution Time (WCET) Analysis

###### Heptane using docker

```
$ cd heptane_svn
$ sudo docker run --rm -i -v "$PWD":/data pepracer ./extract.sh fse_obstacle ARM
$ sudo docker run --rm -i -v "$PWD":/data pepracer ./analysis.sh fse_obstacle ARM lp_solve

```
Details of heptane is given in the section Heptane run

###### Heptane from terminal 

The installation steps for Heptane is given in /pepracer/paper61/heptane_svn/doc/index.html.

```
$ cd heptane_svn
$ ./install.sh

```

###### Fixes for the missing dependency errors

```
Install lp-solve
$ sudo apt-get -y install lp-solve

Install wget 
$ sudo apt-get install -y wget

Install gcc-arm-none-eabi
$ sudo apt-get install -y gcc-arm-none-eabi

Install libxml2-dev 
$ sudo apt-get install -y libxml2-dev 

Install libc6-i386
RUN sudo apt-get install -y libc6-i386

Install doxygen
$ sudo git clone https://github.com/doxygen/doxygen.git
$ sudo cd doxygen
$ sudo mkdir build
$ cd build
$ sudo apt-get -y install cmake 
$ sudo apt-get -y install graphviz 
$ sudo apt-get -y install flex 
$ sudo apt-get -y install bison 
$ sudo cmake -G "Unix Makefiles" ..
$ sudo make
$ sudo make install

```

###### Heptane run

Heptane accepts inputs in the form of C programs. To prepare the benchmark programs the following modifications were made:
- All non-C constructs in the benchmarks were translated to suitable C constructs, e.g. TASKs in OSEK programs were converted to correspondingly named functions.
- All code was merged into a single C file. 
- Some benchmark programs did not have the source for some of their parts. Heptane needs the source code for the
entire program being analysed. Hence, all code for which source code was not
available was replaced with minimal stubs. 
- Loop bounds were provided using ANNOT_MAXITER as required by Heptane. These loop bounds were computed by
manual inspection.
- Pointers are not supported.

Heptane first extracts the control flow graph(CFG) of the program and then analysis is performed.

```
$ ./extract.sh <folder containing input file> ARM
$ ./analysis.sh <folder containing input file> ARM lp_solve

```

WCET results for fse_obstacle.c

```
$ cd heptane_svn
$ sudo ./extract.sh fse_obstacle ARM

```

```
Heptane extract::Generating files (fse_obstacle)
/home/se-lab/heptane/heptane_svn/CROSS_COMPILERS/ARM/bin/arm-none-eabi-objdump: section '.wcet_annot' mentioned in a -j option, but not found in any input file
/home/se-lab/heptane/heptane_svn/CROSS_COMPILERS/ARM/bin/arm-none-eabi-objdump: section '.switch_begin' mentioned in a -j option, but not found in any input file
Heptane extract::Creating Cfg

```

```
$ cd heptane_svn
$ sudo ./analysis.sh fse_obstacle ARM lp_solve
```

```
Heptane Analysis, version 3.1
Reading configuration file
Executing from configuration file

*** Begin analysis for entry point: main
[INFO]	ICacheAnalysis: MUST done: 0.00013
[INFO]	ICacheAnalysis: PS done: 1.2e-05
[INFO]	ICacheAnalysis: MAY done: 7e-05
[INFO]	******** ICACHE: 0.000296
[INFO]	ICacheAnalysis: MUST done: 0.000162
[INFO]	ICacheAnalysis: PS done: 1.1e-05
[INFO]	ICacheAnalysis: MAY done: 8.7e-05
[INFO]	******** ICACHE: 0.000317
[INFO]	******** DATAADDRESS: 0.000851
[INFO]	DcacheAnalysis: MUST done: 0.00016
[INFO]	DcacheAnalysis: PS done: 2e-05
[INFO]	DcacheAnalysis: MAY done: 0.00012
[INFO]	******** DCACHE: 0.000535
[INFO]	DcacheAnalysis: MUST done: 0.00016
[INFO]	DcacheAnalysis: PS done: 1.2e-05
[INFO]	DcacheAnalysis: MAY done: 0.000154
[INFO]	******** DCACHE: 0.000556
[INFO]	******** PIPELINE: 0.004064
IPET method: NOPIPELINE_ICACHE_DCACHE
[INFO]	******** IPET: 0.246208

L1	type ICACHE	references 27	hits 21	misses 6	
L1	type DCACHE	references 6	hits 4	misses 2	
L2	type ICACHE	references 6	hits 3	misses 3	
L2	type DCACHE	references 2	hits 0	misses 2	
[INFO]	******** CACHESTATISTICS: 0.00033
[INFO]	 =======> Total time for the analyses = 0.27708
WCET: 1213
[INFO]	******** SIMPLEPRINT: 5e-06
[INFO]	******** DOTPRINT: 0.693269
[INFO]	******** CODELINE: 0.042132
[INFO]	******** HTMLPRINT: 0.000322
[INFO]	 =======> Total Time = 1.01994

```
Here WCET: 1213 is the result obtained for ProgA(). If there are more number of tasks, analysis is to be performed for each task seperately. To analyse ProgB(), uncomment the function name corresponding to the task in the main() while commenting others.

For instance if WCET result from Heptane is 773. The approximate cycle time for ARM processor is 12ns. WCET is calculated as 773 * 12ns = 0.009ms

For more information refer [heptane](https://team.inria.fr/pacap/software/heptane/)

##### 2.4 Task parameters and critical block details.

Input program is in C language with functions inlined in it. Add a function, void main().

Add task details:
* create_task(task name, function name, priority, period, WCET);

Critical blocks are between GetResource...ReleaseResource. Add critical block details(if present): 
* create_block(line number, function name, lock, number of locks, task priority, WCET of block);

##### 2.5 PePRacer run

Below command should be run from the benchmark folder and provide the path at <input.c>.
```
$ cilly -c -w --save-temps --dodisjoint <input.c> //input programs without library functions
$ cilly -c -w --save-temps -I/<path to folder> --dodisjoint <input.c> //input programs with library functions

```
PePRacer is implemented in the OCaml based C Intermediate Language
(CIL) static analysis framework. The Inliner step in PePRacer uses the
built-in inline pass in CIL while the lockset algorithm and Rules Checker are
implemented as new passes in CIL. 
- cil-develop/src/ext/analysis/analysis.ml- lockset analysis(R6 of section 6.1)
- cil-develop/src/ext/analysis/dataRaceAnalysis.ml- schedulability analysis and disjoint block analysis(R1-R5 of section 6.1)


##### 2.7 Calling existing analysis steps and reuse

If a user wants to extend the tool then the new analysis can be added as a feature to CIL. The normal usage of PePRacer is to detect data races in periodic programs. 
 
```
cilly -c -w --save-temps --dodisjoint <input.c> 

```
"--dodisjoint" will perform worst case response time (WCRT) calculation, schedulability analysis, rule analysis and detects the potentially racy accesses. An alternative way of using PePRacer is when a user only interested in schedulability analysis of periodic program. The schedulability analysis can be performed by giving "--schedulabilityCheck" as shown below:

```
$ cd benchmark
$ sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --dodisjoint --schedulabilityCheck <input.c>

```
###### Sample input-output
```
$ cd benchmark
$ sudo docker run --rm -i -v "$PWD":/data pepracer cilly -c -w --save-temps --dodisjoint --schedulabilityCheck fse_obstacle/fse_obstacle.c 
```
```

Results
No. of tasks: 2
Schedulable - ProgA : WCRT = 0.016000
Schedulable - ProgB : WCRT = 0.025000

...Schedulability Analysis Completed...
```











