#!/usr/bin/env python3

# KW TODO: Replace the sequential computation with parallel
# from multiprocessing import Pools
# pool = Pool(processes=4)
# result = pool.map(runTestsForOneSimpleFile, list_of_simple_files)
# <print result in meaningful way>

import glob # Find *.ob files within assorted file structures
import os # Path methods
import re # Regex
import subprocess # Popen for running tests
import string # Strip whitespace
import sys # Command line arguments and exit
import time # Sleep while compiling
import pdb;

JAR = ""
DIRECTORIES = []
NEUTRAL = False
C_IMPORT = ""
POSITIVE = True
NEGATIVE = True
COMMAND_PREFIX = ""
#COMPILE_C = True
#TIMEOUT = 5000 #Num of iterations of time.sleep(.05) before giving up
#DEBUG = False

#######################################################################
# Runs all tests for Silver's implementation of AbleC
#
# Written by: Kevin Williams
#######################################################################

def printTest(test_type, passed, error, path):
  ## Unified method to show results to user
  text = test_type + "\t" + "- "
  
  if passed:
    text += "PASS:"
  else: # not passed
    text += "FAIL: " + error

  text += "\t"

  text += path

  print(text.expandtabs(20))


def runPositiveTest(testpath, results):
  #global DEBUG
  success = False

  ## Remember where we started
  cur_dir = os.path.abspath('.') + "/"

  ## Remove directory portion of testname
  testname = os.path.basename(testpath)

  #command = 'java -jar ' + JAR + ' ' + ('--debug ' if DEBUG else '') + testname
  command = COMMAND_PREFIX + testpath

  #outputs = subprocess.Popen('java -jar ' + JAR + ' ' + testname, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  outputs = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

  (stdout_output, stderr_output) = outputs.communicate()

#  i = 0
#  while outputs.poll() == None and i < TIMEOUT:
#    time.sleep(.05)
#    i += 1

  #stdout_output = outputs.stdout.readlines()
  #stderr_output = outputs.stderr.readlines()
#  (stdout_output, stderr_output) = outputs.communicate()

#  if i >= TIMEOUT:
#    return_code = 0
#  else: 
#    return_code = outputs.poll()

  if outputs.returncode != 0:
    printTest("Positive test", False, "ERROR", testpath)
    results['positive'][1] = results['positive'][1] + 1
    results['fail']['ERROR'].append(testpath)
    if len(stdout_output) > 0:
      with open(testpath + ".stdout", 'w') as f:
        f.write(stdout_output.decode('utf-8'))
    if len(stderr_output) > 0:
      with open(testpath + ".stderr", 'w') as f:
        f.write(stderr_output.decode('utf-8'))

  elif len(stderr_output) > 0:
    printTest("Positive test", False, "STDERR", testpath)
    results['positive'][1] = results['positive'][1] + 1
    results['fail']["STDERR"].append(testpath)
    if len(stdout_output) > 0:
      with open(testpath + ".stdout", 'w') as f:
        f.write(stdout_output.decode('utf-8'))
    with open(testpath + ".stderr", 'w') as f:
      f.write(stderr_output.decode('utf-8'))

  else:
    printTest("Positive test", True, "", testpath)
    results['positive'][0] = results['positive'][0] + 1
    success = True
  
  return success

 
def runNegativeTest(testpath, results):
  success = False

  ## Remember where we started
  cur_dir = os.path.abspath('.') + "/"


  ## Remove directory portion of testname
  testname = os.path.basename(testpath)

  command = COMMAND_PREFIX + testpath

  outputs = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  
#  stdout_output = outputs.stdout.readlines()
#  stderr_output = outputs.stderr.readlines()

#  i = 0
#  while outputs.poll() == None and i < TIMEOUT:
#    time.sleep(.05)
#    i += 1

#  if i >= TIMEOUT:
#    return_code = 0
#  else: 
#    return_code = outputs.poll()

  (stdout_output, stderr_output) = outputs.communicate()

  if outputs.returncode == 0:
    printTest("Negative test", False, "NO ERROR", testpath)
    ## Fail - Must have errors to pass
    results['negative'][1] = results['negative'][1] + 1
    results['fail']["NO ERROR"].append(testpath)

  elif len(stderr_output) > 0:
    printTest("Negative test", True, "", testpath)
    ## Fail - Errors sent to stderr -> incorrect error.
    results['negative'][0] = results['negative'][0] + 1
    success = True

#  elif i >= TIMEOUT:
#    printTest("Negative test", False, "", testpath)
#    results['negative'][1] = results['negative'][1] + 1
#    results['fail']["TIMEOUT"].append(testpath)

  else: # len(returned_lines) != 0:
    printTest("Negative test", True, "", testpath)
    results['negative'][0] = results['negative'][0] + 1
    success = True
  
  return success

'''
def runCCode(testpath, results):
  global C_IMPORT

  success = False

  ## Check for existence
  if not os.path.exists(testpath):
    printTest("Positive Run C", False, "NO C FILE", testpath)
    results['compile_c'][1] = results['compile_c'][1] + 1
    results['fail']['NO C FILE'].append(testpath)
  else: #os.path.exists(testpath):

    ## Remember where we started
    cur_dir = os.path.abspath('.') + "/"

    ## cd into testname's location
    os.chdir(os.path.dirname(os.path.abspath(testpath)))

    ## Remove directory portion of testname
    testname = os.path.basename(testpath)
    executable = os.path.splitext(testname)[0] + '.a'

    exit_code = os.system('g++ -g ' + testname + ' -o ' + executable + ' ' + C_IMPORT)

    if exit_code != 0:
      printTest("Positive GCC", False, "GCC ERR: " + str(exit_code), testpath)
      results['compile_c'][1] = results['compile_c'][1] + 1
      results['fail']['GCC ERR'].append(testpath)
    else: #exit_code == 0
      printTest("Positive GCC", True, "", testpath)
      results['compile_c'][0] = results['compile_c'][0] + 1

      ## Configure stdin
      stdin_file = os.path.splitext(testname)[0] + '.stdin'
      #print "STDIN FILE:", stdin_file

      stdin_text = ""
      if os.path.exists(stdin_file):
        stdin_text = "< " + stdin_file + " "

      ## Configure stdout
      stdout_file = os.path.splitext(testname)[0] + '.stdout'

      if os.path.exists(stdout_file):
        os.remove(stdout_file)

      ## Run the compiled executable
      outputs = subprocess.Popen('./' + executable + ' ' + stdin_text + ' > ' + stdout_file, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

      ## Not needed; redirected to stdout_file
      #stdout_output = outputs.stdout.readlines()

      stderr_output = outputs.stderr.readlines()

      if len(stderr_output) > 0:
        printTest("Positive Run", False, "STDERR", executable)
        results['run_c'][1] = results['run_c'][1] + 1
        results['fail']['STDERR'].append(testpath)
      else:
        printTest("Positive Run", True, "", testpath)
        results['run_c'][0] = results['run_c'][0] + 1

        expected = os.path.splitext(testname)[0] + '.expected'

        ## Compare stdout_file to .expected
        if not os.path.exists(expected):
          ## stdout file doesn't exist
          if os.path.getsize(stdout_file) == 0:
            ## .expected doesn't exist and no stdout -> Pass
            printTest("Compare Empty", True, "", expected)
            results['expected_cmp'][0] = results['expected_cmp'][0] + 1
          else: #os.path.getsize(stdout_file) != 0
            printTest("Compare Empty", False, "NO .expected FILE", expected)
            results['expected_cmp'][1] = results['expected_cmp'][1] + 1
            results['fail']['NO EXP FILE'].append(testpath)
        else: #os.path.exists(expected)
          if not os.path.exists(stdout_file):
            printTest("Compare Expected", False, "NO STDOUT FILE", stdout_file)
            results['expected_cmp'][1] = results['expected_cmp'][1] + 1
            results['fail']['NO STDOUT FILE'].append(testpath)
          else: #os.path.exists(stdout_file)
            outputs = subprocess.Popen('diff --strip-trailing-cr ' + expected + ' ' + stdout_file, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            comparison = outputs.poll()
            # 0 if identical, 1 if different
            while comparison == None:
              time.sleep(.05)
              comparison = outputs.poll()

            if comparison: #comparison == 1 == Fail in diff
              printTest("Compare Expected", False, "EXP CMP", stdout_file)
              results['expected_cmp'][1] = results['expected_cmp'][1] + 1
              results['fail']["EXP CMP"].append(testpath)
            else: #comparison == 0 == Success in diff
              #pdb.set_trace()
              printTest("Compare Expected", True, "", stdout_file)
              results['expected_cmp'][0] = results['expected_cmp'][0] + 1
              success = True
    os.chdir(os.path.dirname(cur_dir))


  return success
'''

def printResults(results):
  text = ""
  if len(results['fail']) > 0:
    text += '\n'
    text += 'Failures:' + '\n' 
    for fail_group in results['fail']:
      if len(results['fail'][fail_group]) > 0:
        text += '\t' + fail_group + '\n' 
        for f in results['fail'][fail_group]:
          text += '\t\t' + f + '\n' 
  text += '\n' 
  text += 'Positive tests:\n' #'Compile C:' + '\n' 
  text += 'Pass: ' + str(results['positive'][0]) + '\n' #'\t\tPass: ' + str(results['compile_c'][0]) + '\n' 
  text += 'Fail: ' + str(results['positive'][1]) + '\n' #'\t\tFail: ' + str(results['compile_c'][1]) + '\n' 
  text += '\n'
  text += 'Negative tests:\n' #'Run C:' + '\n' 
  text += 'Pass: ' + str(results['negative'][0]) + '\n' #'\t\tPass: ' + str(results['run_c'][0])  + '\n' 
  text += 'Fail: ' + str(results['negative'][1]) + '\n' #'\t\tFail: ' + str(results['run_c'][1])  + '\n' 
#  text += '\n'
#  text += 'Compare expected output:\n'
#  text += 'Pass: ' + str(results['expected_cmp'][0]) + '\n'
#  text += 'Fail: ' + str(results['expected_cmp'][1]) + '\n'
  text += '\n'
  text += 'Summary:' + '\n' 

  total_pass = results['positive'][0] + results['negative'][0]
#               results['compile_c'][0] + results['run_c'][0] +   \
#               results['expected_cmp'][0]

  total_fail = results['positive'][1] + results['negative'][1]
#               results['compile_c'][1] + results['run_c'][1] +   \
#               results['expected_cmp'][1]

  text += 'Pass: ' + str(total_pass) + '\n' 
  text += 'Fail: ' + str(total_fail) + '\n' 

  print(text.expandtabs(12))
  return total_fail

def main():
  global JAR
  global COMMAND_PREFIX
  global DIRECTORIES
  global NEUTRAL
  global C_IMPORT
  global COMPILE_C
  global POSITIVE
  global NEGATIVE

  if "-neutral" in sys.argv:
    NEUTRAL = True
    sys.argv.remove("-neutral")

  if "-positive-only" in sys.argv:
    NEGATIVE = False
    sys.argv.remove("-positive-only")

  if "-negative-only" in sys.argv:
    POSITIVE = False
    sys.argv.remove("-negative-only")

  takeOut = []

  for arg in sys.argv:
    if len(arg) > 3 and arg[:2] == "-I":
      C_IMPORT += arg + ' '
      takeOut.append(arg);
      # Don't remove during the for loop
      #sys.argv.remove(arg)
    if len(arg) > 3 and arg[:2] == "-l":
      C_IMPORT += arg + ' '
      takeOut.append(arg)
  
  # Don't remove during for loop
  for item in takeOut:
    sys.argv.remove(item)
  
      
  if len(sys.argv) > 1:
    JAR = sys.argv[1]
    if JAR.endswith("jar") and not os.path.isfile(JAR):
      print(JAR, "does not exist")
      sys.exit(1)
    if len(sys.argv) > 2:
      DIRECTORIES = sys.argv[2:]
    if JAR.endswith("jar") and 'cygwin' == sys.platform:
      print("Recognize cygwin!")
      JAR = subprocess.check_output("cygpath -w " + JAR, shell=True)
      JAR = string.strip(JAR.replace("\\","\\\\"))
  else:
    print("Please supply commands to run compiler")
    sys.exit(1)

  # it may not actually be a jar, in which case, just execute it directly.
  if JAR.endswith("jar"):
    COMMAND_PREFIX="java -Xss6M -jar " + JAR + " "
  else:
    COMMAND_PREFIX=JAR + " "

  all_tests = []
  ## results[test_type] = [num_pass, num_fail]
  ## results['fail'][fail_type] = [fail_path0, fail_path1, ...]
  #results = {'positive':[0,0], 'negative':[0,0], 'compile_c':[0,0], 'run_c':[0,0], 'expected_cmp':[0,0],
  #           'fail':{"ERROR":[], "NO ERROR":[], "WRONG LINE":[], "STDERR":[], "WRONG ERR":[], "GCC ERR":[], "NO C FILE":[], "NO EXP FILE":[], "NO STDOUT FILE":[], "EXP CMP":[], "NO LINE":[], "TIMEOUT":[]} }
  results = {'positive':[0,0], 'negative':[0,0],
             'fail':{"ERROR":[], "NO ERROR":[], "STDERR":[], "NO LINE":[]} }


  #####################################################################
  # Find all Simple files within PATH_TO_TEST
  #####################################################################
  for directory in DIRECTORIES:
    if not NEUTRAL:
      if POSITIVE:
        for test_dir in glob.glob(os.path.join(directory, "positive/*.c")):
          if not test_dir.endswith(".pp_out.c"):
            all_tests.append(test_dir)
      if NEGATIVE:
        for test_dir in glob.glob(os.path.join(directory, "negative/*.c")):
          if not test_dir.endswith(".pp_out.c"):
            all_tests.append(test_dir)

    else:
      for test_dir in glob.glob(os.path.join(directory, "neutral/*.c")):
        if not test_dir.endswith(".pp_out.c"):
          all_tests.append(test_dir)

  all_tests.sort()

  #####################################################################
  # Run each test
  #####################################################################
  for test in all_tests:
    dirname = os.path.dirname(test)

    if 'negative' in dirname:
      runNegativeTest(test, results)

    elif 'positive' in dirname or 'neutral' in dirname:
      success = runPositiveTest(test, results)

#      if success and COMPILE_C:
#        splitext = os.path.splitext(test)

        ## run gcc on file.c, check for zero value return code
#        test_c = splitext[0] + '.c'
#        runCCode(test_c, results)

    else: # 'negative' not in test and 'positive' not in test
      print("Supertest error, Unknown test:", test)

  final_exit_code = printResults(results)

  sys.exit(final_exit_code)


if __name__ == "__main__":
  main()
