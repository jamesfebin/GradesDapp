pragma solidity ^0.4.18;

contract Grades{

  mapping (bytes32 => string) public grades;
  bytes32[] public studentList;

  function Grades(bytes32[] studentNames) public {
    studentList = studentNames;
  }

  function getGradeForStudent(bytes32 student) view public returns (string) {
    require(validStudent(student));
    return grades[student];
  }

  function giveGradeToStudent(bytes32 student, string grade) public {
    require(validStudent(student));
    grades[student] = grade;
  }

  function validStudent(bytes32 student) view public returns (bool) {
    for(uint i = 0; i < studentList.length; i++) {
      if (studentList[i] == student) {
        return true;
      }
    }
    return false;
   }
}
