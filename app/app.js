import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose';
import retelimit from 'express-rate-limit';
import helmet from 'helmet';
import cookieparser from 'cookie-parser';
import hpp from 'hpp';
//import * as path from 'path';
import router from '../app/routes/api.js';
import {MONGODB_CONNECTION,/*path,*/MAX_JSON_SIZE,URL_ENCODED,WEB_CACHE,REQUEST_LIMIT_NUMBER,REQUEST_LIMIT_TIME} from "../app/Config/config.js";
const app =express();
app.use(cors());
app.use(express.json({limit:MAX_JSON_SIZE}));
app.use(express.urlencoded({extended:URL_ENCODED}));
app.use(hpp());
app.use(helmet());
app.use(cookieparser());
const limiter = ratelimit({windowMS:REQUEST_LIMIT_TIME,max:REQUEST_LIMIT_NUMBER});
app.use(limiter);
app.set('etag',WEB_CACHE);
app.use("/api".routes);
app.use(express.static('storage'));
app.listen(PORT,()=>{
    console.log('App running on port $ {PORT}');
})