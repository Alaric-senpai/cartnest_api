const brandModel = require('../models/brands.model')

exports.newBrand = async(req, res) =>{
    const {name} = req.body;

    try {
        const result = await brandModel.createBrand(name);

            return res.status(201).json({message: 'Brand created successfully'})

    } catch (error) {
        return res.status(500).json({message: 'Brand creation failed', error:error.message})
    }
}

exports.brandsList = async (req, res) =>{
    try {
        
        const brands = await brandModel.getBrands();

        return res.status(200).json({message: 'Brands fetched successfully', brands})

    } catch (error) {
        return res.status(500).json({message: "error occured", error: error.message})
    }
}

exports.getBrandById = async (req, res) => {
    const  brand_id  = req.query.brand_id;

    try {
        // Fetch brand data using the model method
        const brand = await brandModel.getBrandById(brand_id);

        // If brand is found, respond with the brand details
        if (brand.success) {
            return res.status(200).json({
                brand: brand.result,
                message: brand.message,
                success: brand.success
            });
        }

        // If brand is not found, send a 404 response
        return res.status(404).json({
            message: 'Brand not found',
            success: false
        });

    } catch (error) {
        // Handle any server or unexpected errors
        return res.status(500).json({
            error: 'Internal Server Error',
            details: error.message
        });
    }
};
