const Food = require('../model/food');
const statusUtils = require('../utils/status');
const appError = require('../utils/appError');
const asyncWrapper = require('../middleware/asyncWrapper');
const collect = require('collect.js'); 



const addFood =  asyncWrapper ( async ( req , res , next ) => {
    try {
        const { name , country , image , ingredients , instructions , dish} = req.body;
        const food = await Food.create({
        name,
        country,
        image,
        ingredients,
        instructions,
        dish
    });

    res.status(200).json({ success: statusUtils.SUCCESS , data: { food } });

    } catch (e) {

        res.status(500).json({
            message: 'Failed to add Food',
            error: e.message,
        });
        
    }
});

const getAllFood = async (req , res ) => {
    const food = await Food.find({});
    if(!food){
        res.status(500).json({
            message: 'Failed to get Food',
            error: e.message,
        });
    }
    res.status(200).json({ success: statusUtils.SUCCESS , data: { food } });
};


const deleteFood = asyncWrapper (async ( req , res , next ) => {
    const id = req.params.id ; 
    const food = await Food.findByIdAndDelete({_id:id});
    if(!food){
        return res.status(500).json({
            message: 'Failed to delete Food',
            error: e.message,
        });
    }
    res.status(200).json({ success: statusUtils.SUCCESS , data: { food } });
});

const editFood = asyncWrapper (async ( req , res ) => {
    const id = req.params.id.trim() ; 
    const food = await Food.findByIdAndUpdate(id , req.body, {
        new: true,
        runValidators: true,
    });

    // if(!food){
    //     res.status(500).json({
    //         message: 'Failed to edit Food',
    //         error: e.message,
    //     });
    // }
    res.status(200).json({ success: statusUtils.SUCCESS , data: { food } });
});

const searchFood =asyncWrapper ( async (req,res,next) => {
    const foodName = req.query.foodName;

    if (!foodName) {
        const e = appError.create(
          "Food name is required",
          400,
          statusUtils.FAIL
        );
        return next(e);
      }

      const food = await Food.find({name : { $regex: foodName, $options: "i" }});

      if (!food || food.length === 0) {
        const e = appError.create(
          "No Food found matching that pattern",
          404,
          statusUtils.FAIL
        );
        return next(e);
      };

      res.status(200).json({ success: statusUtils.SUCCESS, data: { food } });
});

const rateFood = asyncWrapper(async(req,res,next)=>{
    const id = req.params.id.trim();
    const rates = req.body;
    const food = await Food.findByIdAndUpdate(
        id,
        { $push: rates },
        {
        new: true,
        runValidators: true,
        }
    );
    
    const ratings = food.rates;
    let average = collect(ratings).average();

    await Food.findByIdAndUpdate(id, { $set: { averagerating: average }}, {
        new: true,
        runValidators: true,
    });

    res.status(200).json({ success: statusUtils.SUCCESS , data: { food } });
})

const avgRating =  asyncWrapper(async(req,res)=>{
    const id = req.params.id.trim();
    const food = await Food.findById(id);
    const ratings = food.rates;
    let average = collect(ratings).average();
    
    await Food.findByIdAndUpdate(id, { $set: { averagerating: average }}, {
        new: true,
        runValidators: true,
    });

    res.status(200).json({ success: statusUtils.SUCCESS , data: {average}});
})

module.exports = {
    addFood,
    getAllFood,
    deleteFood,
    editFood,
    searchFood,
    rateFood,
    avgRating
};