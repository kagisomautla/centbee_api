var mysql = require('mysql');
var app = require('express')();
const bodyparser = require('body-parser');
const cors = require('cors');

app.use(bodyparser.urlencoded({extended:false}));
app.use(bodyparser.json());
app.use((req, res, next)=>{
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers','*');

    if(req.method === 'OPTIONS'){
        res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
        return res.status(200).json({});
    }
    next();
})

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'centbee'
});

connection.connect(function(error){
    if(!!error){
        console.log('Error');
    }else{
        console.log('Connected to the server');
    }
});

app.listen(3000, ()=>console.log('CORS-enabled and Express Server is running on localhost:3000'));

//get all employees
app.get('/employees', function(req, res){
    connection.query("SELECT * FROM employees", function(error, rows, field){
        
        if(!!error){
            console.log('Error in query');
        }else{
            console.log('Successful query');
            console.log(rows);
            res.send(rows);
        }
    }); 
});

//get employees based on Id
app.get('/employees/:id', function(req, res){
    connection.query('SELECT * FROM Employees WHERE empId = ?',[req.params.id], function(error, rows, field){
        
        if(!!error){
            console.log('Error in query');
            res.send(error);
        }else{
            console.log('Successful query');
            console.log(rows);
            res.send(rows);
        }
    }); 
});

//delete employees based on Id
app.delete('/employees/:id', function(req, res){
    connection.query('DELETE FROM Employees WHERE empId = ?',[req.params.id], function(error, rows, field){
        
        if(!!error){
            console.log('Error in query');
            res.send(error);
        }else{
            console.log('Successful query');
            console.log(rows);
            res.send('Deleted Successfully!');
        }
    }); 
});

var insertEmpQuery = 'INSERT INTO Employees(name,surname,occupation) values(?,?,?)';
var updateEmpQuery = 'UPDATE Employees SET ? WHERE empId=?';

app.post('/employees', function(req, res){
    connection.query(insertEmpQuery,[req.body.name,req.body.surname,req.body.occupation], (error, response)=>{

        if(!error){
            console.log('Record successfully added!');
            res.send('Record successfully added!'); 
        }else{
            console.log(
                'Failed to insert record.');
                throw error;
        }
    });
});

app.put('/employees/:id', function(req, res){
    connection.query(updateEmpQuery,[req.body,req.params.id], function(error, response, rows, fields){

        if(!error){
            console.log('Record succesfully updated!');
            console.log(rows);
            res.send('Record succesfully updated!');
            console.log(response.affectedRows + " record(s) updated");
        }else{
            console.log('Failed to update record.');
            res.send(error);
        }
    });
});