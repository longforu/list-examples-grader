CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# check that there is a ListExamples file
if [ -f ./student-submission/ListExamples.java ]; then
  cp  -r ./student-submission/. ./grading-area
  cp -r ./lib/. ./grading-area
  cp ./TestListExamples.java ./grading-area/TestListExamples.java
  echo "Done copying"

  # after copying the file, test the thing
  set +e
  
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar ./grading-area/*.java 2> ./report.txt

  if [ $? -ne 0 ]; then
    cat ./report.txt
    echo "Your files failed to compile"
    echo "Your files failed to compile." >> ./report.txt
    exit
  fi

  cd ./grading-area
  java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > ../report.txt
  cd ../

else
  echo "File does not exist."
  echo "File does not exist." > ./report.txt
  exit
fi

cat ./report.txt
