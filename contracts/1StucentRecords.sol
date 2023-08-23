// SPDX-License-Identifier: MIT

/*Objective - Student Records
In this contract, there will be two entities -
﻿﻿﻿Teacher - Address which will deploy the smart contract.
﻿﻿﻿Student - Addresses whose details will be added
Create a struct to store the student details - struct Student
{
uint roll;
string name;
uint[3] marks;
}
ate
Create all the functions given below - function addRecord(uint _roll,string memory _name,uint[3] memory _marks)
function getRecord(uint _roll)
function deleteRecord(uint_roll)
﻿﻿﻿addRecord()- To add the record of a student;
﻿﻿﻿getRecord() - To get the record of a student. If the record does not exist it throws an error -"Record does not exist"
﻿﻿﻿deleteRecord() - To delete the record of a student;
Note - All these functions can only be called by the teacher of the contract.
*/

pragma solidity >=0.8.2 <0.9.0;

contract StudentRecord{
    address public teacher;
    struct Student{
        uint roll;
        string name;
        uint[3] marks;
    }
    mapping(uint => Student) public students;

    constructor(){
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this operation");
        _;
    }




    function addRecord(uint _roll, string memory _name, uint[3] memory _marks) public onlyTeacher {
        students[_roll] = Student(_roll, _name, _marks);
    }

    function getRecord(uint _roll) public view returns (uint, string memory, uint[3] memory){
        Student storage student = students[_roll];
        require(student.roll != 0 , "Record does not exits");
        return(student.roll, student.name, student.marks);
    }

    function deleteRecord(uint _roll) public onlyTeacher{
        require(students[_roll].roll != 0 , "Record does not exist");
        delete students[_roll];
    }

}


