//Create
export const CreatBlog = async (req, res)=>{
    return res.json({message:`Blog created successfully`});
}
//Read
export const ReadBlog = async (req, res)=>{
    return res.json({message:`Blog read successfully`});
}
//Update
export const UpdateBlog = async (req, res)=>{
    return res.json({message:`Blog update successfully`});
}
//Delete
export const DeleteBlog = async (req, res)=>{
    return res.json({message:`Blog delete successfully`});
}