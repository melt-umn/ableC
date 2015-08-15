#!/bin/bash

PassMsg="passed"
FailMsg="failed"
AllPassed=1

echo "----------------------------------------------------------------------"
echo "-- Testing edu:umn:cs:melt:exts:ableC:closure"
echo "----------------------------------------------------------------------"

if [[ $@ =~ "--no-build" ]]; then
    echo "Not building the AbleC artifact."
else
    echo "test: ./build.sh --clean --warn-all"

    rm -f build.test.out
    ./build.sh --clean --warn-all &> build.test.out

    if [ $? == 0 ]; then
	echo ${PassMsg}
    else
	echo ${FailMsg}
	AllPassed=0
    fi
fi


# to gain access to the 'gc' library
export C_INCLUDE_PATH=/project/melt/Software/ext-libs/usr/local/include
export LIBRARY_PATH=/project/melt/Software/ext-libs/usr/local/lib

echo ""
echo "test: java -jar ableC.jar example1.xc"

rm -f ableC_example_1.test.out
java -jar ableC.jar example1.xc  -Iinclude  &> ableC_example_1.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: gcc example1.pp_out.c"

rm -f gcc_example_1.test.out
gcc example1.pp_out.c -lgc &> gcc_example_1.test.out

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


exit 1

# complete for rest of gc tests!

echo ""
echo "test: java -jar ableC.jar example2-type-errors.xc"

rm -f ableC_example_2.test.out
java -jar ableC.jar example2-type-errors.xc &> ableC_example_2.test.out

if [ $? != 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi




echo ""
echo "test: java -jar ableC.jar example3-corrected.xc"

rm -f ableC_example_3.test.out
java -jar ableC.jar example3-corrected.xc &> ableC_example_3.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: gcc example3-corrected.pp_out.c"

rm -f gcc_example_3.test.out
gcc example3-corrected.pp_out.c &> gcc_example_3.test.out

if [ $? == 0 ]; then
    echo ${PassMsg}
else
    echo ${FailMsg}
    AllPassed=0
fi


echo ""
echo "test: ./a.out"

rm -f run_example_3.test.out
./a.out &> run_example_3.test.out

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

