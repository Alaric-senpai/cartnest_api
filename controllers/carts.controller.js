const cartsModel = require('../models/carts.model')

exports.newCart = async(req, res)=>{
    const { name, imageurl } = req.body.data;


    const user = req.user
    const userid = user.userid

    try {
        
        const cart = await cartsModel.newcart(name, userid, imageurl)

        if(!cart.success){
            return res.status(400).json(
                {
                    message: cart.message,
                    success: cart.success
                }
            )
        }
        return res.status(200).json(
            {
                message: cart.message,
                success: cart.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error:error.message
            }
        )
    }
}

exports.myCarts = async(req, res)=>{
    const user = req.user
    const userid = user.userid
    try {
        
        const carts = await cartsModel.myCarts(userid)

        if(!carts.success){
            return res.status(400).json(
                {
                    message: carts.message,
                    success:carts.success
                }
            )
        }

        return res.status(200).json(
            {
                message: carts.message,
                carts:carts.carts,
                success:carts.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error:error
            }
        )
    }
}

exports.cartdata = async(req, res)=>{
    try {
        
        const params = req.query

        const cartid = params.cart 
        const cart = await cartsModel.cartInfo(cartid)

        if(cart.success){
            return res.status(200).json(cart)
        }
        return res.status(400).json(cart)

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error
            }
        )
    }
}

exports.addtocart = async(req, res)=>{
    // const { product, vendor , quantity, cart } = req.body

    const user = req.user


    const  { quantity, product, vendor, cart  } = req.body

    const userid = user.userid
    // console.log(req.body)

    // console.log(userid)

    try {
        
        const good = await cartsModel.addTocart(userid, cart, product, vendor, quantity)

        if(!good.success){
            return res.status(400).json(
                {
                    message: good.message,
                    success:good.success
                }
            )
        }
        return res.status(200).json(
            {
                message: good.message,
                success:good.success
            }
        )

    } catch (error) {
        console.error(error)
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error
            }
        )
    }
}

exports.cartGoods = async(req, res)=>{
    const params = req.query
    const user = req.user
    const userid = user.userid
    const cart_id = params.cart_id

    try {
        
        const goods = await cartsModel.cartGoods(userid,cart_id)

        if(!goods.success){
            return res.status(400).json(
                {
                    message: goods.message,
                    success:goods.success
                }
            )
        }

        return res.status(200).json(
            {
                message: goods.message,
                products: goods.products,
                success:goods.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error
            }
        )
    }
}

exports.deletecart = async(req, res)=>{
    const params = req.query

    const cart_id = params.cart_id;

    const user = req.user
    const userid = user.userid

    try{
        const deletecart = await cartsModel.deletecart(userid, cart_id)

        if(!deletecart.success){
            return res.status(400).json(
            {
                message: deletecart.message,
                success:deletecart.success
            })
        }

        return res.status(200).json(
        {
            message: deletecart.message,
            success:deletecart.success
        })
    } catch(error){
        return res.status(500).json(
        {
            message: 'Internal server error',
            error:error.message
        })
    }
}


exports.ProductQuantity = async(req, res)=>{
    const { cart, product, quantity} = req.body
    console.log(req.body)
    const user = req.user
    const userid = user.userid

    try{
    const result = await cartsModel.ModifyGood(cart, quantity, userid, product)


    if(result.success){
        return res.status(200).json({ message: result.message, success:result.success })
    }
        return res.status(400).json({ message: result.message, success:result.success })


    } catch ( error){
        return res.status(500).json({ message: 'Internal server error', success:false , error:error })

    }
}

exports.Removeproduct = async(req, res)=>{
    const params = req.query;
    const cart = params.cart
    const product = params.product

    try{
    const result = await cartsModel.RemoveProduct(cart, product)

    if(result.success){
        return res.status(200).json({ message: result.message, success:result.success })
    }
        return res.status(400).json({ message: result.message, success:result.success })


    } catch ( error){
        return res.status(500).json({ message: 'Internal server error', success:false , error:error })

    }
}