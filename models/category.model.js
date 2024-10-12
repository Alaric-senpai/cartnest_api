const pool = require('../config/db.config')


// create a new category 
exports.createCategory = async(category_name, longname, description) =>{
    try {
        const conn = await pool.getConnection();

        const result =  await conn.query(
            "insert into categories(category_name, longname, description) values(?, ?,?)",
            [category_name, longname, description]
        )

        conn.release();

        if(result){
            return { message: 'Category added successfully', success:true }
        }

        return { message: 'Category not added', success:false };
    } catch (error) {
        throw error
    }
}

// list all categories 

exports.allCategories = async() =>{
    try {
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from categories"
        )

        conn.release()

        return result
    } catch (error) {
        throw error;
    }
}

// get specific category

exports.getCategoryById = async (id) =>{
    try {
        const conn = await pool.getConnection();
        const result = await conn.query(
            "select * from categories where id=?",
            [id]
        );
        conn.release();

        if(result.length == 0){
            return { message: 'Category not found', success: false }
        }

        return { message: 'Category found', category:result[0], success:true }
    } catch (error) {
        throw error;
    }
}

exports.deletecategory = async (id) =>{
    try {
        const category =  await this.getCategoryById(id);

        if(!category.success){
            return { message: "Category not found", success:false };
        }

        const conn = await pool.getConnection();

        const result = await conn.query(
            "delete  from categories where id=?", [id]
        )

        conn.release()
        if(!result){
            return { message: "Category delete failed", success:false }
        }
        return { message: 'Category deleted successfully', success:true }

    } catch (error) {
        
        throw error;

    }
}