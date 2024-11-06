import express from "express";
const router = express.Router();
import * as Blogcontroller from "../controllers/Blogcontrollers.js";
//Create Route
router.post("/Create-blog",Blogcontroller.CreatBlog);
//Read Route
router.get("/Reade-blog",Blogcontroller.ReadBlog);
//Update Route
router.put("/Update-blog",Blogcontroller.UpdateBlog);
//Delete Route
router.delete("/Delete-blog",Blogcontroller.DeleteBlog);
export default  router;