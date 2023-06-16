const express = require('express');
const router = express.Router();
const mysql = require('mysql2');


const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'itsklasemen',
});

router.get('/klasemen', (req, res) => {
    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error connecting to the database: ', err);
            res.status(500).send('Internal Server Error');
        } else {
            //Query get data peserta
            const klasemenQuery = 'SELECT * FROM peserta';

            //Query get data pertandingan
            const pertandinganQuery = 'SELECT * FROM pertandingan';

            connection.query(klasemenQuery, (err, pesertaData) => {
                if (err) {
                    console.error('Error executing the klasemen query: ', err);
                    res.status(500).send('Internal Server Error');
                } else {


                    // Operasi reduce untuk mengelompokkan peserta berdasarkan grup 
                    const groupedPeserta = pesertaData.reduce((grouped, peserta) => {
                        //Cek grup peserta, masukkan ke dalam array object 
                        if (!grouped[peserta.grup]) {
                            grouped[peserta.grup] = [];
                        }
                        grouped[peserta.grup].push(peserta);
                        return grouped;
                    }, {});

                    //Mapping ke variabel klasemen untuk render
                    const klasemen = Object.keys(groupedPeserta).map((grup) => ({
                        grup,
                        peserta: groupedPeserta[grup],
                    }));

                    connection.query(pertandinganQuery, (err, pertandinganData) => {
                        if (err) {
                            console.error('Error executing the pertandingan query: ', err);
                            res.status(500).send('Internal Server Error');
                        } else {

                            // Operasi reduce untuk mengelompokkan pertandingan
                            const groupedPertandingan = pertandinganData.reduce((grouped, pertandingan) => {
                                //Cek grup pertandingan, masukkan kedalam array object 
                                if (!grouped[pertandingan.grup]) {
                                    grouped[pertandingan.grup] = [];
                                }
                                grouped[pertandingan.grup].push(pertandingan);
                                return grouped;
                            }, {});

                            //Mapping ke variabel jadwal pertandingan untuk render
                            const jadwal = Object.keys(groupedPertandingan).map((grup) => ({
                                grup,
                                pertandingan: groupedPertandingan[grup],
                            }));


                            // Render halaman dan kirim variabel klasemen dan jadwal
                            res.render('klasemen', { klasemen, jadwal });
                        }

                        connection.release();
                    });
                }
            });
        }
    });
});


// Update Klasemen Controller
router.post('/klasemen/:id', (req, res) => {
    const { menang, kalah } = req.body;
    const { id } = req.params;
    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error connecting to the database: ', err);
            res.status(500).send('Internal Server Error');
        } else {

            //Query update data klasemen / peserta
            const query = 'UPDATE peserta SET menang = ?, kalah = ? WHERE id = ?';
            connection.query(query, [menang, kalah, id], (err, result) => {
                if (err) {
                    console.error('Error executing the query: ', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    console.log('Update successful');
                    // Kembali ke halaman klasemen
                    res.redirect('/klasemen');
                }


                connection.release();
            });
        }
    });
});

// Update Pertandingan Controller
router.post('/jadwal/:id', (req, res) => {
    const { skor_peserta_1, skor_peserta_2, meja, jam } = req.body;
    const { id } = req.params;

    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error connecting to the database: ', err);
            res.status(500).send('Internal Server Error');
        } else {
            //Query update data pertandingan
            const query = 'UPDATE pertandingan SET skor_peserta_1 = ?, skor_peserta_2 = ?, meja = ?, jam = ? WHERE id = ?';
            connection.query(query, [skor_peserta_1, skor_peserta_2, meja, jam, id], (err, result) => {
                if (err) {
                    console.error('Error executing the query: ', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    console.log('Update successful');
                    //Kembali ke halaman klasemen
                    res.redirect('/klasemen');
                }

                connection.release();
            });
        }
    });
});

router.get("/", (req, res)=>{ 
    res.redirect("/klasemen");
})

module.exports = router;

