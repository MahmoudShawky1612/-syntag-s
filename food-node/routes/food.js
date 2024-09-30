const express = require('express');
const router = express.Router();
const { addFood , getAllFood , deleteFood , editFood, searchFood } = require('../controllers/food');


router.route('/').post(addFood).get(getAllFood);
router.route('/:id').delete(deleteFood).patch(editFood);
router.route('/search').get(searchFood);

module.exports = router;