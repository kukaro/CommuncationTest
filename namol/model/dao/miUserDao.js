var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'www.theceres.net',
    post: 3306,
    user: 'root',
    password: 'root',
    database: 'midb'
});

connection.connect();


this.selectAll = (callback) => {
    var sql = 'select * from mi_user';
    connection.query(sql, (err, rows, fields) => {
        if (!err) {
            callback(rows);
        }
    });
};

this.selectOne = (email, callback) => {
    var sql = 'select * from mi_user where email=?';
    connection.query(sql, email, (err, rows, fields) => {
        if (!err) {
            callback(rows);
        }
    })
};
