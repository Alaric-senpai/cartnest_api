const general = require('../models/general.model');

exports.listTables = async(req, res) =>{
    try {
        
        const tables = await general.tables();

        res.status(201).json({message: 'tables fetched successfully', tables});
    } catch (error) {
        res.status(500).json({error: error.message})
    }
}

exports.server = async(req, res) =>{
    res.json({message: "CartNest server is working"})
}

exports.users = async (req, res)=>{
    try {
        const users = await general.users();

        res.status(200).json({message: 'Users fetched successfully', users})
    } catch (error) {
        res.status(500).json({error:error.message})
    }
}

exports.listShops = async (req, res) =>{
    try {
        
        const shops = await general.shops();
        if(!shops.success){
            res.status(404).json({ message: shops.message , shops:shops.shops, success:shops.success })
        }
        res.status(200).json({ message: shops.message , shops:shops.shops, success:shops.success })

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error.message
            }
        )   
    }
}

exports.admins = async (req, res)=>{
    try {
        const admins = await general.admins();

        res.status(200).json({message: 'Users fetched successfully', admins})
    } catch (error) {
        res.status(500).json({error:error.message})
    }
}

exports.vendors = async (req, res)=>{
    try {
        const vendors = await general.vendors();

        res.status(200).json({message: 'Users fetched successfully', vendors})
    } catch (error) {
        res.status(500).json({error:error.message})
    }
}

exports.customers = async (req, res)=>{
    try {
        const customers = await general.customers();

        res.status(200).json({message: 'Users fetched successfully', customers})
    } catch (error) {
        res.status(500).json({error:error.message})
    }
}