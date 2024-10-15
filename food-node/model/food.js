const mongoose = require('mongoose');

const FoodSchema = new mongoose.Schema({
    name : {
        type:String,
        required: [true, "name must not be empty"],
        trim: true,
    },
    country : {
        type:String,
        required: [true, "country must not be empty"],
        trim: true,
    },
    image : {
        type:String,
        required: [true, "image must not be empty"],
        trim: true,
    },
    ingredients : {
        type:Array,
        required: [true, "ingredients must not be empty"],
        trim: true,
    },
    instructions : {
        type:Array,
        required: [true, "instructions must not be empty"],
        trim: true,
    },
    dish:{
        type:String,
        default:"main"
    },
    rates:{
        type:Array,
        default: []
    },
    averagerating:{
        type: Number,
        default: 0 ,
    }
},
{ versionKey: false }
);

module.exports = mongoose.model('Food' , FoodSchema);