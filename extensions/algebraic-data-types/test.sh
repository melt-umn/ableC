#!/bin/bash

PassMsg="passed"
FailMsg="failed"
AllPassed=1

echo "----------------------------------------------------------------------"
echo "-- Testing edu:umn:cs:melt:exts:ableC:adt                           --"
echo "----------------------------------------------------------------------"

echo "test: ./build --clean --warn-all"

rm -f build.test.out
./build --clean --warn-all &> build_test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi

echo ""
echo "test: java -jar ableC.jar example1-expr-eval.xc"

rm -f ableC_example_1.test.out
java -jar ableC.jar example1-expr-eval.xc &> ableC_example_1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: gcc example1-expr-eval.pp_out.c"

rm -f gcc_example_1.test.out
gcc example1-expr-eval.pp_out.c &> gcc_example_1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: ./a.out"

rm -f run_example_1.test.out
./a.out &> run_example_1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi




echo ""
rm -f TESTS_FAILED
if [ ${AllPassed} = 1 ]; then
    echo "All tests passed."
else
    echo "Some tests failed."
    touch TESTS_FAILED
fi

