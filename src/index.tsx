import express from 'express';


const app = express();
const port = 3000


// a simple HTTP get method just to expose that the server is running on port 3000
app.get('/', (req, res) => {
	
	res.send('Multi-staging a NodedJS application');
});


app.listen(port, () => {

	console.log('Server running on port ${port}');

});




