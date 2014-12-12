from __future__ import with_statement
import os
import glob
import sys
import argparse
 
def compiling(direc):
	names = []
	failed = []
	passed = []
	gcc_passed = []
	gcc_failed = []

	path = "/yolo-bear/mikec/tests/" + direc + "/"

	# get all file name
	for file in glob.glob(path + "*.mc"):
		file_name = os.path.basename(file)
		name = file_name.split('.')
		names.append(name[0])
	
	# microc all files
	print "Running microC on all files in "+direc
	for i in names:
		os.system("./microc -C < tests/" + direc + "/" + str(i) + ".mc >" + path + str(i) + ".c")

	# check the first lines of output *.c files for error
	print "Checking files that failed microC..."
	for i in names:
  			if os.stat( path + i + ".c")[6] == 0:
  				failed.append(i)
  			else:
  				passed.append(i)

  	# print which files failed microc and what they do
	for i in failed:
		with open(path + i + '.mc', 'r') as f:
  			first_line = f.readline()
  			print i + " Failed microc"
  			print first_line

  	# print which files passed microc and what they do
  	for i in passed:
		with open(path + i + '.mc', 'r') as f:
  			first_line = f.readline()
  			print i + " passed microc"
  			print first_line

  	# gcc passed files
  	print "Running gcc..."
	for i in passed:
		os.system("gcc -g3 -o3 " + path + str(i) + ".c -o " + path + str(i) + ".out 2>" + path + i +"_gccerror.txt")

	# check for gcc errors
	print "Checking for gcc errors..."
	for i in passed:
		if os.stat(path + i +"_gccerror.txt")[6] != 0:
			gcc_failed.append(i)
		else:
			gcc_passed.append(i)

	# print the names that passed gcc and what they do. Remove their error log
	for i in gcc_passed:
		with open(path + i + '.c', 'r') as f:
  			first_line = f.readline()
  		print i+".c passed GCC"
  		print first_line
  		os.system("rm -f -r "+ path + i + "_gccerror.txt")

  	# print names that failed gcc and what they do
  	for i in gcc_failed:
		with open(path + i + '.c', 'r') as f:
  			first_line = f.readline()
  		print i+".c failed GCC"
  		print first_line

  	# execute gcc executables
  	print "Executing files..."
	for i in gcc_passed:
		os.system( path + str(i) +".out >"+ path + str(i)+"_gcc_out.txt")

	# check difference in output
	print "Checking for difference in output..."
	for i in gcc_passed:
		os.system("diff -b " + path + str(i) + "_gcc_out.txt " + path + str(i) + ".txt > " + path + str(i) + "_diff.txt")

	# print if output is different remove log otherwise
	for i in gcc_passed:
		if os.stat( path + i + "_diff.txt")[6] != 0:
			print i+" has a different output"
		else:
			os.system("rm -f -r " + path + i + "_diff.txt")

def semantic(direc):
	names = []
	failed = []
	passed = []
	
	path = "/yolo-bear/mikec/tests/" + direc + "/"

	# get all file name
	for file in glob.glob(path + "*.mc"):
		file_name = os.path.basename(file)
		name = file_name.split('.')
		names.append(name[0])
	
	# run semantic check on all files
	print "Running Semantic Check..."
	for i in names:
		os.system("./microc -s < tests/" + direc + "/" + str(i) + ".mc 2>" + path + str(i) + "_semantic.txt")

	print "Checking files that failed..."
	for i in names:
  			if os.stat( path + i + "_semantic.txt")[6] != 0:
  				failed.append(i)
  			else:
  				passed.append(i)

  	for i in failed:
		print i + " Failed Semantic Check\n"

	for i in passed:
  		print i + " passed Semantic Check\n"
  		os.system("rm -f -r " + path + i + "_semantic.txt")


if __name__ == "__main__":
	parser = argparse.ArgumentParser(description  = 'Test Script')
	parser.add_argument('--Compile', '-c', help = 'Compile all tests')
	parser.add_argument('--Semantic', '-s', help = 'Do Semantic Check')
	args = parser.parse_args()
	#print args#.Directory
	if not (args.Compile or args.Semantic):
		parser.error('No action requested, add -Compile or -Semantic')
	elif args.Compile:
		direct = args.Compile
		compiling(direct)
	else:
		direct = args.Semantic
		semantic(direct)
	
