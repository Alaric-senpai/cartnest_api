
const categoryModel = require('../models/category.model')


exports.newCategory = async (req, res)=>{
    const { category_name, description, longname } = req.body;

    try {
        const category = await categoryModel.createCategory(category_name, longname, description);



        res.status(200).json({message: category.message, success:category.success})

    } catch (error) {
        res.status(500).json({error: 'Internal server error', details:error.error})
    }
}

exports.categorylist = async (req, res)=>{
    try {
        
        const categories = await categoryModel.allCategories();

        res.status(200).json({message:"Categories fetched", categories})

    } catch (error) {
        res.status(500).json({message:error.message, error:error.error})
    }
}

exports.categoryById = async (req, res) =>{
    const { category_id } = req.body;

    try {
        
        const category = await categoryModel.getCategoryById(category_id);

        if(category.success){
            return res.status(200).json(
                {
                    message: category.message,
                    category: category.category,
                    success:category.success
                }
            )
        }
        return res.status(404).json(
            {
                message: category.message,
                success:false
            }
        )
    } catch (error) {
        return res.status(500).json(
            {
                error: 'Internal server error',
            }
        )
    }
}

exports.deleteCategory = async(req, res)=>{
    const {category_id} = req.body

    try {
        
        const deletecat = await categoryModel.deletecategory(category_id);
    
        if(deletecat.success){
            return res.status(200).json({ message: deletecat.message, success:deletecat.success })
        }

        return res.status(404).json({ message:deletecat.message, success:deletecat.success })

    } catch (error) {
        return res.status(500).json({
           message: 'Internal server error',
           error: error.message 
        })
    }

}