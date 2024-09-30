const express = require('express');
const app = express();
const connection = require('./db/connection');
const food = require('./routes/food');
const statusUtils = require('./utils/status');
app.use(express.json())

require('dotenv').config();

const port = 3000;

app.use('/api/food' , food);


const connect = async () =>  {
    try {
        await connection(process.env.MONGO_URI);
        app.listen(port, () => console.log(`Listening on port ${port}`));
    } catch (e) {
        console.error('Error starting server:', e);
    }
}

app.all('*',(req,res,next)=>{
    res.status(404).json({status:statusUtils.ERROR,msg:"no rout found"});
});

app.use((e,req,res,next)=>{
    res.status(e.statusCode || 500).json({status:e.statusText || statusUtils.ERROR , msg:e.message})
});

connect();