const express = require('express');
const router = express.Router();
const { addFood , getAllFood , deleteFood , editFood, searchFood , rateFood , avgRating} = require('../controllers/food');


router.route('/').post(addFood).get(getAllFood);
router.route('/:id').delete(deleteFood).patch(editFood);
router.route('/rate/:id').post(rateFood);
router.route('/search').get(searchFood);
router.route('/avgrating/:id').get(avgRating);


module.exports = router;