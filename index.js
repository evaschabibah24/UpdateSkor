const express = require('express');
const app = express();
const controllers = require('./controllers');
const bodyParser = require('body-parser');

app.use(express.static('public'));

app.use(bodyParser.json())
.use(bodyParser.urlencoded({
extended: true
}));

app.get('/', (req, res) => {
res.send('Hello World !')
})

app.set('view engine', 'ejs');

app.use(express.static('public'));

app.use('/', controllers);

app.listen(3000, () => {
console.log('Server is running on http://localhost:3000');
});